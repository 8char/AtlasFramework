if SERVER then
    include ("AtlasLoader/core/shared.lua")
    AddCSLuaFile("AtlasLoader/core/shared.lua")
else -- Client
    include("AtlasLoader/core/shared.lua")
end

AtlasLoader:LoadModules()
