-- ===============================
-- D3X PREMIUM - DELTA XOR
-- Owner : xwwuhq
-- ===============================

if _G.D3X_DELTA then return end
_G.D3X_DELTA = true

local KEY = 73

local DATA = {
    57,59,32,39,61,97,107,13,12,5,29,8,105,6,2,107,96
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