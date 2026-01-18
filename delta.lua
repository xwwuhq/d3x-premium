-- ===============================
-- D3X PREMIUM - DELTA XOR
-- Owner : xwwuhq
-- ===============================

if _G.D3X_DELTA then return end
_G.D3X_DELTA = true

local KEY = 73

local DATA = {
    -- ICI tu colles TOUS les nombres XOR (sans couper)
}

local function decode(tbl, key)
    local out = {}

    for i = 1, #tbl do
        local v = bit32.bxor(tbl[i], key)

        if v < 0 or v > 255 then
            error("[D3X] XOR invalide à l'index "..i)
        end

        out[i] = string.char(v)
    end

    return table.concat(out)
end

loadstring(decode(DATA, KEY))()