--========== {$prefix}/lua/demo_get.lua
local data = ngx.req.get_body_data()
local req_method = ngx.req.get_method()
local http_version = ngx.req.http_version()
local headers = ngx.req.get_headers()
local uri = ngx.var.request_uri
local cookies = ngx.var.http_cookie
local uri_args = ngx.req.get_uri_args()
path,agrstext = string.match(uri, "(.*)%?(.*)")


local SLEEPTIME = 0.02

ngx.say("Hello : " .. agrstext)
ngx.sleep(SLEEPTIME)