# AtlasUI.ButtonV2 <client>Client</client>

The `AtlasUI.ButtonV2` panel is used to represent a button that can be clicked, hovered, etc.

## Parent

Derives from [DButton](https://wiki.facepunch.com/gmod/DButton).

# AtlasUI.ButtonV2 :: SetStartColor

```lua
<AtlasUI.ButtonV2>:SetStartColor(color: Color)
```

Sets the start color of the gradient. Note that this will only be used if `<AtlasUI.ButtonV2>SetGradient(true)`

## Arguments

1. color - The color that the start color should be set to.

---

# AtlasUI.ButtonV2 :: GetStartColor

```lua
<AtlasUI.ButtonV2>:GetStartColor()
```

Gets the start color of the gradient.

---

# AtlasUI.ButtonV2 :: SetEndColor

```lua
<AtlasUI.ButtonV2>:SetEndColor(color: Color)
```

Sets the end color of the gradient. Note that this will only be used if `<AtlasUI.ButtonV2>SetGradient(true)`

## Arguments

1. color - The color that the end color should be set to.

---

# AtlasUI.ButtonV2 :: GetEndColor

```lua
<AtlasUI.ButtonV2>:GetEndColor()
```

Gets the end color of the gradient.

---

# AtlasUI.ButtonV2 :: SetRoundness

```lua
<AtlasUI.ButtonV2>:SetRoundness(roundness: number)
```

Will set the radius of the corners, if this is set to 0, then it will disable masking.

## Arguments

1. roundness - The radius of the button that you want it set to.

---

# AtlasUI.ButtonV2 :: GetRoundness

```lua
<AtlasUI.ButtonV2>:GetRoundness()
```

Gets the end color of the gradient.

---

# AtlasUI.ButtonV2 :: SetXOffset

```lua
<AtlasUI.ButtonV2>:SetXOffset(offset: number)
```

Will set the x offset of the button text.

## Arguments

1. offset - The x offset of the text that you want

---

# AtlasUI.ButtonV2 :: GetXOffset

```lua
<AtlasUI.ButtonV2>:GetXOffset()
```

Gets the x offset of the buttons text.

---

# AtlasUI.ButtonV2 :: SetYOffset

```lua
<AtlasUI.ButtonV2>:SetYOffset(offset: number)
```

Will set the y offset of the button text.

## Arguments

1. offset - The x offset of the text that you want

---

# AtlasUI.ButtonV2 :: GetXOffset

```lua
<AtlasUI.ButtonV2>:GetXOffset()
```

Gets the x offset of the buttons text.

---

# AtlasUI.ButtonV2 :: SetIcon

```lua
<AtlasUI.ButtonV2>:SetIcon(iconId: number)
```

Will set the icon of the button to be that if the icon id. If you're unsure about how to use this, have a look at our [Icon Downloader](libs/icon_dl.md) library usage.

## Arguments

1. iconId - The numerical id of the icon that you want the button to display

---

# AtlasUI.ButtonV2 :: GetIcon

```lua
<AtlasUI.ButtonV2>:GetIcon()
```

Gets the icon id of the icon that is stored on the button.

---

# AtlasUI.ButtonV2 :: SetHoverColor

```lua
<AtlasUI.ButtonV2>:SetHoverColor(color: Color)
```

Used to change hover for non buttons on hover

## Arguments

1. color - The hover color for non buttons

---

# AtlasUI.ButtonV2 :: GetHoverColor

```lua
<AtlasUI.ButtonV2>:GetHoverColor()
```

Gets the color value for the non buttons on hover.

---

# AtlasUI.ButtonV2 :: SetSolidColor

```lua
<AtlasUI.ButtonV2>:SetSolidColor(color: Color)
```

Used to change the solid color of the button

## Arguments

1. color - The color for the solid button

---

# AtlasUI.ButtonV2 :: GetSolidColor

```lua
<AtlasUI.ButtonV2>:GetSolidColor()
```

Gets the color value of the button

---

# AtlasUI.ButtonV2 :: SetTextColor

```lua
<AtlasUI.ButtonV2>:SetTextColor(color: Color)
```

Used to change the text color of the button

## Arguments

1. color - The text color of the button

---

# AtlasUI.ButtonV2 :: GetTextColor

```lua
<AtlasUI.ButtonV2>:GetTextColor()
```

Gets the color value of the button's text

---

# AtlasUI.ButtonV2 :: SetIconSize

```lua
<AtlasUI.ButtonV2>:SetIconSize(size: number)
```

Used to change the text color of the button

## Arguments

1. size - The icon size

---

# AtlasUI.ButtonV2 :: GetIconSize

```lua
<AtlasUI.ButtonV2>:GetIconSize()
```

Gets the icon size of the button

---

# AtlasUI.ButtonV2 :: IsGradient

```lua
<AtlasUI.ButtonV2>:IsGradient()
```

Used to get if the gradient is active or not

## Returns

1. Is the button color displaying a gradient?

---

# AtlasUI.ButtonV2 :: RoundFromTallness

```lua
<AtlasUI.ButtonV2>:RoundFromTallness()
```

Will round it to how tall the button is, aka make the radius of the button a continous circle
