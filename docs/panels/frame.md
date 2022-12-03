# AtlasUI.Frame <client>Client</client>
The `AtlasUI.Frame` is the parent of basically all VGUI elements in AtlasUI.

# Parent
Derives from [EditablePanel](https://wiki.facepunch.com/gmod/EditablePanel).

## AtlasUI.Frame :: SetTitle

```lua
<AtlasUI.Frame>:SetTitle(title: string)
```

Sets the title of the frame.

**Arguments**

1. title - New title of the frame.

---

## AtlasUI.Frame :: ShowCloseButton

```lua
<AtlasUI.Frame>:ShowCloseButton(show: boolean)
```

Determines whether the Frame's close button is displayed.


**Arguments**

1. show - `false` hides the close button, this is `true` by default.

---

# Example

Creates an empty `AtlasUI.Frame`

```lua
local frame = vgui.Create("AtlasUI.Frame")
frame:SetSize(960, 720)
frame:Center()
frame:MakePopup()
frame:SetTitle("Testing Panel!")
```

Final Result
![Output](https://i.imgur.com/elUhYvr.png)