-- Path: Players.Drrrrrrrrragonball.PlayerScripts.DisableReset

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.DisableReset
-- Decompile time: 0.38 ms

local success
local StarterGui = game:GetService("StarterGui")

local function disableResetButton() -- Line: 3 -- upvalues: StarterGui (val)
    local success = pcall(function() -- Line: 4 -- upvalues: StarterGui (upval)
        StarterGui:SetCore("ResetButtonCallback", false)
    end)
    return success
end

while true do
    success = pcall(function() -- Line: 4 -- upvalues: StarterGui (val)
        StarterGui:SetCore("ResetButtonCallback", false)
    end)
    if success then
        break
    end
    task.wait(0.5)
end
while true do
    task.wait(5)
    pcall(function() -- Line: 4 -- upvalues: StarterGui (val)
        StarterGui:SetCore("ResetButtonCallback", false)
    end)
end