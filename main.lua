-- ===============================
-- D3X PREMIUM - MAIN SCRIPT
-- Owner : xwwuhq
-- Version : 1.0.0
-- ===============================

if _G.D3X_MAIN then return end
_G.D3X_MAIN = true

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

print("[D3X] Main script loaded")

-- Exemple logique
local function notify(msg)
    print("[D3X] "..msg)
end

notify("Script exécuté avec succès")

-- Exemple loop
RunService.RenderStepped:Connect(function()
    -- logique ici
end)

-- Exemple input
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        notify("RightShift pressé")
    end
end)

-- FIN