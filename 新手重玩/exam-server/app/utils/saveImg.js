/*
 * @Author: chenqiang 
 * @Date: 2019-09-04 11:03:14 
 * @Last Modified by: chenqiang
 * @Last Modified time: 2019-09-04 11:45:30
 * 保存头像文件处理函数
 */
 const fs=require("fs");
 const path=require("path")
/**
 * fileName 写入的内容
 * filePath 文件路径
 */
 module.exports.saveImg=function(fileName,filePath){
    return new Promise((resolve,reject)=>{
        fs.readFile(filePath,(error,content)=>{
            if(error){
                reject("读取失败")
            }else{
                fs.writeFile(path.join(__dirname,"../public",fileName),content,(err)=>{
                    if(err){
                        reject("失败");
                    }else{
                        resolve();
                    }
                })
            }
        })
    })
 }