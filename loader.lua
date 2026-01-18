-- ===============================
-- D3X PREMIUM - LOADER
-- Owner : xwwuhq
-- ===============================

if _G.D3X_LOADER then return end
_G.D3X_LOADER = true

print("[D3X] Loader initialisé")

-- Charger main.lua
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xwwuhq/d3x-premium/main/main.lua"))()
    print("[D3X] main.lua chargé ✅")
end)

-- Charger delta.lua
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xwwuhq/d3x-premium/main/delta.lua"))()
    print("[D3X] delta.lua chargé ✅")
end)

print("[D3X] Loader terminé")