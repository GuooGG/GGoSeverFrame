#include"util.h"


namespace GGo{
    
pid_t GetThreadID()
{
    return syscall(SYS_gettid);
}

uint32_t GetFiberID()
{
    //TODO::返回协程ID
    return 0;
}


void FSUtil::listAllFile(std::vector<std::string> &files, const std::string &path , const std::string &subfix)
{
    //检查路径是否存在
    if(access(path.c_str(),F_OK)){
        return;
    }
    DIR* dir = opendir(path.c_str());
    //检查目录是否能打开
    if(dir == nullptr){
        return;
    }
    dirent* dp = nullptr;
    while((dp = readdir(dir)) != nullptr){
        if(dp->d_type == DT_DIR){
            //DT_DIR目录文件
            if((!strcmp(dp->d_name,"."))||(!strcmp(dp->d_name,".."))){
                //如果是当前目录和父目录则跳过
                //TODO::strcmp(s1,s2)相等返回0，s1>s2返回正数
                continue;
            }
            //如果是普通目录，列出递归列出其中的文件
            listAllFile(files,path + "/" + dp->d_name, subfix);
        }else if(dp->d_type == DT_REG){
            //DT_REG 常规文件
            std::string fielname(dp->d_name);
            if(subfix.empty()){
                files.push_back(path + "/" + fielname);
            }else{
                if(fielname.size() < subfix.size()){
                    continue;
                }
                if(fielname.substr(fielname.length()-subfix.size()) == subfix){
                    //如果文件类型和给定类型相同则加入列表
                    files.push_back(path + "/" + fielname);
                }
            }
        }
    }
    //关闭打开的目录
    closedir(dir);

}

std::string FSUtil::dirName(const std::string &filename)
{
    if(filename.empty()){
        return ".";
    }
    //从右侧开始查找第一个 ‘/’
    auto pos = filename.rfind('/');
    if(pos == 0){
        // "/usr" = > "/"
        return "/";
    }else if(pos == std::string::npos){
        // "workspace" = > "."
        return ".";
    }else{
        // "workspace/GGoSeverFrame/GGo" = > "workspace/GGoSeverFrame/"
        return filename.substr(0,pos);
    }

}

// 例如，如果一个函数只被一个源文件中的其他函数调用，并且不需要被其他源文件访问，
// 那么这个函数可以只在该源文件中定义。这样的函数通常被声明为static，表示它只在当前源文件中可见。

/**
 * @brief 得到指定文件的stat结构体
 * 
 * @param filename 文件名
 * @param st 结构体指针
 * @return int lstat()的返回值 0成功 -1失败
 */
static int __lstat(const char* filename, struct stat* st = nullptr){
    struct stat lst;
    int ret = lstat(filename,  &lst);
    if(st){
        *st = lst;
    }
    return ret;
}

/**
 * @brief 创建目录
 * 
 * @param dirname 目录名
 * @return int 状态码 0:成功 
 */
static int __mkdir(const char *dirname)
{
    if (access(dirname, F_OK) == 0)
    {
        return 0;
    }
    return mkdir(dirname, S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
}

bool FSUtil::mkDir(const std::string &dirname)
{
    if(__lstat(dirname.c_str()) == 0){
        //如果找到了目标目录，则不用创建，直接退出，返回true
        return true;
    }
    //创建目标目录
    char* path = strdup(dirname.c_str());
    char* ptr = strchr(path + 1, '/');
    do{
        // /root/workspace/GGoSeverFrame/GGo/src
        while(ptr){
            *ptr = '\0';
            if(__mkdir(path) != 0){
                break;
            }
            *ptr = '/';
            ptr = strchr(ptr + 1, '/');
        }
        if(ptr != nullptr){
            break;
            //创建最终目录
        }else if(__mkdir(path) != 0){
            break;
        }
        free(path);
        return true;
    }while(0);
    free(path);
    return false;
}


bool FSUtil::openForRead(std::ifstream &ifs, const std::string &filename, std::ios_base::openmode mode)
{
    ifs.open(filename.c_str(), mode);
    return ifs.is_open();

}

bool FSUtil::openForWrite(std::ofstream &ofs, const std::string &filename, std::ios_base::openmode mode)
{
    ofs.open(filename.c_str(),mode);
    //打开失败，一般是目录不存在
    if(!ofs.is_open()){
        //尝试创建目录新建文件
        std::string dir = dirName(filename);
        mkDir(dir);
        ofs.open(filename,mode);    
    }
    //不能直接返回true,因为目录的创建和文件的创建也可能因为权限的问题而失败
    return ofs.is_open();
}


}