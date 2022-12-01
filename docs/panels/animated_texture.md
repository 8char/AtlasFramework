# AtlasUI.AnimatedTexture <client>Client</client>

The `AtlasUI.AnimatedTexture` is used to draw an animated texture on a panel.

## Parent

Derives from [Panel](https://wiki.facepunch.com/gmod/Panel).

# Methods
All write operations to build the object is available here.

```lua
<AtlasUI.AnimatedTexture>:SetDirectory(dir: string)
```

Sets the directory of where the texture pngs are located. It will then make sure to add the path aswell as the Materials to `self.images`. Keep in mind that this only loads pngs!

## Arguments

1. dir - The path inside of the materials folder that holds the texture pngs. I. e. anim_textures => materials/anim_textures

---


```lua
<AtlasUI.AnimatedTexture>:SetImages(tbl: table)
```

Used to manually set the table which contains all of the instanced image textures by using `Material()`. Keep in mind that this will overwrite the existing `self.images` variable.

## Arguments

1. tbl - The table of which will be set to the `self.images`, which contains a table of instanced textures through `Material()`

---


```lua
<AtlasUI.AnimatedTexture>:SetTimes(normal: number = .02, idle: number = 1)
```

Used to set the `self.times` which is used for when the next change should be and the delay inbetween the cycles change.

## Arguments

1. normal - The delay between the images.
2. idle - The time that it will wait inbetween cycles, i. e when it's reached it's last image.

---


```lua
<AtlasUI.AnimatedTexture>:GetPaused(pauseState: boolean)
```

Used to get the pause animation state of the AnimatedTexture.

## Returns

1. isPaused - The boolean which informs if the AnimatedTexture is paused or not.

---


```lua
<AtlasUI.AnimatedTexture>:SetPaused(pauseState: boolean)
```

Used to pause the animation of the texture.

## Arguments

1. pauseState - The argument for if the panel should pause its animation, `true` will pause it & `false` will un-pause it.

---


```lua
<AtlasUI.AnimatedTexture>:PostInit()
```

Should be called once you've called all the methods on this object that you need to. It will setup it's necessary variables needed for running it.
