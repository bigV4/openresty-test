--========== {$prefix}/lua/getip.lua
local args = ngx.req.get_uri_args()
ngx.say(ngx.var.remote_addr)
--ngx.say(ngx.var.binary_remote_addr)