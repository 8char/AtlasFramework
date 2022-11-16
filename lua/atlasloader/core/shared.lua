-- Flag to indicate to modules if they are loading for the first time or not
-- if true, a RELOAD bool will be set in the module env
local isReloading = false

local print = function(s,...)
    AtlasLoader.printWithTags("AtlasLoader","TRACE",s,...)
end
local warn = function(s,...)
    AtlasLoader.printWithTags("AtlasLoader","WARNING",s,...)
end

AtlasLoader = AtlasLoader or {}
AModules = AModules or {} -- Lets keep these seprate, just for the ease of accessing.

--- Avaible Log Levels
AtlasLoader.LOG_LEVELS = {
    TRACE = 1,      -- Trace level - Allows print() to be used
    INFO = 2,       -- Info level - Allows print() to be used
    WARNING = 3,    -- Warning level
    ERROR = 99,     -- Error level - No Log prints
}
local MODULE_PREFIX = "amodule_"
local MODULE_FOLDER = "AModules/"


include("atlasloader/core/module_env.lua")
AddCSLuaFile("atlasloader/core/module_env.lua")

function AtlasLoader:FindFilesRecursive(dir, filter, path, prefix)
    path = path or "LUA"
    filter = filter or "*"
    prefix = prefix or ""
    local files, _ = file.Find(dir .. "/" .. filter, path)
    local _,dirs = file.Find(dir .. "/*", path)
    for _, sub_dir in ipairs(dirs) do
        local dirFiles = self:FindFilesRecursive(dir .. "/" .. sub_dir, filter, path, sub_dir .. "/" )
        table.Add(files, dirFiles)
    end
    if prefix != "" then
        for i, v in ipairs(files) do
            files[i] = prefix .. v
        end
    end
    return files
end

function AtlasLoader:LoadModule(info,force_env)
    force_env = not not force_env -- convert to bool
    print("Loading Module:" .. info.name .. " begin")

    --- Automaticly add Clientside files ( if we are a server )
    if SERVER then
        local clientFiles = self:FindFilesRecursive(info.dir, "cl_*.lua")
        local sharedFiles = self:FindFilesRecursive(info.dir, "sh_*.lua")
        AddCSLuaFile(info.dir .. "info.lua")

        for _, fileName in ipairs(clientFiles) do
            print("Adding Clientside File:" .. info.dir .. fileName)
            AddCSLuaFile(info.dir .. fileName)
        end

        for _, fileName in ipairs(sharedFiles) do
            print("Adding Clientside File:" .. info.dir .. fileName)
            AddCSLuaFile(info.dir .. fileName)
        end
    end

    local filesToLoad = {}
    -- sh_init.lua - loads first
    local shFile, _ = file.Find(info.dir .. "sh_init.lua", "LUA")

    if #shFile != 0 then
        filesToLoad[#filesToLoad + 1] = info.dir .. shFile[1]
    end

    local autoShFiles = self:FindFilesRecursive(info.dir, "sh_auto_*.lua")
    for _, fileName in ipairs(autoShFiles) do
        filesToLoad[#filesToLoad + 1] = info.dir .. fileName
    end
    -- cl_init.lua
    if CLIENT then
        local clFile, _ = file.Find(info.dir .. "cl_init.lua", "LUA")

        if #clFile != 0 then
            filesToLoad[#filesToLoad + 1] = info.dir .. clFile[1]
        end

        local autoClFiles = self:FindFilesRecursive(info.dir, "cl_auto_*.lua")
        for _, fileName in ipairs(autoClFiles) do
            filesToLoad[#filesToLoad + 1] = info.dir .. fileName
        end
    else
        local svFile, _ = file.Find(info.dir .. "sv_init.lua", "LUA")

        if #svFile != 0 then
            filesToLoad[#filesToLoad + 1] = info.dir .. svFile[1]
        end

        local autoSvFiles = self:FindFilesRecursive(info.dir, "sv_auto_*.lua")
        for _, fileName in ipairs(autoSvFiles) do
            filesToLoad[#filesToLoad + 1] = info.dir .. fileName
        end
    end

    -- CompileFiles
    local toRun = {}
    local filePaths = {}

    print("Compiling Files")
    for i, path in ipairs(filesToLoad) do
        toRun[i] = CompileFile(path)
        if not toRun[i] then
            warn("Compile failed for " .. path)
        elseif info.logLevel <= self.LOG_LEVELS.TRACE then
            filePaths[toRun[i]] = path
        end
    end
    print("Compilation done")
    -- Setup ENV for functions to run in
    local env = {}

    -- It was already loaded and has an env already
    if (not force_env) and AModules[info.name] then
        print("Reloading Module, using old ENV")
        env = AModules[info.name]
    else -- make new env
        print("Creating new ENV")
        env = self:_createEnv(info)
    end

    env.RELOAD = isReloading
    -- Run Module
    local didError = false
    for _, func in ipairs(toRun) do
        setfenv(func, env)
        if info.logLevel <= self.LOG_LEVELS.TRACE then
            env.trace("Loading:" .. filePaths[func])
        end
        if not ProtectedCall(func) then -- Lets not break everything is a file is broken
            print("Error in file:" .. info.name)
            didError = true
        end
    end

    AModules[info.name] = env
    print("Loading Module:" .. info.name .. " done")
    return not didError
end


--- Loads all Modules
-- Loading order is based on their info.lua depencies.
function AtlasLoader:LoadModules()
    -- Init for Prints
    AtlasLoader.LongestModName = 0
    -- Time tracking mark for logs
    local unixOffset = math.floor(os.time() - RealTime())
    _G.print("[TIME] OFFSET:" .. tostring(unixOffset))
    print("Loading Modules")

    local modules = {} -- Holds all the modules, i = {name, dir}
    local _, folderModules = file.Find(MODULE_FOLDER .. "*", "LUA")
    for _,modName in ipairs(folderModules) do
        modules[#modules + 1] = {name = modName, dir = MODULE_FOLDER .. modName .. "/"}
    end
    -- Finds modules by prefix
    local _, prefixModules = file.Find(MODULE_PREFIX .. "*", "LUA")
    for _,modName in ipairs(prefixModules) do
        modules[#modules + 1] = {name = modName, dir = modName .. "/"}
    end

    --- Module Infomaiton
    local moduleInfos = {}
    local longestModName = 0

    for _, mod in ipairs(modules) do
        local modDir = mod.dir
        -- Find info.json to get info about the file itself.
        print("Load Module Info:" .. modDir .. "info.lua")
        local infoFile, _ = file.Find(modDir .. "info.lua", "LUA")

        if infoFile[1] == nil then
            warn("Couldnt load Module:" .. mod.name .. " because info.lua is missing\n")
            continue -- Skip this module
        end

        local infoPath = modDir .. infoFile[1]
        local info = include(infoPath) or {}

        -- Verify info
        if info.name == nil or type(info.name) != "string" or info.name == "" then
            warn("Module:" .. mod.name .. " does not have a name, defaulting to folder name")
            info.name = mod.name
        end

        if info.logLevel == nil or type(info.logLevel) != "string" then
            warn("No Loglevel was given or was of wrong type, defaulting to info")
            info.logLevel = self.LOG_LEVELS.INFO
        else
            local level = self.LOG_LEVELS[string.Trim(string.upper(info.logLevel))]

            if level == nil then
                warn("Unknown Loglevel " .. info.logLevel .. " defaulting to info")
                info.logLevel = self.LOG_LEVELS.INFO
            else
                info.logLevel = level
            end
        end

        if info.deps == nil or type(info.deps) != "table" then
            print("No Depencies were given, defaulting to none")
            info.deps = {}
        end
        -- Save Directory into info
        info.dir = modDir
        moduleInfos[info.name] = info
        longestModName = math.max(longestModName, #info.name)
    end
    AtlasLoader.LongestModName = longestModName



    local loadingModules = {}
    local loadedModules = {}
    local loadedDisplay = {} -- succesful = true/false, name
    local function load(name)
        --- Is already loaded?
        if loadedModules[name] then
            print("Module already loaded, skipping")

            return true
        end

        -- Recursion detected
        if loadingModules[name] then
            print("Found Recursive Depencies, not loading module")
            loadingModules[name] = nil
            moduleInfos[name] = nil

            return false
        end

        loadingModules[name] = true
        local info = moduleInfos[name]

        -- Loading Dependencies
        for _, depName in pairs(info.deps) do
            print("Loading dependencies for " .. name .. ":" .. depName)

            -- Failed to load, so we can't load either
            if not load(depName) then
                print("Dependency couldnt be loaded, not loading module")
                loadingModules[depName] = nil
                moduleInfos[depName] = nil
                loadedDisplay[#loadedDisplay + 1] = {false, name}
                return false
            end
        end

        local succesful = self:LoadModule(info)
        loadedDisplay[#loadedDisplay + 1] = {succesful, name}
        loadedModules[name] = true
        loadingModules[name] = nil
        return true
    end

    local i = 0
    local cnt = table.Count(moduleInfos)

    while not table.IsEmpty(moduleInfos) do
        i = i + 1

        if i > cnt then
            Error("Tried loading more Modules then exist, exiting!")
        end

        local moduleName = next(moduleInfos)
        load(moduleName) -- try to load module
        moduleInfos[moduleName] = nil
    end
    -- Print out all loadedDisplay in a box made from '#'
    -- If they succesfully loaded a checkmark will appear infront of them
    -- If they failed to load a X will appear infront of them
    -- Example:
    -- ################
    -- # ✘ Module 1  #
    -- # ✔ Module 2  #
    -- # ✔ Module 33 #
    -- ###############
    -- Draw the box
    local boxWidth = self.LongestModName + 5
    AtlasLoader.printWithTags("AtlasLoader","INFO","+" .. string.rep("-", boxWidth - 1 ) .. "+")

    -- Modules
    for _, v in ipairs(loadedDisplay) do
        local name = v[2]
        local succesful = v[1]

        local printString = ""
        if succesful then
            printString = "✔ " .. name
        else
            printString = "✘ " .. name
        end

        AtlasLoader.printWithTags("AtlasLoader","INFO","| " .. printString .. string.rep(" ", self.LongestModName - #name) .. " |")
    end

    -- End box
    AtlasLoader.printWithTags("AtlasLoader","INFO","+" .. string.rep("-",boxWidth - 1) .. "+")

    isReloading = true -- anything past here are reloads
end

function AtlasLoader:ReloadModules(force_env)
    print("Reloading Modules")
    for name, _ in pairs(AModules) do
        self:LoadModule(AModules[name].INFO, force_env)
    end
end

function AtlasLoader:ReloadModule(name, force_env)
    print("Reloading Module:" .. name)
    if AModules[name] then
        self:LoadModule(AModules[name].INFO, force_env)
    else
        warn("Module:" .. name .. " does not exist, cant reload")
    end
end