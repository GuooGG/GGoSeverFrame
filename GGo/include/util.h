/**
 * @file util.h
 * @author GGo
 * @brief 常用的工具函数和类
 * @date 2023-10-16
 * 
 * @copyright Copyright (c) 2023
 * 
 */
#pragma once
#include<pthread.h>
#include<fstream>
#include<string>
#include<vector>
#include<sys/types.h>
#include<stdint.h>
#include<sys/syscall.h>
#include<unistd.h>
#include<sys/stat.h>
#include<dirent.h>
#include<string.h>
#include<cxxabi.h>

#include"LogSystem.h"

namespace GGo{

/**
 * @brief 返回当前线程ID
 */
pid_t GetThreadID();

/**
 * @brief 得到当前协程ID
 */
uint32_t GetFiberID();


/**
 * @brief 常用文件API类
 * 
 */
class FSUtil{
public:


    /**
     * @brief 得到目标目录下所有subfix格式的文件并加入到files容器中
     * 
     * @param files 文件容器
     * @param path 目标路径
     * @param subfix 文件格式,默认列出所有文件
     */
    static void listAllFile(std::vector<std::string>& files,
                            const std::string& path,
                            const std::string& subfix = "");

    /**
     * @brief 返回文件的父目录路径
     * 
     * @param filename 文件名
     * @return std::string 父目录路径
     */
    static std::string dirName(const std::string& filename);

    /**
     * @brief 创建文件夹
     * 
     * @param dirname 文件夹名称
     */
    static bool mkDir(const std::string& dirname);


    /**
     * @brief 打开文件并读取
     * 
     * @param ifs 文件流
     * @param filename 文件名
     * @param mode 打开模式
     * @return true 打开成功
     * @return false 打开失败
     */
    static bool openForRead(std::ifstream& ifs, const std::string& filename,
                            std::ios_base::openmode mode);

    /**
     * @brief 打开文件并写入
     * 
     * @param ofs 文件流
     * @param filename 文件名
     * @param mode 打开模式
     * @return true 写入成功
     * @return false 写入失败
     */
    static bool openForWrite(std::ofstream& ofs, const std::string& filename,
                            std::ios_base::openmode mode);


};

/// @brief 将类型转为字符串
/// @tparam T 类型名
/// @return 对应字符串
template<class T>
const char* typeToName(){
    static const char* s_name = abi::__cxa_demangle(typeid(T).name(),nullptr,nullptr,nullptr);
    return s_name;
}


}