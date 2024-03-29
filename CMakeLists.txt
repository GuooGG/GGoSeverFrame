#cmake最低版本2.8
cmake_minimum_required(VERSION 3.16)

#项目名称GGo
project(GGo)

#C++20
set(CMAKE_CXX_STANDARD 20)

# #显示详细编译信息
# set(CMAKE_VERBOSE_MAKEFILE ON)

#设置可执行文件输出路径
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

#启用全部警告
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -O3")

#头文件包含路径
include_directories(GGo/include)
include_directories(GGo/include/http)
include_directories(GGo/include/streams)
include_directories(mongrel)

#链接库路径
link_directories(/usr/local/lib64)
link_directories(${PROJECT_SOURCE_DIR}/lib)
#yaml-cpp动态库
find_library(yaml-cpp /usr/local/lib64/libyaml-cpp.so)
find_library(zlib-cpp /usr/lib64/pkgconfig/zlib.pc )

#源码文件
file(GLOB_RECURSE GGO_LIB_SRC ./GGo/src/*.cpp)
#制作GGo动态库
add_library(GGO_LIB SHARED ${GGO_LIB_SRC})


find_package(ZLIB REQUIRED)
if(ZLIB_FOUND)
    include_directories(${ZLIB_INCLUDE_DIR})
endif()

set(LIBS 
        GGO_LIB
        dl
        pthread
        yaml-cpp
        ${ZLIB_LIBRARIES}
)

message(STATUS ${PROJECT_BINARY_DIR})

#生成日志测试
add_executable(LogTest01 Test/LogTest01.cpp)
target_link_libraries(LogTest01 ${LIBS})
#生成日志系统完整框架功能测试
add_executable(LogTest02 Test/LogTest02.cpp)
target_link_libraries(LogTest02 ${LIBS})
#生成配置测试
add_executable(ConfigTest01 Test/ConfigTest01.cpp)
target_link_libraries(ConfigTest01 ${LIBS})
#生成Yaml-cpp测试
add_executable(YmlTest01 Test/YmlTest01.cpp)
target_link_libraries(YmlTest01 ${LIBS})
#生成YML文件转配置信息测试
add_executable(YmlToConfigTest01 Test/YmlToConfigTest01.cpp)
target_link_libraries(YmlToConfigTest01 ${LIBS})
# 线程模块测试
add_executable(ThreadTest01 Test/ThreadTest01.cpp)
target_link_libraries(ThreadTest01 ${LIBS})
# 常用工具函数测试
add_executable(UtilsTest01 Test/UtilsTest01.cpp)
target_link_libraries(UtilsTest01 ${LIBS})
# 协程模块测试
add_executable(FiberTest01 Test/FiberTest01.cpp)
target_link_libraries(FiberTest01 ${LIBS})
# 协程调度模块测试
add_executable(SchedulerTest01 Test/SchedulerTest01.cpp)
target_link_libraries(SchedulerTest01 ${LIBS})
# 字节序转换模块测试
add_executable(EndianTest01 Test/EndianTest01.cpp)
target_link_libraries(EndianTest01 ${LIBS})
# 字节数组模块测试
add_executable(ByteArrayTest01 Test/ByteArrayTest01.cpp)
target_link_libraries(ByteArrayTest01 ${LIBS})
# IO协程调度器数组模块测试
add_executable(IOSchedulerTest01 Test/IOSchedulerTest01.cpp)
target_link_libraries(IOSchedulerTest01 ${LIBS})
# 网络地址模块测试
add_executable(AddressTest01 Test/AddressTest01.cpp)
target_link_libraries(AddressTest01 ${LIBS})
# Hook模块测试
add_executable(HookTest01 Test/HookTest01.cpp)
target_link_libraries(HookTest01 ${LIBS})
# socket模块测试
add_executable(SocketTest01 Test/SocketTest01.cpp)
target_link_libraries(SocketTest01 ${LIBS})
# http模块测试
add_executable(HTTPTest01 Test/HTTPTest01.cpp)
target_link_libraries(HTTPTest01 ${LIBS})
# TCPSever模块测试
add_executable(TCPSeverTest01 Test/TCPSeverTest01.cpp)
target_link_libraries(TCPSeverTest01 ${LIBS})



# echoTCP服务器样本
add_executable(ECHOSever examples/ECHOSever.cpp)
target_link_libraries(ECHOSever ${LIBS})
# HTTP服务器demo
add_executable(HTTPSever examples/HTTPSever.cpp)
target_link_libraries(HTTPSever ${LIBS})