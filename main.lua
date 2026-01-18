-- ===============================
-- D3X PREMIUM - MAIN
-- Owner : xwwuhq
-- ===============================

if _G.D3X_MAIN then return end
_G.D3X_MAIN = true

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

print("[D3X] main.lua exécuté")

RunService.RenderStepped:Connect(function()
    -- logique du panel / loop
end)

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        print("[D3X] RightShift pressé")
    end
end)