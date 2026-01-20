-- ===============================
-- D3X PREMIUM - hidden script 
-- Owner : x77uhq
-- ===============================

if _G.D3X_LOADER then return end
_G.D3X_LOADER = true

print("[D3X] Loader started")

local function load(url, name)
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)

    if success then
        print("[D3X] "..name.." loaded")
    else
        warn("[D3X] "..name.." error :", err)
    end
end


load(
    "https://raw.githubusercontent.com/xwwuhq/d3x-premium/main/main.lua",
    "main.lua"
)


load(
    "https://raw.githubusercontent.com/xwwuhq/d3x-premium/main/delta.lua",
    "delta.lua"
)

print("[D3X] Loader finished")