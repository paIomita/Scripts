-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CommonUtils.FlagUtil

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CommonUtils.FlagUtil
-- Decompile time: 0.16 ms

return {
    getUserFlag = function(a1) -- Line: 11
        local success, err = pcall(function() -- Line: 12 -- upvalues: a1 (val)
            return (UserSettings()):IsUserFeatureEnabled(a1)
        end)
        return success and err
    end,
}