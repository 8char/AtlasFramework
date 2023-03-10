# AtlasUI.SecondOrderDynamics

The `AtlasUI.SecondOrderDynamics` class is used to create smooth, physically-based animations in the Framework. Second order dynamics are often used in Garry's Mod and other physics simulations because they provide a more realistic representation of motion than first order dynamics. Second order dynamics take into account the acceleration of an object in addition to its velocity, allowing for more accurate predictions of how the object will behave over time. This is particularly useful for simulations involving complex interactions between multiple objects, where small errors in prediction can compound over time and lead to unrealistic behavior. By using second order dynamics, Garry's Mod is able to create a more immersive and realistic experience for players.

For a more indepth video explaination of this, reffer to this video: [Giving Personality to Procedural Animations using Math](https://youtu.be/KPoeNZZ6H4s)

# Constructor

## AtlasUI.SecondOrderDynamics :: constructor

```lua
AtlasUI.SecondOrderDynamics(frequency: number, dampening: number, undershot: number, startPos: Vector)
```

The constructor for creating a new instance of the AtlasUI.i18n class.

**Arguments**

1. `frequency` - The frequency of the object's oscillation.
2. `dampening` - The dampening value of the object's oscillation.
3. `undershot` - The undershot value of the object's oscillation.
4. `startPos` - The starting position of the object.

# Methods

## AtlasUI.SecondOrderDynamics :: updateConstants

```lua
<AtlasUI.SecondOrderDynamics>:updateConstants(frequency: number, dampening: number, undershot: number)
```

Updates the constants of the object.

**Arguments**

1. frequency - The new frequency value.
2. dampening - The new dampening value.
3. undershot - The new undershot value.

## AtlasUI.SecondOrderDynamics :: update

```lua
<AtlasUI.SecondOrderDynamics>:update(dTime: number, newPos: Vector)
```

Parses a string and replaces placeholders with their corresponding values from the active language.

**Arguments**

1. dTime - The elapsed time since the last update.
2. newPos - The new target position.

**Returns**

1. The interpolated position of the object.