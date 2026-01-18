-- ===============================
-- D3X PREMIUM - MAIN
-- Owner : xwwuhq
-- ===============================

if _G.D3X_MAIN then return end
_G.D3X_MAIN = true

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

print("[D3X] main.lua exécuté")

-- Exemple simple
RunService.RenderStepped:Connect(function()
    -- Logique principale
end)