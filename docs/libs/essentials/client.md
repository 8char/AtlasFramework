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

# draw :: SimpleLinearGradient

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
