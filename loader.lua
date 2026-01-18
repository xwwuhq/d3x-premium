-- ===============================
-- D3X PREMIUM - LOADER
-- Owner : xwwuhq
-- Secure Loader
-- ===============================

if _G.D3X_LOADER then return end
_G.D3X_LOADER = true

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

print("[D3X] Loader initialisé")

-- Charge main.lua
local successMain, errMain = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xwwuhq/d3x-premium/main/main.lua"))()
end)
if successMain then
    print("[D3X] main.lua chargé ✅")
else
    warn("[D3X] Erreur main.lua :", errMain)
end

-- Charge delta.lua
local successDelta, errDelta = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xwwuhq/d3x-premium/main/delta.lua"))()
end)
if successDelta then
    print("[D3X] delta.lua chargé ✅")
else
    warn("[D3X] Erreur delta.lua :", errDelta)
end

print("[D3X] Loader terminé")