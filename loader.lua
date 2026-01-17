if _G.D3X_LOADED then return end
_G.D3X_LOADED = true

local url = "https://raw.githubusercontent.com/xwwuhq/d3x-premium/main/core.lua"
loadstring(game:HttpGet(url))()