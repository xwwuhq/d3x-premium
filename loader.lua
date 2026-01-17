if _G.D3X_LOADED then return end
_G.D3X_LOADED = true

local url = "https://raw.githubusercontent.com/TONUSER/D3X-Hub/main/core.lua"
loadstring(game:HttpGet(url))()