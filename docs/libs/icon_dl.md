# Icon Downloader <client>Client</client>

Asynchronous icon downloader.

# AtlasUI :: DownloadIcon

```lua
AtlasUI:DownloadIcon(pnl: Panel, tbl: table, pnlVar: string)
```

## Arguments

1. pnl - Panel to store the icon.
2. tbl - Parameters
3. pnlVar - The panel of which it will be stored on

---

# AtlasUI :: DrawIcon

```lua
AtlasUI:DrawIcon(x: number, y: number, w: number, h: number, pnl: Panel, col: Color, loadCol: Color, var: string)
```

## Arguments

1. x - The X coordinate.
2. y -The Y coordinate.
3. w - The width of the icon.
4. h - The height of the icon.
5. pnl - Panel that contains the icon.
6. col - Icon color.
7. loadCol - Loading circle color (if icon isn't downloaded).
8. var - Icon identifier

---

# AtlasUI :: GetIcon <small><deprecated>Deprecated</deprecated></small>

```lua
AtlasUI:GetIcon(id: string | IMaterial)
```

## Arguments

1. id - Icon identifier

## Example

This example come from the Atlas Framework (`laux/atlasui/libs/icon_dl.laux`).

```lua
local test = {
  -- It checks the first image, if that fails to load then the second, then third, etc..
  -- First one is cusotm, using a cusotm URL n not using png.
  { id = "dLyjNp", url = "https://i.hizliresim.com", type = "jpg" },
  -- If there's no url specificed it'll use imgur, and if there's no type, it'll use png
  { id = "4aa0Ka4" }
}

-- Example frame
AtlasUI.frame = vgui.Create("AtlasUI.Frame")
AtlasUI.frame:SetSize(800, 600)
AtlasUI.frame:Center()
AtlasUI.frame:MakePopup()

AtlasUI.panel = AtlasUI.frame:Add("DPanel")
AtlasUI.panel:Dock(FILL)
AtlasUI:DownloadIcon(AtlasUI.panel, test)
AtlasUI.panel.Paint = function(pnl, w, h)
  AtlasUI:DrawIcon(8, 8, w - 16, h - 16, pnl)
end
```
