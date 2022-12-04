# Essentials <client>Client</client>
A nice set of client utility methods and such.

# AtlasUI :: DrawBlur

```lua
AtlasUI:DrawBlur(panel: Panel, amount?: number)
```

Renders a blur effect on the specified panel.

**Arguments**
1. panel - The panel to blur.
2. amount - The strength of the blur effect. Optional, defaults to 6.

---

# AtlasUI :: DrawBlurHUD

```lua
AtlasUI:DrawBlurHUD(x: number, y: number, w: number, h: number, amt?: number)
```

Renders a blur effect on the specified region of the screen.

**Arguments**
1. x - The x-coordinate of the top-left corner of the region to blur.
2. y - The y-coordinate of the top-left corner of the region to blur.
3. w - The width of the region to blur.
4. h - The height of the region to blur.
5. amt - The strength of the blur effect. Optional, defaults to 5.

---

# AtlasUI :: FormatTime

```lua
AtlasUI:FormatTime(seconds: number, format: string) :: string
```

Formats a given number of seconds into a string using the specified format.

**Arguments**
1. seconds - The number of seconds to format.
2. format - The format string to use.

**Returns**
1. The formatted time string.

---

# draw.SimpleLinearGradient

```lua
draw.SimpleLinearGradient(x: number, y: number, w: number, h: number, startColor: Color, endColor: Color, horizontal: boolean)
```

Renders a simple linear gradient on the screen with the specified start and end colors, in the specified region and orientation.

**Arguments**
1. x - The x-coordinate of the top-left corner of the region to render the gradient in.
2. y - The y-coordinate of the top-left corner of the region to render the gradient in.
3. w - The width of the region to render the gradient in.
4. h - The height of the region to render the gradient in.
5. startColor - The starting color of the gradient.
6. endColor - The ending color of the gradient.
7. horizontal - Whether the gradient should be rendered horizontally or vertically.

**Example**
```lua
hook.Add("HUDPaint", "test", function()
  draw.SimpleLinearGradient(100, 200, 100, 100, Color(255, 0, 0), Color(255, 255, 0), false)
  draw.SimpleLinearGradient(250, 200, 100, 100, Color(0, 255, 0), Color(0, 0, 255), true)
end)
```

---

# AtlasUI :: DrawRotatedTexture

```lua
AtlasUI:DrawRotatedTexture(x: number, y: number, w: number, h: number, angle: number, cx: number, cy: number)
```

Renders a texture at the specified coordinates with the specified size, angle of rotation, and center of rotation. If the center of rotation is not specified, the center of the texture will be used as the center of rotation.

**Arguments**
1. x - The x-coordinate of the top-left corner of the region to render the texture in.
2. y - The y-coordinate of the top-left corner of the region to render the texture in.
3. w - The width of the texture.
4. h - The height of the texture.
5. angle - The angle of rotation for the texture.
6. cx - The x-coordinate of the center of rotation for the texture.
7. cy - The y-coordinate of the center of rotation for the texture.

**Example**
```lua
hook.Add("HUDPaint", "test", function()
  AtlasUI:DrawRotatedTexture(100, 200, 100, 100, 45, 50, 50)
end)
```

---

# AtlasUI :: DrawCreditsText

```lua
AtlasUI:DrawCreditsText(text: string, font: string, x: number, y: number, col: Color, xAlign: number, yAlign: number, textY?: number, iconColor?: Color, spacing?: number)
```

This method draws text on the screen with a credit icon next to it. The position of the icon can be adjusted by setting the `xAlign` parameter.

**Arguments**

1. text - The text to draw.
2. font - The font to use for the text.
3. x - The x-coordinate of the top-left corner of the region to render the text in.
4. y - The y-coordinate of the top-left corner of the region to render the text in.
5. col - The color of the text.
6. xAlign - The horizontal alignment of the text and icon. Can be one of the following:
   * `TEXT_ALIGN_LEFT`: align the text and icon to the left.
   * `TEXT_ALIGN_CENTER`: align the text and icon to the center.
   * `TEXT_ALIGN_RIGHT`: align the text and icon to the right.
7. yAlign - The vertical alignment of the text and icon. Can be one of the following:
   * `TEXT_ALIGN_TOP`: align the text and icon to the top.
   * `TEXT_ALIGN_CENTER`: align the text and icon to the center.
   * `TEXT_ALIGN_BOTTOM`: align the text and icon to the bottom.
8. textY - The vertical offset to apply to the text. Optional, defaults to 1.
9. iconColor - The color of the credit icon. Optional, defaults to white.
10. spacing - The horizontal space to leave between the text and the credit icon. Optional, defaults to 4.

---

# AtlasUI :: DrawArc

```lua
AtlasUI:DrawArc(x: number, y: number, ang: number, p: number, rad: number, color: Color, seg?: number)
```

This method draws an arc on the screen using the given parameters.

**Arguments**

1. x - The x-coordinate of the center of the arc.
2. y - The y-coordinate of the center of the arc.
3. ang - The starting angle of the arc in degrees.
4. p - The sweep angle of the arc in degrees.
5. rad - The radius of the arc.
6. color - The color of the arc.
7. seg - The number of segments to use when drawing the arc. Optional, defaults to 80.

**Example**

```lua
hook.Add("HUDPaint", "AtlasUI_DrawArc", function()
    AtlasUI:DrawArc(100, 100, 0, 180, 50, Color(255, 0, 0), 100)
end)
```

This code will draw a red arc with a radius of 50 pixels that starts at the top of the circle (angle 0) and sweeps 180 degrees in a counter-clockwise direction. The arc will be made up of 100 segments.

--

# AtlasUI :: CalculateArc

```lua
AtlasUI:CalculateArc(x: number, y: number, ang: number, p: number, rad: number, seg?: number) :: table
```

This method calculates the points of an arc with the specified parameters and returns them as a table of coordinates.

**Arguments**

1. x - The x-coordinate of the center of the arc.
2. y - The y-coordinate of the center of the arc.
3. ang - The angle at which the arc should start, in degrees.
4. p - The total angle of the arc, in degrees.
5. rad - The radius of the arc.
6. seg - The number of segments to use when calculating the arc points. Optional, defaults to 80.

**Returns**

A table containing the coordinates of the points along the arc, in the form `{x = number, y = number}`.

**Examples**

```lua
AtlasUI:CalculateArc(0, 0, 0, 180, 50)
```

This code will calculate the points of a semicircle with a radius of 50 centered at the origin, starting at the 3 o'clock position and extending counterclockwise. The resulting table will contain 81 points (the center point plus 80 points along the arc).

---

# AtlasUI :: DrawCachedArc

```lua
AtlasUI:DrawCachedArc(circle: table, color: Color)
```

This method draws an arc on the screen using the specified table of coordinates and color.

**Arguments**

1. circle - A table containing the coordinates of the points along the arc, in the form `{x = number, y = number}`.
2. color - The color to use when drawing the arc.



**Example**

```lua
local circle = AtlasUI:CalculateArc(100, 100, 90, 360, 50)
hook.Add("HUDPaint", "AtlasUI_DrawCachedArc", function()
    AtlasUI:DrawCachedArc(circle, Color(255, 0, 0))
end)
```

This code will calculate the points of a circle with a radius of 50 centered at (100, 100) and draw it using the color red, on each frame of the `HUDPaint` hook. The coordinates of the circle are only calculated once and then cached for subsequent frames, improving performance.

**Implementation Details**

The function sets the current draw color to the specified color, disables texturing, and calls `surface.DrawPoly()` using the given table of coordinates. This will draw a closed polygon using the coordinates in the table as vertices. Since the coordinates are calculated using an arc, the resulting polygon will approximate an arc. The number of vertices and the precision of the approximation can be controlled by the `seg` parameter in the `AtlasUI:CalculateArc()` function.

---

# AtlasUI :: DrawRoundedBoxEx

AtlasUI:DrawRoundedBoxEx(radius: number, x: number, y: number, w: number, h: number, col: Color, tl: boolean, tr: boolean, bl: boolean, br: boolean)

This method draws a rounded box on the screen with the specified dimensions and color. The corners of the box can be rounded or squared, depending on the value of the corner flags.

**Arguments**

1. radius - The radius of the corners of the box.
2. x - The x-coordinate of the top-left corner of the box.
3. y - The y-coordinate of the top-left corner of the box.
4. w - The width of the box.
5. h - The height of the box.
6. col - The color of the box.
7. tl - A flag that specifies whether the top-left corner of the box should be rounded (`true`) or squared (`false`).
8. tr - A flag that specifies whether the top-right corner of the box should be rounded (`true`) or squared (`false`).
9. bl - A flag that specifies whether the bottom-left corner of the box should be rounded (`true`) or squared (`false`).
10. br - A flag that specifies whether the bottom-right corner of the box should be rounded (`true`) or squared (`false`).

**Example**

```lua
hook.Add("HUDPaint", "AtlasUI_DrawRoundedBoxEx", function()
    AtlasUI:DrawRoundedBoxEx(10, 100, 100, 200, 100, Color(0, 255, 0), true, false, true, false)
end)
```

This code will draw a box with rounded top-left and bottom-left corners, and squared top-right and bottom-right corners, with a radius of 10 pixels, at the coordinates (100, 100), with a size of 200 pixels by 100 pixels, and using the color green on each frame of the `HUDPaint` hook.

**Implementation Details**

The function first clamps the values of the input parameters to the nearest integer, and ensures that the radius is not larger than half the width or height of the box. If the radius is 0, it simply draws a solid colored rectangle using `surface.DrawRect()` and returns.

Otherwise, it draws the top, middle, and bottom rectangles of the box using `surface.DrawRect()`, and then draws the corners using the `AtlasUI:DrawArc()` function. The corners are drawn only if the corresponding flag is `true`, otherwise a solid colored square is drawn at the corner using `surface.DrawRect()`.

The `AtlasUI:DrawArc()` function draws the arcs using `surface.DrawArc()` and the given radius and color. The

---

# AtlasUI :: DrawRoundedBox

AtlasUI:DrawRoundedBox(radius: number, x: number, y: number, w: number, h: number, col: Color)

This method draws a rounded box on the screen with the specified dimensions and color. All corners of the box are rounded.

**Arguments**

1. radius - The radius of the corners of the box.
2. x - The x-coordinate of the top-left corner of the box.
3. y - The y-coordinate of the top-left corner of the box.
4. w - The width of the box.
5. h - The height of the box.
6. col - The color of the box.

**Example**

```lua
hook.Add("HUDPaint", "AtlasUI_DrawRoundedBox", function()
    AtlasUI:DrawRoundedBox(10, 100, 100, 200, 100, Color(0, 255, 0))
end)
```

This code will draw a box with rounded corners, with a radius of 10 pixels, at the coordinates (100, 100), with a size of 200 pixels by 100 pixels, and using the color green on each frame of the `HUDPaint` hook.

---

# AtlasUI :: DrawMultiLine

```lua
AtlasUI.DrawMultiLine(text: string, font: string, mWidth: number, spacing: number, x: number, y: number, color: Color, alignX: number, alignY: number, sAmt?: number, sAlpha?: number)
```

This method draws multiline text on the screen. The text will be split into multiple lines if it is too long to fit within the specified width.

**Arguments**

1. text - The text to draw.
2. font - The font to use for the text.
3. mWidth - The maximum width of each line of text.
4. spacing - The vertical space to leave between each line of text.
5. x - The x-coordinate of the top-left corner of the region to render the text in.
6. y - The y-coordinate of the top-left corner of the region to render the text in.
7. col - The color of the text.
8. xAlign - The horizontal alignment of the text. Can be one of the following:
   * `TEXT_ALIGN_LEFT`: align the text to the left.
   * `TEXT_ALIGN_CENTER`: align the text to the center.
   * `TEXT_ALIGN_RIGHT`: align the text to the right.
9. yAlign - The vertical alignment of the text. Can be one of the following:
   * `TEXT_ALIGN_TOP`: align the text to the top.
   * `TEXT_ALIGN_CENTER`: align the text to the center.
   * `TEXT_ALIGN_BOTTOM`: align the text to the bottom.
10. sAmt - The amount of shadow to apply to the text. Optional, defaults to no shadow.
11. sAlpha - The alpha value of the shadow. Optional, defaults to 1.

---

# AtlasUI :: DrawLoadingCircle

```lua
AtlasUI:DrawLoadingCircle(x: number, y: number, size: number, col?: Color)
```

This method draws a rotating loading circle on the screen at the specified coordinates with the given size and color.

**Arguments**

1. x - The x-coordinate of the center of the circle.
2. y - The y-coordinate of the center of the circle.
3. size - The size of the circle, in pixels.
4. col - The color of the circle. Optional, defaults to the accent color of the AtlasUI theme with an alpha of 100.

**Example**

```lua
hook.Add("HUDPaint", "AtlasUI_DrawLoadingCircle", function()
    AtlasUI:DrawLoadingCircle(100, 100, 50)
end)
```

This code will draw a rotating loading circle with a radius of 25 pixels (50 pixels in diameter) at the coordinates (100, 100) using the default color.

---

# AtlasUI :: DateToString

```lua
AtlasUI:DateToString(date: number) :: string
```

This method converts a given date to a string representation.

**Arguments**

1. date - A date, in the format returned by `os.time()`. If not provided, the current time will be used.

**Returns**

1. A string representation of the given date, such as "a moment ago", "HH:MM", or "dd/mm/yyyy".

**Examples**

```lua
AtlasUI:DateToString(os.time()) -- "a moment ago"
AtlasUI:DateToString(os.time() - 60) -- "a minute ago"
AtlasUI:DateToString(os.time() - 6060) -- "HH:MM"
AtlasUI:DateToString(os.time() - 6060*24) -- "dd/mm/yyyy"
```


**Implementation Details**

The function first checks if the input date is `nil`; if so, it returns the string "now".

Otherwise, it calculates the difference between the input date and the current time (using `os.ServerTime()`), and uses this value to determine which string representation to return. If the difference is less than 60 seconds, it returns "a moment ago". If the difference is less than one hour, it returns a string in the format "X minute(s) ago", where X is the number of minutes. If the difference is less than one day, it returns a string in the format "HH:MM" using the input date. Otherwise, it returns a string in the format "dd/mm/yyyy" using the input date.

---
# AtlasUI :: FormatMoney

```lua
AtlasUI:FormatMoney(number: number, decimals: number) :: string
```

This method formats a given number as money, with optional decimal precision.

**Arguments**

1. number - The number to format as money.
2. decimals - The number of decimal places to include in the formatted string. Optional, defaults to 2.

**Returns**

A string representation of the given number, formatted as money. For large numbers, the string will include the suffix "bil" for billions, "mil" for millions, or "k" for thousands.

**Examples**

```lua
AtlasUI:FormatMoney(1000) -- "$1,000.00"
AtlasUI:FormatMoney(1000000, 0) -- "$1,000,000"
AtlasUI:FormatMoney(123456789, 1) -- "$123,456,789.0"
```


**Implementation Details**

The function first checks if the number is greater than or equal to 1 billion. If so, it rounds the number to 2 decimal places and appends the suffix "bil" to the result of calling `DarkRP.formatMoney()` on the rounded number.

If the number is not greater than or equal to 1 billion but is greater than or equal to 1 million, the function rounds the number to 2 decimal places and appends the suffix "mil" to the result of calling `DarkRP.formatMoney()` on the rounded number.

If the number is not greater than or equal to 1 million but is greater than 10,000, the function rounds the number to 2 decimal places and appends the suffix "k" to the result of calling `DarkRP.formatMoney()` on the rounded number.

Otherwise, the function simply calls `DarkRP.formatMoney()` on the original number and returns the result.


---

# draw.LinearGradient

```lua
draw.LinearGradient(x: number, y: number, w: number, h: number, stops: table, horizontal: boolean)
```

This method draws a linear gradient on the screen using the specified parameters.

**Arguments**

1. x - The x-coordinate of the upper-left corner of the gradient rectangle.
2. y - The y-coordinate of the upper-left corner of the gradient rectangle.
3. w - The width of the gradient rectangle.
4. h - The height of the gradient rectangle.
5. stops - A table containing the gradient stops, where each stop is a table with two members: `offset` (a number between 0 and 1) and `color` (a Color object). The gradient is constructed by linearly interpolating between the colors at the specified offsets. The stops must be sorted by offset in ascending order.
6. horizontal - A boolean indicating whether the gradient should be drawn horizontally (from left to right) or vertically (from top to bottom).

**Examples**

```lua
draw.LinearGradient(0, 0, 100, 100, {
{offset = 0, color = Color(255, 0, 0)},
{offset = 1, color = Color(0, 0, 255)}
}, true)
```

This code will draw a horizontal gradient that transitions from red to blue, starting at the upper-left corner of the screen and extending 100 pixels in both the x and y directions.

```lua
draw.LinearGradient(0, 0, 100, 100, {
{offset = 0, color = Color(255, 0, 0)},
{offset = 0.5, color = Color(0, 255, 0)},
{offset = 1, color = Color(0, 0, 255)}
}, false)
```

This code will draw a vertical gradient that transitions from red to green to blue, starting at

---

# AtlasUI :: MaskInverse

```lua
AtlasUI:MaskInverse(maskFn: function, drawFn: function, pixel: number)
```

This method allows you to draw something only in areas that are not masked by another function. The `maskFn` function is used to draw the mask, and the `drawFn` function is used to draw the content that will only be visible in areas where the mask is not drawn.

**Arguments**

1. maskFn - A function that will be used to draw the mask. The mask should be drawn using `surface.DrawRect` or similar functions.
2. drawFn - A function that will be used to draw the content that will be visible only in areas where the mask is not drawn. This function should also draw its content using `surface.DrawRect` or similar functions.
3. pixel - An optional number that specifies the stencil reference value to use when drawing the mask and content. This should be a number between 0 and 255, inclusive. Defaults to 1.



**Example**
```lua
hook.Add("HUDPaint", "AtlasUI_MaskInverse", function()
    local maskFn = function()
        surface.SetDrawColor(255, 255, 255)
        surface.DrawRect(100, 100, 100, 100)
    end

    local drawFn = function()
        surface.SetDrawColor(0, 255, 0)
        surface.DrawRect(0, 0, ScrW(), ScrH())
    end

    AtlasUI:MaskInverse(maskFn, drawFn)
end)
```

This code will draw a white rectangle with a size of 100 pixels by 100 pixels at the coordinates (100, 100), and then draw a green rectangle covering the entire screen, but with the white rectangle cut out of it. The result will be a green screen with a white rectangle in the middle.

**Implementation Details**

This method uses the stencil buffer in the rendering engine to implement the masking functionality. It sets up the stencil buffer, draws the mask using the provided `maskFn` function, and then uses the stencil buffer to only draw the content provided by the `drawFn` function in areas where the mask is not drawn. It then clears the stencil buffer and disables it.

---

# AtlasUI :: Mask

```lua
AtlasUI:Mask(maskFn: function, drawFn: function, pixel?: number)
```

Applies a stencil mask to the screen so that only the area specified by `maskFn` will be drawn to. `drawFn` is then called to draw the masked content.

**Arguments**

1. maskFn - A function that draws the mask shape to the screen. Only pixels drawn by this function will be drawn to by `drawFn`.
2. drawFn - A function that draws the content to be masked. Only pixels within the mask drawn by `maskFn` will be drawn to.
3. pixel - The pixel value to use for the stencil mask. Optional, defaults to 1.

**Example**

```lua
-- MaskFn draws a circle at the center of the screen
function MaskFn()
    surface.SetDrawColor(Color(255, 255, 255))
    draw.NoTexture()
    surface.DrawCircle(ScrW() / 2, ScrH() / 2, ScrW() / 4)
end

-- DrawFn draws a red square
function DrawFn()
    surface.SetDrawColor(Color(255, 0, 0))
    surface.DrawRect(0, 0, ScrW(), ScrH())
end

hook.Add("HUDPaint", "AtlasUI_Mask", function()
    AtlasUI:Mask(MaskFn, DrawFn)
end)
```

This code will draw a red square to the screen, but only the circle in the center of the screen will be visible due to the mask applied by `MaskFn`.

---

# AtlasUI :: DrawNPCOverhead

```lua
AtlasUI:DrawNPCOverhead(npc: Entity, tbl: table)
```
Draws an overhead name and icon for an NPC.

**Arguments**

1. npc - The NPC to draw an overhead for.
2. tbl - A table of options for the overhead:
    * alpha - The alpha value of the overhead. Optional, defaults to 255.
    * text - The text to display in the overhead. Optional, defaults to the NPC's PrintName or "NO NAME" if not set.
    * icon - The material to use for the overhead's icon. Optional, defaults to no icon.
    * hover - A boolean value indicating whether the overhead should hover with a sinusoidal movement. Optional, defaults to false.
    * xOffset - The amount to offset the overhead horizontally. Optional, defaults to 0.
    * textOffset - The amount to offset the text in the overhead. Optional, defaults to 0.
    * color - The color of the overhead. Optional, defaults to AtlasUI's accent color.
    * icon_margin - The margin around the overhead icon. Optional, defaults to 30.

**Example**

```lua
local npc = ents.FindByClass("npc_combine_s")[1]

hook.Add("HUDPaint", "AtlasUI_DrawNPCOverhead", function()
    AtlasUI:DrawNPCOverhead(npc, {
        text = "Combine Soldier",
        icon = Material("icon16/shield.png"),
        hover = true,
        xOffset = 10,
        textOffset = 5,
        color = Color(255, 0, 0),
        icon_margin = 20
    })
end)
```

This code will draw an overhead for the first Combine Soldier NPC in the map, with the text "Combine Soldier" and a shield icon. The overhead will hover slightly and have a red color.

---

# AtlasUI :: DrawShadowText

```lua
AtlasUI:DrawShadowText(text: string, font: string, x: number, y: number, col: Color, xAlign: number, yAlign: number, amt: number, shadow: number)
```

Draws the specified text to the screen with a drop shadow.

**Arguments**

1. text - The text to draw to the screen
2. font - The font to use to draw the text
3. x - The x coordinate to draw the text at
4. y - The y coordinate to draw the text at
5. col - The color to use to draw the text
6. xAlign - The horizontal alignment to use for the text
7. yAlign - The vertical alignment to use for the text
8. amt - The number of shadows to draw
9. shadow - The alpha value to use for the shadows

**Example**

```lua
hook.Add("HUDPaint", "AtlasUI_DrawShadowText", function()
    AtlasUI:DrawShadowText("Hello, World!", "DermaDefault", ScrW() / 2, ScrH() / 2, AtlasUI.Theme.Accent, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 5, 125)
end)
```

This code will draw the text "Hello, World!" to the center of the screen with a drop shadow. The text will be drawn using the font "DermaDefault" and the color specified by AtlasUI.Theme.Accent. The text will be horizontally and vertically aligned to the center of the screen. Five drop shadows will be drawn, each with an alpha value of 125.

---

# AtlasUI :: DrawOutlinedText

```lua
AtlasUI:DrawOutlinedText(str: string, font: string, x: number, y: number, col: Color, xAlign: number, yAlign: number, outlineCol: Color, thickness?: number)
```

Draws text with an outline to the screen.

1. str - The string to draw.
2. font - The font to use.
3. x - The x coordinate to draw the text at.
4. y - The y coordinate to draw the text at.
5. col - The color of the text.
6. xAlign - The horizontal alignment of the text.
7. yAlign - The vertical alignment of the text.
8. outlineCol - The color of the outline. Optional, defaults to black.
9. thickness - The thickness of the outline. Optional, defaults to 1.

**Example**

```lua
hook.Add("HUDPaint", "AtlasUI_DrawOutlinedText", function()
    AtlasUI:DrawOutlinedText("Hello, World!", "Trebuchet18", ScrW() / 2, ScrH() / 2, AtlasUI.Theme.Accent, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end)
```

This code will draw the text "Hello, World!" with a red outline at the center of the screen.

# AtlasUI :: DrawHollowArc

```lua
AtlasUI:DrawHollowArc(cx: number, cy: number, radius: number, thickness: number, startang: number, endang: number, roughness: number, color: table)
```

Draws a hollow arc to the screen. The arc is defined by its center coordinates, `cx` and `cy`, and its `radius`, `thickness`, and angle range specified by `startang` and `endang`. The roughness parameter determines the smoothness of the arc.

**Arguments**

1. cx - The x coordinate of the center of the arc.
2. cy - The y coordinate of the center of the arc.
3. radius - The radius of the arc.
4. thickness - The thickness of the arc.
5. startang - The starting angle of the arc, in radians.
6. endang - The ending angle of the arc, in radians.
7. roughness - A value from 0 to 1 that determines the smoothness of the arc. Higher values result in smoother arcs.
8. color - The color of the arc.

**Example**

```lua
hook.Add("HUDPaint", "AtlasUI_DrawHollowArc", function()
	AtlasUI:DrawHollowArc(
		ScrW() / 2,
		ScrH() / 2,
		100,
		10,
		0,
		math.pi,
		0.5,
		Color(255, 0, 0)
	)
end)
```

This code will draw a red, hollow arc to the center of the screen with a radius of 100 pixels, a thickness of 10 pixels, and a smoothness of 0.5. The arc will span from 0 to 180 degrees (pi radians).

# AtlasUI :: DrawHollowArc

```lua
AtlasUI:DrawHollowArc(cx: number, cy: number, radius: number, thickness: number, startang: number, endang: number, roughness: number, color: color)
```

Draws a hollow arc on the screen.

**Arguments**

1. cx - The x-coordinate of the center of the arc.
2. cy - The y-coordinate of the center of the arc.
3. radius - The radius of the arc.
4. thickness - The thickness of the arc.
5. startang - The starting angle of the arc in degrees.
6. endang - The ending angle of the arc in degrees.
7. roughness - The roughness of the arc. Higher values will result in smoother arcs, but will also be more resource-intensive.
8. color - The color to draw the arc with.

**Example**

```lua
hook.Add("HUDPaint", "AtlasUI_DrawHollowArc", function()
    AtlasUI:DrawHollowArc(100, 100, 50, 10, 0, 180, 10, Color(255, 0, 0))
end)
```

This code will draw a red, hollow arc with a radius of 50 and a thickness of 10 at position (100, 100) on the screen. The arc will start at angle 0 and end at angle 180. The arc will have a roughness of 10, resulting in a smooth appearance.

---

# AtlasUI :: DualText

```lua
AtlasUI:DualText(title: table, subtitle: table, x: number, y: number, w: number, h: number)
```

Draws two pieces of text on top of each other. `title` and `subtitle` are each tables containing the following properties:

* `text`: The string to draw as the text
* `font`: The font to use when drawing the text
* `color`: The color to use when drawing the text
* `alignX`: The horizontal alignment of the text (e.g. `TEXT_ALIGN_LEFT`, `TEXT_ALIGN_RIGHT`, `TEXT_ALIGN_CENTER`)
* `alignY`: The vertical alignment of the text (e.g. `TEXT_ALIGN_TOP`, `TEXT_ALIGN_BOTTOM`, `TEXT_ALIGN_CENTER`)
* `shadow`: Whether or not to draw a shadow behind the text
* `shadowAmt`: The amount of shadow to draw (if shadow is true)

**Arguments**

1. title - The properties for the top piece of text to draw.
2. subtitle - The properties for the bottom piece of text to draw.
3. x - The x position of the top left corner of the text.
4. y - The y position of the top left corner of the text.
5. w - The width of the text area.
6. h - The height of the text area.

```lua
-- Draw the dual text at the top left corner of the screen, with a width and height of 100 pixels
local x, y, w, h = 0, 0, 100, 100

-- Define the title and subtitle text, font, color, alignment, and shadow amount
local title = {"Title", "AtlasUI.Font.Header", Color(255, 255, 255), TEXT_ALIGN_LEFT, 1, 100}
local subtitle = {"Subtitle", "AtlasUI.Font.Subtitle", Color(255, 255, 255), TEXT_ALIGN_LEFT, 1, 100}

-- Draw the dual text to the screen
hook.Add("HUDPaint", "AtlasUI_DualText", function()
    AtlasUI:DualText(title, subtitle, x, y, w, h)
end)
```

This will draw the text "Title" with a larger font at the top of the specified area, and the text "Subtitle" with a smaller font below it. Both texts will be left-aligned and will have a white color. The shadow amount for both texts is set to 1, with a maximum shadow intensity of 100.

---

# AtlasUI :: DrawIconRotated

```lua
AtlasUI:DrawIconRotated(x: number, y: number, w: number, h: number, rotation: number, pnl: Panel, col?: Color, loadCol?: Color)
```

Draws an icon on the screen that is rotated by the specified amount. The icon is drawn from a panel, and if the panel does not contain an `IMaterial`, a loading circle will be drawn in its place.

**Arguments**

1. x - The x coordinate to draw the icon at.
2. y - The y coordinate to draw the icon at.
3. w - The width of the icon to draw.
4. h - The height of the icon to draw.
5. rotation - The amount to rotate the icon, in degrees.
6. pnl - The panel containing the icon to draw.
7. col - The color to draw the icon in. Optional, defaults to white.
8. loadCol - The color to draw the loading circle in if the panel does not contain an `IMaterial`. Optional, defaults to AtlasUI's accent color.

**Example**

```lua
local myPanel = vgui.Create("DPanel")
myPanel.Icon = Material("path/to/my/icon")

hook.Add("HUDPaint", "AtlasUI_DrawIconRotated", function()
    AtlasUI:DrawIconRotated(50, 50, 64, 64, 30, myPanel)
end)
```

This will draw the icon contained in `myPanel` at the coordinates (50, 50) with a width and height of 64 pixels, rotated by 30 degrees.