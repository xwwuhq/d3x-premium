-- 404 Not Found 






































































































































































































































































































































































































































































































 
 

-- // 1. CONFIGURATION (METS TON ID ICI) //
local Whitelisted_IDs = {
    9645078432,
}

-- // 2. NE TOUCHE PAS EN DESSOUS //
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local UserId = LocalPlayer.UserId
local Authorized = false

-- Simulation de chargement stylé
StarterGui:SetCore("SendNotification", {Title = "D3X SECURITY", Text = "Vérification...", Duration = 2})
task.wait(1)

-- Vérification de la Whitelist
for _, id in pairs(Whitelisted_IDs) do
    if UserId == id then
        Authorized = true
        break
    end
end

if not Authorized then
    StarterGui:SetCore("SendNotification", {Title = "ACCÈS REFUSÉ", Text = "Tu n'es pas whitelist !", Duration = 5})
    return -- STOP LE SCRIPT ICI
end

StarterGui:SetCore("SendNotification", {Title = "ACCÈS AUTORISÉ", Text = "Bienvenue " .. LocalPlayer.Name, Duration = 5})

-- SUITE DU SCRIPT (LE MENU)
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local THEME = {
    Bg = Color3.fromRGB(15, 15, 20),
    Sidebar = Color3.fromRGB(10, 10, 15),
    Accent = Color3.fromRGB(170, 0, 255),
    Secondary = Color3.fromRGB(0, 255, 255),
    Text = Color3.fromRGB(255, 255, 255),
    SubText = Color3.fromRGB(150, 150, 160),
    ItemBg = Color3.fromRGB(25, 25, 30),
    MacRed = Color3.fromRGB(255, 95, 87),
    MacYellow = Color3.fromRGB(255, 189, 46),
    MacGreen = Color3.fromRGB(39, 201, 63)
}

local State = { NoAnim = false, FpsKiller = false, IsMinimized = false, ItemEspActive = false, FpsBoostActive = false, PlayerEspActive = false }
local SIZES = { Full = UDim2.new(0, 550, 0, 320), Mini = UDim2.new(0, 140, 0, 320) }

-- FONCTIONS
local function executePlayerEsp()
    if State.PlayerEspActive then return end
    State.PlayerEspActive = true
    local function applyESP(character)
        if not character or character:FindFirstChild("ESP_HIGHLIGHT") then return end
        local hl = Instance.new("Highlight")
        hl.Name = "ESP_HIGHLIGHT"
        hl.Adornee = character
        hl.FillColor = Color3.fromRGB(255, 0, 0)
        hl.OutlineColor = Color3.fromRGB(255, 0, 0)
        hl.FillTransparency = 0.6
        hl.Parent = character
    end
    for _, p in pairs(Players:GetPlayers()) do 
        if p ~= LocalPlayer and p.Character then applyESP(p.Character) end
        p.CharacterAdded:Connect(function(c) task.wait(1) applyESP(c) end)
    end
    Players.PlayerAdded:Connect(function(p) p.CharacterAdded:Connect(function(c) task.wait(1) applyESP(c) end) end)
end

local function executeFpsBoost()
    local Lighting = game:GetService("Lighting")
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("PostEffect") then v:Destroy() end
    end
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("BasePart") then obj.Material = Enum.Material.Plastic obj.CastShadow = false end
        if obj:IsA("Texture") then obj.Transparency = 1 end
    end
end

local function applyNoAnim()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Animate") then char.Animate.Disabled = State.NoAnim end
end
LocalPlayer.CharacterAdded:Connect(function() task.wait(0.5) if State.NoAnim then applyNoAnim() end end)

-- INTERFACE
if PlayerGui:FindFirstChild("D3X_V4") then PlayerGui.D3X_V4:Destroy() end
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "D3X_V4"; ScreenGui.Parent = PlayerGui

-- Toggle Button
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 50, 0, 50); ToggleBtn.Position = UDim2.new(0, 20, 0, 20)
ToggleBtn.BackgroundColor3 = THEME.Sidebar; ToggleBtn.Text = "D3X"; ToggleBtn.TextColor3 = THEME.Accent
ToggleBtn.Parent = ScreenGui; Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)

local MainFrame = Instance.new("Frame")
MainFrame.Size = SIZES.Full; MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0); MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = THEME.Bg; MainFrame.Active = true; MainFrame.Draggable = true; MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

ToggleBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

-- Sidebar & Buttons
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 140, 1, 0); Sidebar.BackgroundColor3 = THEME.Sidebar; Sidebar.Parent = MainFrame
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 12)

local PageContainer = Instance.new("Frame")
PageContainer.Size = UDim2.new(1, -160, 1, -20); PageContainer.Position = UDim2.new(0, 150, 0, 10)
PageContainer.BackgroundTransparency = 1; PageContainer.Parent = MainFrame

local function createBtn(text, parent, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 40); btn.BackgroundColor3 = THEME.ItemBg
    btn.Text = text; btn.TextColor3 = Color3.new(1,1,1); btn.Parent = parent
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)
    btn.MouseButton1Click:Connect(function() callback(btn) end)
    return btn
end

local ListLayout = Instance.new("UIListLayout"); ListLayout.Padding = UDim.new(0, 10); ListLayout.Parent = PageContainer

createBtn("PLAYER ESP", PageContainer, function(b) b.Text = "ESP: ON" b.TextColor3 = THEME.Secondary executePlayerEsp() end)
createBtn("FPS BOOST", PageContainer, function(b) b.Text = "BOOST: ON" b.TextColor3 = THEME.Secondary executeFpsBoost() end)
createBtn("NO ANIM", PageContainer, function(b) State.NoAnim = not State.NoAnim b.Text = State.NoAnim and "NO ANIM: ON" or "NO ANIM" applyNoAnim() end)

-- Close Button (Red Mac Dot)
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 15, 0, 15); Close.Position = UDim2.new(1, -25, 0, 10)
Close.BackgroundColor3 = THEME.MacRed; Close.Text = ""; Close.Parent = MainFrame
Instance.new("UICorner", Close).CornerRadius = UDim.new(1,0)
Close.MouseButton1Click:Connect(function() MainFrame.Visible = false end)
