#include "http/httpSession.h"
#include "http/httpParser.h"

namespace GGo{
namespace HTTP{

HTTPSession::HTTPSession(Socket::ptr socket, bool isOwner)
    :SocketStream(socket, isOwner)
{
}
HTTPRequest::ptr HTTPSession::recvRequest()
{
    HTTPRequestParser::ptr parser(new HTTPRequestParser);
    uint64_t buffer_size = HTTPRequestParser::getHTTPRequestBufferSize();

    std::shared_ptr<char> buffer(new char[buffer_size], [](char* ptr){
        delete[] ptr;
    });
    char* data = buffer.get();
    int offset = 0;
    do{
        int recved_length = read(data + offset, buffer_size - offset);
        if(recved_length < 0){
            close();
            return nullptr;
        }
        recved_length += offset;
        size_t parsed_length = parser->excute(data, recved_length);
        if(parser->hasError()){
            close();
            return nullptr;
        }

        offset = recved_length - parsed_length;
        if(offset == (int)buffer_size){
            close();
            return nullptr;
        }
        if(parser->isFinished()){
            break;
        }

    }while(true);
    
    int64_t content_length = parser->getContentLength();
    
    if(content_length > 0){
        std::string body;
        body.resize(content_length);

        int len = 0;
        if(len >= offset){
            memcpy(&body[0], data, offset);
            len = offset;
        }else{
            memcpy(&body[0], data, content_length);
            len = content_length;
        }
        content_length -= offset;
        if(content_length  > 0){
            if(readFixSize(&body[len], content_length) <= 0){
                close();
                return nullptr;
            }
        }
    }

    parser->getData()->init();
    return parser->getData();

}
int HTTPSession::sendResponse(HTTPResponse::ptr response)
{
    std::stringstream ss;
    ss << response->toString();
    std::string data = ss.str();
    return writeFixSize(data.c_str(), data.size());
}

}

}