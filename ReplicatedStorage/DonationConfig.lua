-- Path: ReplicatedStorage.DonationConfig

-- Script path: ReplicatedStorage.DonationConfig
-- Decompile time: 0.63 ms

local v1
local u75 = {
    Amounts = {5, 10, 25, 50, 100, 250, 500, 1000, 2500, 5000, 10000, 50000, 100000, 1000000},
    ProductIds = {
        [5] = 3658447693,
        [10] = 3658451231,
        [25] = 3658453509,
        [50] = 3658456601,
        [100] = 3658460967,
        [250] = 3658465120,
        [500] = 3658468084,
        [1000] = 3658472573,
        [2500] = 3658478003,
        [5000] = 3658480727,
        [10000] = 3658484040,
        [50000] = 3658487239,
        [100000] = 3658491964,
        [1000000] = 3658496740,
    },
}
local u73 = {}
for k, v in pairs(u75.ProductIds) do
    v1 = math.floor((tonumber(v)) or 0)
    if v1 > 0 then
        assert(u73[v1] == nil, "DonationConfig has a duplicate product ID")
        u73[v1] = k
    end
end

function u75.GetProductId(a1) -- Line: 47 -- upvalues: u75 (val)
    return (math.floor((tonumber(u75.ProductIds[(math.floor((tonumber(a1)) or 0))])) or 0))
end

function u75.GetDonationAmount(a1) -- Line: 51 -- upvalues: u73 (val)
    return u73[math.floor((tonumber(a1)) or 0)]
end

function u75.ForEachConfiguredProduct(a1) -- Line: 55 -- upvalues: u73 (val)
    for k, v in pairs(u73) do
        a1(k, v)
    end
end

return u75