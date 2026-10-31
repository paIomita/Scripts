-- Path: Players.Drrrrrrrrragonball.PlayerScripts.ImageCaptchaClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.ImageCaptchaClient
-- Decompile time: 4.68 ms

local ContentProvider = game:GetService("ContentProvider")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local u35 = Players.LocalPlayer:WaitForChild("PlayerGui")
local ImageCaptchaRemotes = ReplicatedStorage:WaitForChild("ImageCaptchaRemotes")
local v1 = ImageCaptchaRemotes:WaitForChild("BindChallenge")
local Activate = ImageCaptchaRemotes:WaitForChild("Activate")
local MouseTrace = ImageCaptchaRemotes:WaitForChild("MouseTrace")
local RenderStatus = ImageCaptchaRemotes:WaitForChild("RenderStatus")
local u57 = 0
v1.OnClientEvent:Connect(function(a1, a2, a3, a4) -- Line: 21
    -- upvalues: u35 (val), u57 (ref), Workspace (val), MouseTrace (val), UserInputService (val), RunService (val)
    -- upvalues: Activate (val), RenderStatus (val), ContentProvider (val)
    if typeof(a1) == "Instance"
        and a1:IsA("ScreenGui")
        and a1:IsDescendantOf(u35)
        and typeof(a2) == "Instance"
        and a2:IsA("ImageLabel")
        and a2:IsDescendantOf(a1)
        and typeof(a3) == "Instance"
        and a3:IsA("ImageLabel")
        and a3:IsDescendantOf(a1)
        and type(a4) == "string" then
        u57 = u57 + 1
        local u42 = u57
        local u43 = {}
        local ResponsiveScale = a1:FindFirstChild("ResponsiveScale", true)

        local function updateScale() -- Line: 40 -- upvalues: ResponsiveScale (val), Workspace (upval)
            if ResponsiveScale and ResponsiveScale:IsA("UIScale") then
                local CurrentCamera = Workspace.CurrentCamera
                local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1280, 720)
                ResponsiveScale.Scale = math.min(1, (ViewportSize.X - 24) / 500, (ViewportSize.Y - 24) / 620)
                return
            end
        end

        updateScale()
        if Workspace.CurrentCamera then
            table.insert(u43, ((Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(updateScale)))
        end
        local u67 = nil
        local u68 = 0
        local u69 = {}

        local function flushTrace() -- Line: 59 -- upvalues: u69 (ref), a1 (val), MouseTrace (upval)
            if #u69 ~= 0 and a1.Parent then
                local v1 = u69
                u69 = {}
                MouseTrace:FireServer(v1)
                return
            end
        end

        local function recordPosition(a1_2) -- Line: 68
            -- upvalues: u67 (ref), u68 (ref), Workspace (upval), u69 (ref), a1 (val), MouseTrace (upval)
            if not u67 then
                return
            end
            local v1 = os.clock()
            if v1 - u68 < 0.04 then
                return
            end
            u68 = v1
            local CurrentCamera = Workspace.CurrentCamera
            local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1280, 720)
            if not (ViewportSize.X <= 0) and not (ViewportSize.Y <= 0) then
                local v2 = math.clamp(a1_2.X / ViewportSize.X, 0, 1)
                local v3 = math.clamp(a1_2.Y / ViewportSize.Y, 0, 1)
                table.insert(u69, {
                    math.floor(v2 * 1000 + 0.5) / 1000,
                    math.floor(v3 * 1000 + 0.5) / 1000,
                    math.floor((v1 - u67) * 1000 + 0.5) / 1000,
                })
                if #u69 >= 12 and #u69 ~= 0 then
                    if not a1.Parent then
                        return
                    end
                    v3 = u69
                    u69 = {}
                    MouseTrace:FireServer(v3)
                end
                return
            end
        end

        table.insert(u43, (UserInputService.InputChanged:Connect(function(a1) -- Line: 95 -- upvalues: recordPosition (val)
            if a1.UserInputType == Enum.UserInputType.MouseMovement
                or a1.UserInputType == Enum.UserInputType.Touch then
                recordPosition(Vector2.new(a1.Position.X, a1.Position.Y))
            end
        end)))
        table.insert(u43, (UserInputService.InputBegan:Connect(function(a1) -- Line: 102 -- upvalues: recordPosition (val)
            if a1.UserInputType == Enum.UserInputType.MouseButton1
                or a1.UserInputType == Enum.UserInputType.Touch then
                recordPosition(Vector2.new(a1.Position.X, a1.Position.Y))
            end
        end)))
        local u92 = 0
        table.insert(u43, (RunService.Heartbeat:Connect(function(a1_2) -- Line: 111 -- upvalues: u92 (ref), u69 (ref), a1 (val), MouseTrace (upval)
            u92 = u92 + a1_2
            if u92 >= 0.4 then
                u92 = 0
                if #u69 ~= 0 then
                    if not a1.Parent then
                        return
                    end
                    local v1 = u69
                    u69 = {}
                    MouseTrace:FireServer(v1)
                end
            end
        end)))
        local u102 = false
        for i, v in ipairs(a1:GetDescendants()) do
            if v:IsA("GuiButton") then
                v.Activated:Connect(function() -- Line: 122 -- upvalues: u102 (ref), a1 (val), v (val), u69 (ref), MouseTrace (upval), Activate (upval)
                    if not u102 and a1.Parent and v.Active and v.Interactable then
                        u102 = true
                        task.spawn(function() -- Line: 131
                            -- upvalues: u69 (upval), a1 (upval), MouseTrace (upval), Activate (upval), v (upval)
                            -- upvalues: u102 (upval)
                            if #u69 ~= 0 and a1.Parent then
                                local v1 = u69
                                u69 = {}
                                MouseTrace:FireServer(v1)
                            end
                            pcall(function() -- Line: 133 -- upvalues: Activate (upval), v (upval)
                                Activate:InvokeServer(v)
                            end)
                            task.wait(0.1)
                            u102 = false
                        end)
                        return
                    end
                end)
            end
        end
        a1.Destroying:Connect(function() -- Line: 143 -- upvalues: u69 (ref), a1 (val), MouseTrace (upval), u43 (val)
            if #u69 ~= 0 and a1.Parent then
                local v1 = u69
                u69 = {}
                MouseTrace:FireServer(v1)
            end
            for i, v in ipairs(u43) do
                v:Disconnect()
            end
            table.clear(u43)
        end)
        local u125 = false

        local function resolveRender(a1_2, a2) -- Line: 152
            -- upvalues: u125 (ref), u42 (val), u57 (upval), a1 (val), u67 (ref), RenderStatus (upval), a4 (val)
            if not u125 and u42 == u57 and a1.Parent then
                u125 = true
                if a1_2 == "ready" then
                    os.clock()
                    a1.Enabled = true
                end
                RenderStatus:FireServer(a4, a1_2, a2)
                return
            end
        end

        task.delay(12, function() -- Line: 165 -- upvalues: u125 (ref), u42 (val), u57 (upval), a1 (val), RenderStatus (upval), a4 (val)
            if not u125 and u42 == u57 then
                if not a1.Parent then
                    return
                end
                u125 = true
                RenderStatus:FireServer(a4, "failed", "ClientTimeout")
            end
        end)
        task.spawn(function() -- Line: 168
            -- upvalues: ContentProvider (upval), a2 (val), a3 (val), u125 (ref), u42 (val), u57 (upval), a1 (val)
            -- upvalues: RenderStatus (upval), a4 (val), u67 (ref)
            local u0 = false
            local u1 = nil
            local success = pcall(function() -- Line: 171 -- upvalues: ContentProvider (upval), a2 (upval), a3 (upval), u0 (ref), u1 (ref)
                ContentProvider:PreloadAsync({a2, a3}, function(a1, a2) -- Line: 172 -- upvalues: u0 (upval), u1 (upval)
                    u0 = true
                    if a2 ~= Enum.AssetFetchStatus.Success and not u1 then
                        u1 = a2
                    end
                end)
            end)
            if success then
                if u1 then
                    local Name = u1.Name
                    if not u125 and u42 == u57 and a1.Parent then
                        u125 = true
                        RenderStatus:FireServer(a4, "failed", Name)
                    end
                elseif u0 then
                    local Name_2 = Enum.AssetFetchStatus.Success.Name
                    if not u125 and u42 == u57 and a1.Parent then
                        u125 = true
                        os.clock()
                        a1.Enabled = true
                        RenderStatus:FireServer(a4, "ready", Name_2)
                    end
                elseif not u125 and u42 == u57 and a1.Parent then
                    u125 = true
                    RenderStatus:FireServer(a4, "failed", "Unknown")
                end
            elseif not u125 and u42 == u57 and a1.Parent then
                u125 = true
                RenderStatus:FireServer(a4, "failed", "PreloadException")
            end
        end)
        return
    end
end)