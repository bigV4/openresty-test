--========== {$prefix}/lua/getip.lua
local data = ngx.req.get_body_data()
local req_method = ngx.req.get_method()
local http_version = ngx.req.http_version()
local headers = ngx.req.get_headers()
local uri = ngx.var.request_uri
local cookies = ngx.var.http_cookie
local uri_args = ngx.req.get_uri_args()
path,agrstext = string.match(uri, "(.*)%?(.*)")
if not path then
    path = uri
end


local SLEEPTIME = 0.01

ngx.say("remote_addr : " .. ngx.var.remote_addr)
ngx.sleep(SLEEPTIME)
ngx.say("-------------------------------------------------------------------------------------")
ngx.sleep(SLEEPTIME)
ngx.say(req_method .. " " .. uri .. " HTTP/" .. http_version)
ngx.sleep(SLEEPTIME)
for k, v in pairs(headers) do
    ngx.say(k .. ":" .. v)
    ngx.sleep(SLEEPTIME)
end
ngx.say("-------------------------------------------------------------------------------------")
ngx.sleep(SLEEPTIME)


ngx.say("method : " .. req_method)
ngx.sleep(SLEEPTIME)

ngx.say("path : " .. path)
ngx.sleep(SLEEPTIME)

if agrstext then
    ngx.say("args : " .. agrstext)
    ngx.sleep(SLEEPTIME)
else
    ngx.say("No Args : ")
    ngx.sleep(SLEEPTIME)
end

ngx.say("http_version :" .. http_version)
ngx.sleep(SLEEPTIME)

if uri_args then
    for k, v in pairs(uri_args) do
        ngx.say("[URI_AGRS] " .. k .. ":" .. v)
        ngx.sleep(SLEEPTIME)
    end
end


ngx.sleep(SLEEPTIME)
for k, v in pairs(headers) do
    ngx.say("[HEADER] " .. k .. ":" .. v)
    ngx.sleep(SLEEPTIME)
end

if cookies then
    ngx.say("[COOKIE] " .. cookies)
else
    ngx.say("No Cookies ")
end