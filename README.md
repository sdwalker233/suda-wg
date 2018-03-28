# suda-wg
苏州大学网关登录脚本  

## 使用方法
#### [login1.sh](login1.sh)
用于登录旧版网关，**每次执行登录10小时**  
使用`./login1.sh`或者`./login1.sh username password`登录  
可以在`crontab`中添加`0 * * * * root ./login1.sh username password`指定每个小时登录一次  

#### [logout1.sh](logout1.sh)
用于登出旧版网关  

#### [login2.sh](login2.sh)
用于登录新版网关  
使用`./login2.sh`或者`./login2.sh username password`登录  

#### [logout2.sh](logout2.sh)
用于登出新版网关  


## 关于新旧网关
旧版网关：[wg.suda.edu.cn](wg.suda.edu.cn)  
新版网关：[a.suda.edu.cn](a.suda.edu.cn)  
