# Essentials <client>Client</client>
A nice set of client utility methods and such.

# AtlasUI :: DrawBlur

```lua
AtlasUI:DrawBlur(panel: Panel, amount: number)
```

Draws a blur around the specified panel.

## Arguments

1. panel - The panel which should remain in focus.
2. amount - The factor to which the rest of the screen should be blurred.

---

# AtlasUI :: DrawBlurHUD

```lua
AtlasUI:DrawBlurHUD(x: number, y: number, w: number, h: number, amt: number)
```

Draws blur on a certain area on your screen specified via the arguments.

## Arguments

1. x - The x position for the top left corner of the blur
2. y - The y position for the top left corner of the blur
3. w - The width of the area that will be blured
4. h - The height of the area that will be blured
5. amount - The factor to which the rest of the screen should be blurred.

---

# AtlasUI :: FormatTime

```lua
AtlasUI:FormatTime(seconds: number, format: string)
```

Formats seconds in to a nice string using the `string.format` function.

## Arguments

1. seconds - The ammount of seconds that should be formatted
2. format - The pattern which the time should be formatted as, see string.format for more information.

## Returns

1. The formatted time string

# AtlasUI :: DrawRotatedTexture

```lua
AtlasUI:DrawRotatedTexture(seconds: number, format: string)
```
Draws a rotated texture. Useful in drawing things such as a loading circle, for example.

## Arguments

1. seconds - The ammount of seconds that should be formatted
2. format - The pattern which the time should be formatted as, see string.format for more information.