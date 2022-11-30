# AtlasUI.ButtonV2 <client>Client</client>

The `AtlasUI.ButtonV2` panel is used to represent a button that can be clicked, hovered, etc.

## Parent

Derives from [DButton](https://wiki.facepunch.com/gmod/DButton).

# Methods
All write operations to build the object is available here.

```lua
<AtlasUI.ButtonV2>:SetStartColor(color: Color)
```

Sets the start color of the gradient. Note that this will only be used if `<AtlasUI.ButtonV2>SetGradient(true)`

## Arguements

1. color - The color that the start color should be set to.

---

```lua
<AtlasUI.ButtonV2>:GetStartColor()
```

Gets the start color of the gradient.

---

```lua
<AtlasUI.ButtonV2>:SetEndColor(color: Color)
```

Sets the end color of the gradient. Note that this will only be used if `<AtlasUI.ButtonV2>SetGradient(true)`

## Arguements

1. color - The color that the end color should be set to.

---

```lua
<AtlasUI.ButtonV2>:GetEndColor()
```

Gets the end color of the gradient.

---

```lua
<AtlasUI.ButtonV2>:SetRoundness(roundness: number)
```

Will set the radius of the corners, if this is set to 0, then it will disable masking.

## Arguements

1. roundness - The radius of the button that you want it set to.

---

```lua
<AtlasUI.ButtonV2>:GetRoundness()
```

Gets the end color of the gradient.

---

```lua
<AtlasUI.ButtonV2>:SetXOffset(offset: number)
```

Will set the x offset of the button text.

## Arguements

1. offset - The x offset of the text that you want

---

```lua
<AtlasUI.ButtonV2>:GetXOffset()
```

Gets the x offset of the buttons text.

---

```lua
<AtlasUI.ButtonV2>:SetYOffset(offset: number)
```

Will set the y offset of the button text.

## Arguements

1. offset - The x offset of the text that you want

---

```lua
<AtlasUI.ButtonV2>:GetXOffset()
```

Gets the x offset of the buttons text.

---

```lua
<AtlasUI.ButtonV2>:SetIcon(iconId: number)
```

Will set the icon of the button to be that if the icon id. If you're unsure about how to use this, have a look at our [Icon Downloader](libs/icon_dl.md) library usage.

## Arguements

1. iconId - The numerical id of the icon that you want the button to display

---

```lua
<AtlasUI.ButtonV2>:GetIcon()
```

Gets the icon id of the icon that is stored on the button.

---

```lua
<AtlasUI.ButtonV2>:SetHoverColor(color: Color)
```

Used to change hover for non buttons on hover

## Arguements

1. color - The hover color for non buttons

---

```lua
<AtlasUI.ButtonV2>:GetHoverColor()
```

Gets the color value for the non buttons on hover.

---

```lua
<AtlasUI.ButtonV2>:SetSolidColor(color: Color)
```

Used to change the solid color of the button

## Arguements

1. color - The color for the solid button

---

```lua
<AtlasUI.ButtonV2>:GetSolidColor()
```

Gets the color value of the button

---

```lua
<AtlasUI.ButtonV2>:SetTextColor(color: Color)
```

Used to change the text color of the button

## Arguements

1. color - The text color of the button

---

```lua
<AtlasUI.ButtonV2>:GetTextColor()
```

Gets the color value of the button's text

---

```lua
<AtlasUI.ButtonV2>:SetIconSize(size: number)
```

Used to change the text color of the button

## Arguements

1. size - The icon size

---

```lua
<AtlasUI.ButtonV2>:GetIconSize()
```

Gets the icon size of the button

---

```lua
<AtlasUI.ButtonV2>:IsGradient()
```

Used to get if the gradient is active or not

## Returns

1. Is the button color displaying a gradient?

---

```lua
<AtlasUI.ButtonV2>:RoundFromTallness()
```

Will round it to how tall the button is, aka make the radius of the button a continous circle
