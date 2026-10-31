-- Path: Players.Drrrrrrrrragonball.PlayerScripts.ControllerUiNavigation

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.ControllerUiNavigation
-- Decompile time: 4.18 ms

local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local u20 = Players.LocalPlayer:WaitForChild("PlayerGui")
local u24 = setmetatable({}, {__mode = "k"})
local u28 = setmetatable({}, {__mode = "k"})
local u32 = setmetatable({}, {__mode = "k"})

local function isUsingGamepad() -- Line: 11 -- upvalues: UserInputService (val)
    return UserInputService.GamepadEnabled and UserInputService.PreferredInput == Enum.PreferredInput.Gamepad
end

local function isActuallyVisible(a1) -- Line: 16 -- upvalues: u20 (val)
    if a1 and a1:IsA("GuiObject") and a1.Visible and a1.Active then
        local Parent = a1.Parent
        while Parent do
            if Parent == u20 then
                break
            end
            if Parent:IsA("GuiObject") and not Parent.Visible then
                return false
            end
            if Parent:IsA("ScreenGui") and not Parent.Enabled then
                return false
            end
            Parent = Parent.Parent
        end
        return Parent == u20
    end
    return false
end

local function isMenuCloseButton(a1) -- Line: 32
    if not a1:IsA("GuiButton") then
        return false
    end
    local v1 = string.lower(a1.Name)
    local v2 = a1:IsA("TextButton") and string.lower(a1.Text) or ""
    local v3 = true
    if v1 ~= "close" then
        v3 = true
        if v1 ~= "x" then
            v3 = v1:find("closebutton", 1, true) ~= nil
        end
    end
    local v4 = true
    if v1 ~= "back" then
        v4 = true
        if v1 ~= "goback" then
            v4 = v1 == "backbutton"
        end
    end
    if not v3 and not v4 and v2 ~= "x" then
        return false
    end
    if v4 then
        return true
    end
    local Parent = a1.Parent
    if Parent and Parent:IsA("GuiObject") then
        local v5
        if Parent.Parent and Parent.Parent:IsA("ScreenGui") then
            return true
        end
        v3 = string.lower(Parent.Name)
        if v3 == "header" then
            local Parent_2 = Parent.Parent
            v1 = Parent_2 and string.lower(Parent_2.Name) or ""
            if Parent_2 and Parent_2:IsA("GuiObject") then
                if v1:find("frame", 1, true) == nil
                    and v1:find("root", 1, true) == nil
                    and v1:find("panel", 1, true) == nil then
                    v5 = true
                    if v3:find("frame", 1, true) == nil then
                        v5 = true
                        if v3:find("root", 1, true) == nil then
                            v5 = true
                            if v3:find("popup", 1, true) == nil then
                                v5 = true
                                if v3:find("panel", 1, true) == nil then
                                    v5 = true
                                    if v3:find("shop", 1, true) == nil then
                                        v5 = v3 == "freepops"
                                    end
                                end
                            end
                        end
                    end
                    return v5
                end
                return true
            end
        end
        v5 = true
        if v3:find("frame", 1, true) == nil then
            v5 = true
            if v3:find("root", 1, true) == nil then
                v5 = true
                if v3:find("popup", 1, true) == nil then
                    v5 = true
                    if v3:find("panel", 1, true) == nil then
                        v5 = true
                        if v3:find("shop", 1, true) == nil then
                            v5 = v3 == "freepops"
                        end
                    end
                end
            end
        end
        return v5
    end
    return false
end

local function getScreenGui(a1) -- Line: 65 -- upvalues: u20 (val)
    local Parent = a1
    while Parent do
        if Parent == u20 then
            break
        end
        if Parent:IsA("ScreenGui") then
            return Parent
        end
        Parent = Parent.Parent
    end
    return nil
end

local function getNavigationScore(a1) -- Line: 74 -- upvalues: u20 (val)
    local DisplayOrder, Parent_2, v1
    local Parent = a1
    while Parent do
        if Parent == u20 then
            break
        end
        if not Parent:IsA("ScreenGui") then
            Parent = Parent.Parent
            continue
        else
            v1 = Parent
        end
        DisplayOrder = v1 and v1.DisplayOrder or 0
        v1 = 0
        Parent_2 = a1.Parent
        while Parent_2 do
            if Parent_2 == u20 then
                break
            end
            v1 = v1 + 1
            Parent_2 = Parent_2.Parent
        end
        return DisplayOrder * 1000000 + a1.ZIndex * 1000 + v1
    end
    v1 = nil
    DisplayOrder = v1 and v1.DisplayOrder or 0
    v1 = 0
    Parent_2 = a1.Parent
    while Parent_2 do
        if Parent_2 == u20 then
            break
        end
        v1 = v1 + 1
        Parent_2 = Parent_2.Parent
    end
    return DisplayOrder * 1000000 + a1.ZIndex * 1000 + v1
end

local function findBestVisibleCloseButton() -- Line: 86 -- upvalues: u24 (val), isActuallyVisible (val), u20 (val)
    local DisplayOrder, Parent, Parent_2, v1, v2
    local v3 = nil
    local v4 = (-1 / 0)
    for k in pairs(u24) do
        if k.Parent and isActuallyVisible(k) then
            Parent = k
            while Parent do
                if Parent == u20 then
                    break
                end
                if not Parent:IsA("ScreenGui") then
                    Parent = Parent.Parent
                    continue
                else
                    v2 = Parent
                end
                DisplayOrder = v2 and v2.DisplayOrder or 0
                v2 = 0
                Parent_2 = k.Parent
                while Parent_2 do
                    if Parent_2 == u20 then
                        break
                    end
                    v2 = v2 + 1
                    Parent_2 = Parent_2.Parent
                end
                v1 = DisplayOrder * 1000000 + k.ZIndex * 1000 + v2
                if v4 < v1 then
                    v3 = k
                    v4 = v1
                end
                break
            end
            v2 = nil
            DisplayOrder = v2 and v2.DisplayOrder or 0
            v2 = 0
            Parent_2 = k.Parent
            while Parent_2 do
                if Parent_2 == u20 then
                    break
                end
                v2 = v2 + 1
                Parent_2 = Parent_2.Parent
            end
            v1 = DisplayOrder * 1000000 + k.ZIndex * 1000 + v2
            if v4 < v1 then
                v3 = k
            end
        end
    end
    return v3
end

local function refreshGamepadSelection() -- Line: 101
    -- upvalues: UserInputService (val), findBestVisibleCloseButton (val), GuiService (val), u20 (val)
    local GamepadEnabled = UserInputService.GamepadEnabled and UserInputService.PreferredInput == Enum.PreferredInput.Gamepad
    if not GamepadEnabled then
        return
    end
    local v1 = findBestVisibleCloseButton()
    if v1 then
        GuiService.SelectedObject = v1
        return
    end
    local SelectedObject = GuiService.SelectedObject
    if SelectedObject and SelectedObject:IsDescendantOf(u20) then
        GuiService.SelectedObject = nil
    end
end

local function bindScreenGui(a1) -- Line: 114 -- upvalues: u32 (val), refreshGamepadSelection (val)
    if u32[a1] then
        return
    end
    u32[a1] = true
    ;(a1:GetPropertyChangedSignal("Enabled")):Connect(function() -- Line: 117 -- upvalues: refreshGamepadSelection (upval)
        task.defer(refreshGamepadSelection)
    end)
end

local function bindCloseButton(a1) -- Line: 122
    -- upvalues: u24 (val), isMenuCloseButton (val), refreshGamepadSelection (val), u28 (val), u20 (val), u32 (val)
    if not u24[a1] and isMenuCloseButton(a1) then
        local v1
        u24[a1] = true
        a1.Selectable = true
        ;(a1:GetPropertyChangedSignal("Selectable")):Connect(function() -- Line: 126 -- upvalues: a1 (val)
            if a1.Parent and not a1.Selectable then
                a1.Selectable = true
            end
        end)
        ;(a1:GetPropertyChangedSignal("Visible")):Connect(function() -- Line: 131 -- upvalues: refreshGamepadSelection (upval)
            task.defer(refreshGamepadSelection)
        end)
        local Parent = a1.Parent
        if Parent and Parent:IsA("GuiObject") and not u28[Parent] then
            u28[Parent] = true
            ;(Parent:GetPropertyChangedSignal("Visible")):Connect(function() -- Line: 138 -- upvalues: refreshGamepadSelection (upval)
                task.defer(refreshGamepadSelection)
            end)
        end
        local Parent_2 = a1
        while Parent_2 do
            if Parent_2 == u20 then
                break
            end
            if not Parent_2:IsA("ScreenGui") then
                Parent_2 = Parent_2.Parent
                continue
            else
                v1 = Parent_2
            end
            if v1 and not u32[v1] then
                u32[v1] = true
                ;(v1:GetPropertyChangedSignal("Enabled")):Connect(function() -- Line: 117 -- upvalues: refreshGamepadSelection (upval)
                    task.defer(refreshGamepadSelection)
                end)
            end
            task.defer(refreshGamepadSelection)
            return
        end
        v1 = nil
        if v1 and not u32[v1] then
            u32[v1] = true
            ;(v1:GetPropertyChangedSignal("Enabled")):Connect(function() -- Line: 117 -- upvalues: refreshGamepadSelection (upval)
                task.defer(refreshGamepadSelection)
            end)
        end
        task.defer(refreshGamepadSelection)
        return
    end
end

for i, v in ipairs(u20:GetDescendants()) do
    if v:IsA("GuiButton") then
        bindCloseButton(v)
    end
end
u20.DescendantAdded:Connect(function(a1) -- Line: 153 -- upvalues: bindCloseButton (val)
    if a1:IsA("GuiButton") then
        bindCloseButton(a1)
    end
end)
;(UserInputService:GetPropertyChangedSignal("PreferredInput")):Connect(function() -- Line: 159 -- upvalues: refreshGamepadSelection (val)
    task.defer(refreshGamepadSelection)
end)
UserInputService.GamepadConnected:Connect(function() -- Line: 162 -- upvalues: refreshGamepadSelection (val)
    task.defer(refreshGamepadSelection)
end)
UserInputService.InputChanged:Connect(function(a1) -- Line: 166 -- upvalues: findBestVisibleCloseButton (val), GuiService (val)
    if a1.UserInputType == Enum.UserInputType.Gamepad1 and a1.KeyCode == Enum.KeyCode.Thumbstick1 then
        if Vector2.new(a1.Position.X, a1.Position.Y).Magnitude < 0.2 then
            return
        end
        if not findBestVisibleCloseButton() and GuiService.SelectedObject then
            GuiService.SelectedObject = nil
        end
        return
    end
end)