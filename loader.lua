-- 404 Not Found 






























































-- not found 


if _G.D3X_LOADER then return end
_G.D3X_LOADER = true

print("[D3X] Loader initialisé")

-- Charge main.lua (public)
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xwwuhq/d3x-premium/main/main.lua"))()
end)

print("[D3X] main.lua chargé ✅")

-- Charge delta.lua (vrai script caché)
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xwwuhq/d3x-premium/main/delta.lua"))()
end)

print("[D3X] delta.lua chargé ✅")
print("[D3X] Loader terminé")