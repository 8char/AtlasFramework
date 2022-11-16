--- Creates the Env for the Modules
-- [Used Internally]
-- @class AtlasLoader
--- Config

local ENABLE_TIME_TRACKING = true
local TIME_TRACKING_STR_LEN = 7 -- With 7 digits it would only stop working after 115 days


---- Find longest log level name
local longestLogName = 0
for name, _ in pairs(AtlasLoader.LOG_LEVELS) do
    local len = string.len(name)
    if (len > longestLogName) then
        longestLogName = len
    end
end

if SERVER and ENABLE_TIME_TRACKING then
    function AtlasLoader.printWithTags(name,level,s,...)
        local time = tostring(math.floor(RealTime() * 1000))
        time = "[" .. time .. "]" .. string.rep(" ",TIME_TRACKING_STR_LEN - string.len(time) + 1) -- Add 1 space even for the longest name
        name = "[" .. name .. "]" .. string.rep(" ",AtlasLoader.LongestModName - string.len(name) + 1) -- Add 1 space even for the longest name
        level = "[" .. level .. "]" .. string.rep(" ",longestLogName - string.len(level) + 1)
        _G.print("🖿 " .. time .. level .. name .. tostring(s),...)
    end
elseif SERVER and not ENABLE_TIME_TRACKING then
    function AtlasLoader.printWithTags(name,level,s,...)
        name = "[" .. name .. "]" .. string.rep(" ",AtlasLoader.LongestModName - string.len(name) + 1) -- Add 1 space even for the longest name
        level = "[" .. level .. "]" .. string.rep(" ",longestLogName - string.len(level) + 1)
        _G.print("🖿 " .. level .. name .. tostring(s),...)
    end
elseif CLIENT then
    function AtlasLoader.printWithTags(name,level,s,...)
        name = "[" .. name .. "]" .. string.rep(" ",AtlasLoader.LongestModName - string.len(name) + 1) -- Add 1 space even for the longest name
        level = "[" .. level .. "]" .. string.rep(" ",longestLogName - string.len(level) + 1)
        _G.print(level .. name .. tostring(s),...)
    end
end


function AtlasLoader:_createEnv(info)
    local env = setmetatable({}, {
        __index = _G
    })

    --- Custom variables
    env.INFO = info
    env.VER = info.ver

    --- Custom Functions
    -- LOG
    if info.logLevel <= self.LOG_LEVELS.TRACE then
        env.trace = function(...)
            AtlasLoader.printWithTags(info.name,"TRACE",...)
        end

        env.traceTable = PrintTable
    else
        env.trace = function() end
        env.traceTable = function() end
    end

    if info.logLevel <= self.LOG_LEVELS.INFO then
        env.print = function(...)
            AtlasLoader.printWithTags(info.name,"INFO",...)
        end

        env.PrintTable = PrintTable
    else
        env.print = function() end
        env.PrintTable = function() end
    end

    env.info = env.print
    env.infoTable = env.PrintTable

    if info.logLevel <= self.LOG_LEVELS.WARNING then
        env.warn = function(...)
            AtlasLoader.printWithTags(info.name,"WARNING",...)
        end

        env.warnTable = PrintTable
    else
        env.warn = function() end
        env.warnTable = function() end
    end


    --- Custom Include Function

    function env.includeLocal(path)
        local inf = debug.getinfo(2,"S")
        local ownPath = inf.source
        env.print(ownPath)
        local _,luaStart = string.find(ownPath,"lua",1,false)
        ownPath = string.sub(ownPath,luaStart + 2) -- start path after lua/
        ownPath = string.GetPathFromFilename(ownPath) -- remove file at end
        return include(ownPath .. path)
    end

    return env
end