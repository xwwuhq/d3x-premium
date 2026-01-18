-- D3X PREMIUM - MAIN SCRIPT
if _G.D3X_MAIN then return end
_G.D3X_MAIN = true

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

print("[D3X] Main script loaded")

-- Fonction exemple
local function notify(msg)
    print("[D3X] "..msg)
end

notify("Script exécuté avec succès")

-- Exemple loop
RunService.RenderStepped:Connect(function()
end)

-- Exemple input
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        notify("RightShift pressé")
    end
end)