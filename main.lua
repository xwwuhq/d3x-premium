-- Test pour voir si le script se lance
print("D3X SCRIPT EXECUTED")

-- Ton vrai script ensuite
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "D3X",
    Text = "Script chargé !",
    Duration = 5
})

-- Le reste de ton script ici...