AtlasUI = AtlasUI or {}

local function buildPath(path)
    return "atlasui/" .. path .. ".lua"
end

function AtlasUI:IncludeClient(path)
	if (CLIENT) then
		include(buildPath(path))
	end

	if (SERVER) then
		AddCSLuaFile(buildPath(path))
	end
end

function AtlasUI:IncludeServer(path)
	if (SERVER) then
		include(buildPath(path))
	end
end

function AtlasUI:IncludeShared(path)
	AtlasUI:IncludeServer(path)
	AtlasUI:IncludeClient(path)
end

AtlasUI:IncludeClient("settings/theme")

AtlasUI:IncludeClient("elements/frame")
AtlasUI:IncludeClient("elements/navbar")
AtlasUI:IncludeClient("elements/skill")
AtlasUI:IncludeClient("elements/summary")

AtlasUI:IncludeClient("libs/essentials")

AtlasUI:IncludeClient("test/frame")