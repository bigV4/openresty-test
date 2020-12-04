# openresty-test
```
nginx -p openresty-test
nginx -p openresry-test -s reload
/usr/local/openresty/nginx/sbin/nginx -p openresty-test
```



openresty-test
```
git add . 
git commit -m 'first commit'
git push origin main
```

# ngx_lua处理http请求的过程：

当Nginx处理一个来自客户端的请求时，先根据请求头的host、ip和port来确定由哪个server处理，确定了server之后，再根据请求的uri找到对应的location，这个请求就由这个location处理。实际Nginx将一个请求的处理划分为若干个不同阶段（phase），这些阶段按照前后顺序依次执行，也就是说NGX_HTTP_POST_READ_PHASE在第一个，NGX_HTTP_LOG_PHASE在最后一个。

## nginxHttpRequest的11个阶段：

    1.NGX_HTTP_POST_READ_PHASE: 读取请求内容阶段
    2.NGX_HTTP_SERVER_REWRITE_PHASE: Server请求地址重写阶段
    3.NGX_HTTP_FIND_CONFIG_PHASE: 配置查找段
    4.NGX_HTTP_REWRITE_PHASE: Location请求地址重写阶段
    5.NGX_HTTP_POST_REWRITE_PHASE: 请求地址重写提交阶段
    6.NGX_HTTP_PREACCESS_PHASE: 访问权限检查准备阶段
    7.NGX_HTTP_ACCESS_PHASE: 访问权限检查阶段
    8.NGX_HTTP_POST_ACCESS_PHASE: 访问权限检查提交阶段
    9.NGX_HTTP_TRY_FILES_PHASE: 配置项try_files处理阶段
    10.NGX_HTTP_CONTENT_PHASE: 内容产生阶段
    11.NGX_HTTP_LOG_PHASE: 日志模块处理阶段


## ngx_lua指令

    `set_by_lua`: 流程分支处理判断变量初始化
    `rewrite_by_lua`: 转发、重定向、缓存等功能(例如特定请求代理到外网)
    `access_by_lua`: IP准入、接口权限等情况集中处理(例如配合iptable完成简单防火墙)
    `content_by_lua`: 内容生成
    `header_filter_by_lua`: 应答HTTP过滤处理(例如添加头部信息)
    `body_filter_by_lua`: 应答BODY过滤处理(例如完成应答内容统一成大写)
    `log_by_lua`: 回话完成后本地异步完成日志记录(日志可以记录在本地，还可以同步到其他机器)
