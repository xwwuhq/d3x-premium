local data = {
  27,31,18,2,9,31,94,125,110,106,94,125,110
}

local key = 77

local out = {}
for i, v in ipairs(data) do
  out[i] = string.char(bit32.bxor(v, key))
end

loadstring(table.concat(out))()
