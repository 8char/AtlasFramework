# AtlasUI.Button <client>Client</client>

The `AtlasUI.Button` panel is used to represent a button that can be clicked, hovered, etc.

## Parent

Derives from [DButton](https://wiki.facepunch.com/gmod/DButton).

# AtlasUI.Button :: GetRoundness

```lua
<AtlasUI.Button>:GetRoundness()
```

Gets the roundness of the buttons rectangle.

---

# AtlasUI.Button :: SetRoundness

```lua
<AtlasUI.Button>:SetRoundness(roundness: number)
```

Sets the roundness of the buttons rectangle, that being the radius.

## Arguments

1. roundness - The radius that you want each corner to have, setting it to 0 will disable the masking!

---

# AtlasUI.Button :: GetDisabled

```lua
<AtlasUI.Button>:GetDisabled()
```

Used to get if the button is disabled or not. This will turn the mouse in to a red circle with a line going through it signifying that you can't click it.

---

# AtlasUI.Button :: SetDisabled

```lua
<AtlasUI.Button>:SetDisabled(disabled: boolean)
```

Used to set if the button is disabled or not. This will turn the mouse in to a red circle with a line going through it signifying that you can't click it if set to true, if set to false it will allow the normal mouse "hand".

## Arguments

1. disabled - Shoud the button be disabled or not?

---

# AtlasUI.Button :: GetLoadingImageSizeSub <internal>INTERNAL</internal>

```lua
<AtlasUI.Button>:GetLoadingImageSizeSub()
```

Used to get the size of the loading image, might be useful. However this really shouldn't be called as it's only meant for internal use.

---

# AtlasUI.Button :: SetLoadingImageSizeSub <internal>INTERNAL</internal>

```lua
<AtlasUI.Button>:SetLoadingImageSizeSub(size: number)
```

Used to set the size of the loading image, might be useful. However this really shouldn't be called as it's only meant for internal use.

## Arguments

1. size - The size that you want the loading image to have.

---

# AtlasUI.Button :: GetAwaitingResponse

```lua
<AtlasUI.Button>:GetAwaitingResponse()
```

Used to get weather the button is awaiting a response.

---

# AtlasUI.Button :: SetAwaitingResponse <internal>INTERNAL</internal>

```lua
<AtlasUI.Button>:SetAwaitingResponse(awaitingResponse: boolean)
```

Used to set if the button should be awaiting a response, this will in turn change its own text to reflect the loading image and such.

## Arguments

1. awaitingResponse - Sets if the button should be awaiting a response, true will remove the text and set a loading image to be active, and doing the opposite will set the text back to what it originally was.

---

# AtlasUI.Button :: GetLoadingColor

```lua
<AtlasUI.Button>:GetLoadingColor()
```

Gets the loading image color of the loading image.

---

# AtlasUI.Button :: SetLoadingColor

```lua
<AtlasUI.Button>:SetLoadingColor(color: Color)
```

Sets the loading image color of the loading image.

## Arguments

1. color - Which color the the loading image should be

---

# AtlasUI.Button :: GetOldText <internal>INTERNAL</internal>

```lua
<AtlasUI.Button>:GetOldText()
```

Internally used to get the old text inside of the `<AtlasUI.Button>:SetAwaitingResponse()` method.

---

# AtlasUI.Button :: SetOldText <internal>INTERNAL</internal>

```lua
<AtlasUI.Button>:SetOldText(oldText: string)
```

Internally used to set the old text inside of the `<AtlasUI.Button>:SetAwaitingResponse()` method to later be used in the button when the `AwaitingResponse` state changes.

## Arguments

1. oldText - The text which will be added once the `AwaitingResponse` state changes

---

# AtlasUI.Button :: GetOutline

```lua
<AtlasUI.Button>:GetOutline()
```

Gets the width of the outline of the button.

---

# AtlasUI.Button :: SetOutline

```lua
<AtlasUI.Button>:SetOutline(outline: number)
```

Sets the width of the outline of the button. Will draw the outline with the `<AtlasUI.Button>:GetTextColorCur()`

## Arguments

1. outline - The thickness of the outline which it should be set to.

---

# AtlasUI.Button :: GetBackgroundColor

```lua
<AtlasUI.Button>:GetBackgroundColor()
```

Gets the background color of the button.

---

# AtlasUI.Button :: SetBackgroundColor

```lua
<AtlasUI.Button>:SetBackgroundColor(color: Color)
```

Sets the background color of the button

## Arguments

1. color - The color that the button should be set to

---

# AtlasUI.Button :: GetBackgroundColorOn

```lua
<AtlasUI.Button>:GetBackgroundColorOn()
```

Gets the background color of the button when it's hovered.

---

# AtlasUI.Button :: SetBackgroundColorOn

```lua
<AtlasUI.Button>:SetBackgroundColorOn(color: Color)
```

Sets the background color of the button when it's hovered.

## Arguments

1. color - The color of the background that the button should be set to when hovered.

---

# AtlasUI.Button :: GetBackgroundColorOff

```lua
<AtlasUI.Button>:GetBackgroundColorOff()
```

Gets the background of the button when you are no longer hovering it.

---

# AtlasUI.Button :: SetBackgroundColorOff

```lua
<AtlasUI.Button>:SetBackgroundColorOff(color: Color)
```

Sets the background of the button when you are no longer hovering it.

## Arguments

1. color - The color that the background should transition to when the button isn't hovered

---

# AtlasUI.Button :: GetTextColorCur <internal>INTERNAL</internal>

```lua
<AtlasUI.Button>:GetTextColorCur()
```

Gets the textcolors current value. Used internally for the chaning of the hover color and such. Really shouldn't have to be called outside of AtlasUI

---

# AtlasUI.Button :: SetTextColorCur <internal>INTERNAL</internal>

```lua
<AtlasUI.Button>:SetTextColorCur(color: Color)
```

Sets the textcolors current value. Used internally for the chaning of the hover color and such. Really shouldn't have to be called outside of AtlasUI

## Arguments

1. color - The current color that the button should be set to.

---

# AtlasUI.Button :: GetTextColorOn

```lua
<AtlasUI.Button>:GetTextColorOn()
```

desc

---

# AtlasUI.Button :: SetTextColorOn

```lua
<AtlasUI.Button>:SetTextColorOn(arg1: TYPE)
```

desc

## Arguments

1. arg1 - DESC

---

# AtlasUI.Button :: GetTextColorOff

```lua
<AtlasUI.Button>:GetTextColorOff()
```

desc

---

# AtlasUI.Button :: SetTextColorOff

```lua
<AtlasUI.Button>:SetTextColorOff(arg1: TYPE)
```

desc

## Arguments

1. arg1 - DESC

---

# AtlasUI.Button :: GetEnableShadow

```lua
<AtlasUI.Button>:GetEnableShadow()
```

desc

---

# AtlasUI.Button :: SetEnableShadow

```lua
<AtlasUI.Button>:SetEnableShadow(arg1: TYPE)
```

desc

## Arguments

1. arg1 - DESC

---

# AtlasUI.Button :: GetShadowAlpha

```lua
<AtlasUI.Button>:GetShadowAlpha()
```

desc

---

# AtlasUI.Button :: SetShadowAlpha

```lua
<AtlasUI.Button>:SetShadowAlpha(arg1: TYPE)
```

desc

## Arguments

1. arg1 - DESC

---

# AtlasUI.Button :: GetShadowAlphaOn

```lua
<AtlasUI.Button>:GetShadowAlphaOn()
```

desc

---

# AtlasUI.Button :: SetShadowAlphaOn

```lua
<AtlasUI.Button>:SetShadowAlphaOn(arg1: TYPE)
```

desc

## Arguments

1. arg1 - DESC

---

# AtlasUI.Button :: GetShadowAlphaOff

```lua
<AtlasUI.Button>:GetShadowAlphaOff()
```

desc

---

# AtlasUI.Button :: SetShadowAlphaOff

```lua
<AtlasUI.Button>:SetShadowAlphaOff(arg1: TYPE)
```

desc

## Arguments

1. arg1 - DESC