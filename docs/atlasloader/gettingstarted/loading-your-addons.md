# Loading your own addons

First off you will be constructing your addon in the normal structure that you usally have. Due to how AtlasLoader loads your addon you won't need a `addonname/lua/autoload/` folder as it will always recursively load those folders prefixed with `amod_` that exist inside of the `addonname/lua/` folder, i.e `addonname/lua/amod_hunger`, `addonname/lua/amod_printersystem`, etc...

## Creating the info.lua <shared>SHARED</shared>

In order for your addon to load the module folder at all you will need a `addonname/lua/amod_*/info.lua`. `info.lua` is a shared files which resides in the base of all your `amod_*` directories. In this file you will be returning a table, this table will contain fields such as the name, dependencies, the tracelevel and so on. This file will then convey that information to the loader so that the proper dependencies can be required and loaded in to the `AModules` table *(You can read further about the table later in the article)*. We'll start by making a `info.lua` file with the addon name "AtlasPrinter" which will require the UI Library.

```lua
-- garrysmod/addons/atlasprinter/amod_printersystem/info.lua
return {
    name = "AtlasPrinter",
    logLevel = "TRACE",
    deps = {
        "AtlasUI"
    },
}
```

*If you want to read more on the struct of the info.lua file, you can have a look at the [Structs & Enums](/atlasloader/documentation/structs-and-enums) page for more information & options on how to properly structure it.*

## Understanding the core concept of AtlasLoader

A Unified System allowing the loading of Lua Modules, providing:

* Logging System (With [Log Levels](#log_level-enums), Info/Warning/Error)
* Automatic inclusion of clientside files (Removing the need to manually use [AddCSLuaFile](https://wiki.facepunch.com/gmod/Global.AddCSLuaFile))
* Loading order based on dependencies 
* Custom Environment (Avoiding unnecessarily increasing [_G](https://wiki.facepunch.com/gmod/Global_Variables)’s size)

## Environment

All Module Files (excluding `info.lua`) are loaded inside a custom environment, this has the effect that global variables setup normally are not inside `_G` but stored in `AModules[name]`.<br>
All Variables/Functions inside `_G` are still accessible. However they will need to be accesed using `_G.<GLOBAL VARIABLE>` if they are being overshadowed by a local environment variable.<br>
See the following examples:

```lua
-- Makes a variable inside the Module
X = 10
-- Makes a global variable
_G.Y = 20
-- Reads Global Variable
print(Y)
print(_G.Y)
-- Reads Module Variable
print(X)
-- Makes a Module variable shadowing a global variable!
Y = 30
```

| Variable in Module | Variable in _G (Global) | Value |
| -- | -- | -- |
| X | AModules.Test.X | 10 |
| _G.Y | Y | 20 |
| Y | AModules.Test.Y | 30 |

## RELOAD (Env. Variable) <shared>SHARED</shared>
In the environment, a custom variable called `RELOAD` is made.<br>
This is set  to true when the module is reloading instead of loading for the first time.<br>
This allows a dev to easily make their module work with hotreloading.
