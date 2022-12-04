# Essentials <shared>Shared</shared>
A nice set of shared utility methods and such.<br>
*🚧 This page is largely incomplete, you can contribute on the repo! 🚧*

# AtlasUI :: Ease

```lua
AtlasUI:Ease(t: number, b: number, c: number, d: number) :: number
```
Computes an eased value using a cubic easing function.
The value starts at b, ends at b + c, and follows a smooth curve in between.

**Arguments**
1. t - The current time
2. b - The starting value
3. c - The change in value
4. d - The duration of the animation

**Returns**
1. The eased value at the current time.

---

# AtlasUI :: EaseInOutQuintic

```lua
AtlasUI:EaseInOutQuintic(t: number, b: number, c: number, d: number) :: number
```

Computes an eased value using a quintic (5th degree) easing function that starts and ends slowly, but accelerates in the middle.
The value starts at `b`, ends at `b + c`, and follows a smooth curve in between.

**Arguments**
1. t - The current time.
2. b - The starting value.
3. c - The change in value.
4. d - The duration of the animation.

**Returns**
1. The eased value at the current time.

---

# AtlasUI :: RemoveDebounce

```lua
AtlasUI:RemoveDebounce(name: string)
```

Removes a debounce timer with the specified name.

**Arguments**
1. name - The name of the debounce timer to remove.

---

# AtlasUI :: Debounce

```lua
AtlasUI:Debounce(name: string, wait: number, func: function)
```

Creates a debounce timer with the specified name, wait time, and callback function. If a debounce timer with the same name already exists, it will be removed before creating the new one.

**Arguments**
1. name - The name of the debounce timer.
2. wait - The wait time, in seconds, before calling the callback function.
3. func - The callback function to call after the wait time has elapsed.

---

# AtlasUI :: LerpColor

```lua
AtlasUI:LerpColor(fract: number, from: Color, to: Color) :: Color
```

Computes a color by linearly interpolating between two colors.

**Arguments**
1. fract - The fraction of the interpolation.
2. from - The starting color.
3. to - The ending color.

**Returns**
1. The interpolated color.

---

# AtlasUI :: GetAngleBetweenTwoVectors

```lua
AtlasUI:GetAngleBetweenTwoVectors(a: Vector, b: Vector) :: Angle
```

Computes the angle between two vectors.

**Arguments**
1. a - The first vector.
2. b - The second vector.

**Returns**
1. The angle between the two vectors.


---

# AtlasUI :: GetVector2DDistance

```lua
AtlasUI:GetVector2DDistance(a: Vector, b: Vector) :: number
```

Computes the distance between two 2D vectors.

**Arguments**
1. a - The first vector.
2. b - The second vector.

**Returns**
1. The distance between the two vectors.


---

# AtlasUI :: LerpVector

```lua
AtlasUI:LerpVector(frac: number, from: Vector, to: Vector, ease?: function) :: Vector
```

Computes a vector by linearly interpolating between two vectors, with optional easing.

**Arguments**
1. frac - The fraction of the interpolation.
2. from - The starting vector.
3. to - The ending vector.
4. ease - An optional easing function to apply to the interpolation. If no easing function is provided, the default AtlasUI easing function will be used.

**Returns**
1. The interpolated vector.


---

# AtlasUI :: LerpAngle

```lua
AtlasUI:LerpAngle(frac: number, from: Angle, to: Angle, ease?: function) :: Angle
```

Computes an angle by linearly interpolating between two angles, with optional easing.

**Arguments**
1. frac - The fraction of the interpolation.
2. from - The starting angle.
3. to - The ending angle.
4. ease - An optional easing function to apply to the interpolation. If no easing function is provided, the default AtlasUI easing function will be used.

**Returns**
1. The interpolated angle.

---

# AtlasUI :: Map

```lua
AtlasUI:Map(tbl: table, func: function) :: table
```

Maps a function over a table, creating a new table of the results.

**Arguments**
1. tbl - The table to map the function over.
2. func - The function to apply to each element in the table.

**Returns**
1. The new table of mapped values.


---

# AtlasUI :: Hue2RGB

```lua
AtlasUI:Hue2RGB(p: number, q: number, t: number) :: number
```

Converts a hue value to an RGB value.

**Arguments**
1. p - The red-chroma value.
2. q - The green-chroma value.
3. t - The hue value to convert.

**Returns**
1. The corresponding RGB value.


---

# AtlasUI :: HSLToColor

```lua
AtlasUI:HSLToColor(h: number, s: number, l: number, a?: number) :: Color
```

Converts HSL (hue, saturation, lightness) color values to an RGB color.

**Arguments**
1. h - The hue value, in radians.
2. s - The saturation value, from 0 to 1.
3. l - The lightness value, from 0 to 1.
4. a - The alpha value, from 0 to 1. Optional, defaults to 1.

**Returns**
1. The corresponding RGB color.


---

# AtlasUI :: ColorToHSL

AtlasUI:ColorToHSL(col: Color) :: (number, string, Vector)

Converts an RGB color to HSL (hue, saturation, lightness) color values.

**Arguments**
1. col - The RGB color to convert.

**Returns**
1. The hue value, in radians.
2. The saturation value, from 0 to 1.
3. The lightness value, from 0 to 1.

---

# AtlasUI :: DecToHex

```lua
AtlasUI:DecToHex(d: number, zeros?: number) :: string
```

Converts a decimal number to a hexadecimal string.

**Arguments**
1. d - The decimal number to convert.
2. zeros - The number of leading zeros to include in the hexadecimal string. Optional, defaults to 2.

**Returns**
1. The hexadecimal string.


---

# AtlasUI :: RGBToHex

```lua
AtlasUI:RGBToHex(color: Color) :: string
```

Converts an RGB color to a hexadecimal color string.

**Arguments**
1. color - The RGB color to convert.

**Returns**
1. The hexadecimal color string.
