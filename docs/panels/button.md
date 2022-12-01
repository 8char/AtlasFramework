```lua
<AtlasUI.Button>:GetRoundness()
```

Gets the roundness of the buttons rectangle.

---

```lua
<AtlasUI.Button>:SetRoundness(roundness: number)
```

Sets the roundness of the buttons rectangle, that being the radius.

## Arguments

1. roundness - The radius that you want each corner to have, setting it to 0 will disable the masking!

---


```lua
<AtlasUI.Button>:GetDisabled()
```

Used to get if the button is disabled or not. This will turn the mouse in to a red circle with a line going through it signifying that you can't click it.

---

```lua
<AtlasUI.Button>:SetDisabled(disabled: boolean)
```

Used to set if the button is disabled or not. This will turn the mouse in to a red circle with a line going through it signifying that you can't click it if set to true, if set to false it will allow the normal mouse "hand".

## Arguments

1. disabled - Shoud the button be disabled or not?

---


```lua
<AtlasUI.Button>:GetLoadingImageSizeSub()
```

<internal>INTERNAL</internal> Used to get the size of the loading image, might be useful. However this really shouldn't be called as it's only meant for internal use.

---

```lua
<AtlasUI.Button>:SetLoadingImageSizeSub(size: number)
```

<internal>INTERNAL</internal> Used to set the size of the loading image, might be useful. However this really shouldn't be called as it's only meant for internal use.

## Arguments

1. size - The size that you want the loading image to have.

---


```lua
<AtlasUI.Button>:GetAwaitingResponse()
```

Used to get weather the button is awaiting a response.

---

```lua
<AtlasUI.Button>:SetAwaitingResponse(awaitingResponse: boolean)
```

<internal>INTERNAL</internal> Used to set if the button should be awaiting a response, this will in turn change its own text to reflect the loading image and such.

## Arguments

1. awaitingResponse - Sets if the button should be awaiting a response, true will remove the text and set a loading image to be active, and doing the opposite will set the text back to what it originally was.

---


```lua
<AtlasUI.Button>:GetLoadingColor()
```

Gets the loading image color of the loading image.

---

```lua
<AtlasUI.Button>:SetLoadingColor(color: Color)
```

Sets the loading image color of the loading image.

## Arguments

1. color - Which color the the loading image should be

---


```lua
<AtlasUI.Button>:GetOldText()
```

<internal>INTERNAL</internal> Internally used to get the old text inside of the `<AtlasUI.Button>:SetAwaitingResponse()` method.

---

```lua
<AtlasUI.Button>:SetOldText(oldText: string)
```

<internal>INTERNAL</internal> Internally used to set the old text inside of the `<AtlasUI.Button>:SetAwaitingResponse()` method to later be used in the button when the `AwaitingResponse` state changes.

## Arguments

1. oldText - The text which will be added once the `AwaitingResponse` state changes

---


```lua
<AtlasUI.Button>:GetOutline()
```

Gets the width of the outline of the button.

---

```lua
<AtlasUI.Button>:SetOutline(outline: number)
```

Sets the width of the outline of the button. Will draw the outline with the `<AtlasUI.Button>:GetTextColorCur()`

## Arguments

1. outline - The thickness of the outline which it should be set to.

---


```lua
<AtlasUI.Button>:GetBackgroundColor()
```

Gets the background color of the button.

---

```lua
<AtlasUI.Button>:SetBackgroundColor(color: Color)
```

Sets the background color of the button

## Arguments

1. color - The color that the button should be set to

---


```lua
<AtlasUI.Button>:GetBackgroundColorOn()
```

Gets the background color of the button when it's hovered.

---

```lua
<AtlasUI.Button>:SetBackgroundColorOn(color: Color)
```

Sets the background color of the button when it's hovered.

## Arguments

1. color - The color of the background that the button should be set to when hovered.

---


```lua
<AtlasUI.Button>:GetBackgroundColorOff()
```

Gets the background of the button when you are no longer hovering it.

---

```lua
<AtlasUI.Button>:SetBackgroundColorOff(color: Color)
```

Sets the background of the button when you are no longer hovering it.

## Arguments

1. color - The color that the background should transition to when the button isn't hovered

---


```lua
<AtlasUI.Button>:GetTextColorCur()
```

<internal>INTERNAL</internal> Gets the textcolors current value. Used internally for the chaning of the hover color and such. Really shouldn't have to be called outside of AtlasUI

---

```lua
<AtlasUI.Button>:SetTextColorCur(color: Color)
```

<internal>INTERNAL</internal> Sets the textcolors current value. Used internally for the chaning of the hover color and such. Really shouldn't have to be called outside of AtlasUI

## Arguments

1. color - The current color that the button should be set to.

---


```lua
<AtlasUI.Button>:GetTextColorOn()
```

desc

---

```lua
<AtlasUI.Button>:SetTextColorOn(arg1: TYPE)
```

desc

## Arguments

1. arg1 - DESC

---


```lua
<AtlasUI.Button>:GetTextColorOff()
```

desc

---

```lua
<AtlasUI.Button>:SetTextColorOff(arg1: TYPE)
```

desc

## Arguments

1. arg1 - DESC

---


```lua
<AtlasUI.Button>:GetEnableShadow()
```

desc

---

```lua
<AtlasUI.Button>:SetEnableShadow(arg1: TYPE)
```

desc

## Arguments

1. arg1 - DESC

---


```lua
<AtlasUI.Button>:GetShadowAlpha()
```

desc

---

```lua
<AtlasUI.Button>:SetShadowAlpha(arg1: TYPE)
```

desc

## Arguments

1. arg1 - DESC

---


```lua
<AtlasUI.Button>:GetShadowAlphaOn()
```

desc

---

```lua
<AtlasUI.Button>:SetShadowAlphaOn(arg1: TYPE)
```

desc

## Arguments

1. arg1 - DESC

---


```lua
<AtlasUI.Button>:GetShadowAlphaOff()
```

desc

---

```lua
<AtlasUI.Button>:SetShadowAlphaOff(arg1: TYPE)
```

desc

## Arguments

1. arg1 - DESC

---