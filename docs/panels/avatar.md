# AtlasUI.Avatar <client>Client</client>

The `AtlasUI.Avatar` is used to show a player's Steam avatar, but rounded.  

# Parent

Derives from [Panel](https://wiki.facepunch.com/gmod/Panel).

## AtlasUI.Avatar :: SetPlayer

```lua
<AtlasUI.Avatar>:SetPlayer(ply: Player, size: number)
```

Used to load an avatar for given player.

**Arguments**

1. The player to use avatar of.
2. The size of the avatar to use. Acceptable sizes are 32, 64, 184.

---

## AtlasUI.Avatar :: SetSteamID

```lua
<AtlasUI.Avatar>:SetSteamID(sid64: string, size: number)
```

Used to load an avatar by its 64-bit Steam ID (community ID).

**Arguments**

1. The 64bit SteamID of the player to load avatar of.
2. The size of the avatar to use. Acceptable sizes are 32, 64, 184.

# Example

```lua
local frame = vgui.Create("AtlasUI.Frame")
frame:SetSize(300, 300)
frame:Center()
frame:MakePopup()
frame:SetTitle("AtlasUI.Avatar")

local size = 128
local avatar = frame:Add("AtlasUI.Avatar")
avatar:SetPlayer(LocalPlayer(), size)
avatar:SetSteamID("76561198172194291", size) -- Atlas' SteamID
avatar:SetVertices(size)
avatar:Dock(FILL)
avatar:DockMargin(40, 40, 40, 40)
```

Final Result  
![Output](https://IMGURFILENEEDED.com/a.png)