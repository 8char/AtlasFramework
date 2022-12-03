# Loader <shared>Shared</shared>
`AtlasUI.Loader` utilises the [Builder Pattern](https://en.wikipedia.org/wiki/Builder_pattern), which means all operations returns the object, allowing method chaining as seen in the example below.

```lua
AtlasUI.Loader()
  :setName("My Addon")
  :setAcronym("Addon")
  :setDirectory("my_addon_path")
  :setColor(AtlasUI.Theme.Orange)
:done()
```

# Enumerations

| ENUM IDENTIFIER | VALUE |
| --- | --- |
| **ATLASUI_SERVER** | 1 |
| **ATLASUI_CLIENT** | 2 |
| **ATLASUI_SHARED** | 3 |

## AtlasUI.Loader :: setName

```lua
<AtlasUI.Loader>:setName(name: string)
```

**Required.** Used to set the name of the addon.

**Arguments**

1. name - What name the addon should have.

---

## AtlasUI.Loader :: setAcronym

```lua
<AtlasUI.Loader>:setAcronym(acronym: string)
```

**Required.** Used to set the acronym of the addon.

**Arguments**

1. acronym - What acronym the addon should have.

---

## AtlasUI.Loader :: setDirectory

```lua
<AtlasUI.Loader>:setDirectory(directory: string)
```

**Required.** Used to set the root directory of the addon.

**Arguments**

1. directory - What's the addon's root directory.

---

## AtlasUI.Loader :: setColor

```lua
<AtlasUI.Loader>:setColor(color: Color)
```
**Required.** Used to set the color of the addon, that will be used into console logging.

**Arguments**

1. color - What color the addon should have.

---

## AtlasUI.Loader :: loadMessage<internal>INTERNAL</internal>

```lua
<AtlasUI.Loader>:loadMessage(path: string, realm: string, col = self:getColor())
```
Used internally to print debug messages
**Arguments**
1. path - File path
2. realm - Prefix's realm
3. col - **Optional** Prefix's color

---

## Atlas.Loader :: loadFile <internal>INTERNAL</internal>

```lua
<AtlasUI.Loader>:loadFile(path: string, realm: number, func: function)
```

Also used internally to load a single file

**Arguments**

1. path - File path
2. realm - Realm (You can use [enumerations](/libs/loader?id=enumerations))  
3. func - **Optional** Load function

---

## Atlas.Loader :: load

```lua
<AtlasUI.Loader>:load(dir: string, realm: number|table, recursive: boolean = false, options: table = {})
```
Used to load a folder (can be loaded recursively)

**Arguments**

1. dir - Directory that will be loaded
2. realm - Realm (You can use [enumerations](/libs/loader?id=enumerations))
3. recursive - **Optional** Should load folder recursively
4. **Optional** Options (`ignoreFiles = {}`, `overwriteRealm = {}`)

---

```lua
<AtlasUI.Loader>:done()
```
Finishes the action currently in the works.

# Example
This example come from the Atlas Framework (`laux/autorun/atlasui_load.laux`).
```lua
AtlasUI.Loader()
    :setName("Atlas Framework")
    :setAcronym("Atlas")
    :setDirectory("atlasui")
    :setColor(AtlasUI.Theme.Red)
    :load("libs", ATLASUI_CLIENT, false, {
        ignoreFiles = {
            loader = true
        },
        overwriteRealm = {
            essentials_sh = ATLASUI_SHARED,
            v0n_sh = ATLASUI_SHARED,
            promises = ATLASUI_SHARED,
            permissions = ATLASUI_SHARED
        }
    })
    :load("libs/network", ATLASUI_SHARED)
    :load("server", ATLASUI_SERVER, true)
    :load("libs/languages", ATLASUI_SHARED)
    :load("libs/languages/network", {
        client = ATLASUI_CLIENT,
        server = ATLASUI_SERVER
    })
    :load("libs/scripts", ATLASUI_SHARED)
    :load("libs/scripts/network", {
        client = ATLASUI_CLIENT,
        server = ATLASUI_SERVER
    })
    :load("libs/configurator", ATLASUI_SHARED)
    :load("libs/configurator/classes", ATLASUI_SHARED, false, {
        overwriteRealm = {
            database = ATLASUI_SERVER
        }
    })
    :load("libs/configurator/network", {
        client = ATLASUI_CLIENT,
        server = ATLASUI_SERVER
    })
    :load("libs/configurator/ui", ATLASUI_CLIENT, true)
    :load("libs/config", ATLASUI_SHARED)
    :load("libs/config/network", {
        client = ATLASUI_CLIENT,
        server = ATLASUI_SERVER
    })
    :load("elements", ATLASUI_CLIENT)
    :load("core/ui", ATLASUI_CLIENT)
    :load("libs/units", ATLASUI_SHARED, true)
:done()
```