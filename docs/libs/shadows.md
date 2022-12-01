# Shadows <client>Client</client>

Also known as Blues Shadows.
Made by [CODE-BLUE](https://www.youtube.com/channel/UCFpuE-Qjn4EWqX-VJ_l7pbw).

# BSHADOWS.BeginShadow

```lua
BSHADOWS.BeginShadow()
```
Call this to begin drawing a shadow.

---

# BSHADOWS.EndShadow

```lua
BSHADOWS.EndShadow(intensity: number, spread: number, blur: number, opacity: number, direction: number, distance: number, _shadowOnly: boolean = false)
```

This will draw the shadow, and mirror any other draw calls the happened during drawing the shadow.

## Argumets

1. intensity - Intensity of the shadow
2. spread - Spread of the shadow
3. blur - Blur size
4. opacity - **Optional** Opacity of the resulting shadow
5. direction - **Optional** Direction
6. distance - **Optional** Distance
7. _shadowOnly - **Optional** Shadow Only

## Example

```lua
-- Put this code into a Paint function:

local x, y = self:LocalToScreen()

BSHADOWS.BeginShadow()
  -- Draw here
  draw.RoundedBox(6, x, y, w, h, AtlasUI.Theme.Background)
BSHADOWS.EndShadow(1, 2, 2, 255, 0, 0)
```
