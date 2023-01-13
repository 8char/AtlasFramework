# Animations

This documentation provides information on a set of utility methods for creating smooth transitions on various properties of panels in Lua. These methods include transitioning colors, vectors, angles, and positions, and can be used with the Panel meta-table. The methods use the AtlasUI library for easing and animation and include options for specifying duration and callback functions.

## PANEL :: LerpColor
```lua
PANEL:LerpColor(var: string, to: table, duration: number = AtlasUI.TransitionTime, callback?: function)
```

Renders a smooth transition of color for the specified variable on the panel, over a specified duration.

**Arguments**
1. var - The variable to transition (string)
2. to - The target color (table)
3. duration - The duration of the transition. Optional, defaults to AtlasUI.TransitionTime (number)
4. callback - A function that is called when the animation ends. Optional (function)

## PANEL :: LerpVector
```lua
PANEL:LerpVector(var: string, to: Vector, duration: number = AtlasUI.TransitionTime, callback?: function)
```

Renders a smooth transition of vector for the specified variable on the panel, over a specified duration.

**Arguments**
1. var - The variable to transition (string)
2. to - The target vector (Vector)
3. duration - The duration of the transition. Optional, defaults to AtlasUI.TransitionTime (number)
4. callback - A function that is called when the animation ends. Optional (function)

## PANEL :: LerpAngle
```lua
PANEL:LerpAngle(var: string, to: Angle, duration: number = AtlasUI.TransitionTime, callback?: function)
```

Renders a smooth transition of angle for the specified variable on the panel, over a specified duration.

**Arguments**
1. var - The variable to transition (string)
2. to - The target angle (Angle)
3. duration - The duration of the transition. Optional, defaults to AtlasUI.TransitionTime (number)
4. callback - A function that is called when the animation ends. Optional (function)

## PANEL :: EndAnimations
```lua
PANEL:EndAnimations()
```

Stops all animations on the panel

## PANEL :: Lerp
```lua
PANEL:Lerp(var: string, to: any, duration: number = AtlasUI.TransitionTime, callback?: function)
```

Renders a smooth transition of any variable on the panel, over a specified duration.

**Arguments**
1. var - The variable to transition (string)
2. to - The target value (any)
3. duration - The duration of the transition. Optional, defaults to AtlasUI.TransitionTime (number)
4. callback - A function that is called when the animation ends. Optional (function)

## PANEL :: LerpMove
```lua
PANEL:LerpMove(x: number, y: number, duration: number = AtlasUI.TransitionTime, callback?: function)
```

Renders a smooth transition of the panel's position to the specified coordinates, over a specified duration.

**Arguments**
1. x - The x-coordinate of the target position (number)
2. y - The y-coordinate of the target position (number)
3. duration - The duration of the transition. Optional, defaults to AtlasUI.TransitionTime (number)
4. callback - A function that is called when the animation ends. Optional (function)
