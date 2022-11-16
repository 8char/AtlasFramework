# AtlasLoader Introduction

AtlasLoader is designed to make developing addons simple. It's made so that you don't ever need to focus on creating your own loaders ever again whilst preventing it from polluting the global [namespace](https://en.wikipedia.org/wiki/Namespace) ([_G](https://wiki.facepunch.com/gmod/Global_Variables)).

# Concept

**A Unified System allowing the loading of Lua Modules, providing:**
* Logging System (With [Log Levels](#log_level-enums), Info/Warning/Error)
* Automatic inclusion of clientside files (Removing the need to manually use [AddCSLuaFile](https://wiki.facepunch.com/gmod/Global.AddCSLuaFile))
* Loading order based on dependencies 
* Custom Environment (Avoiding unnecessarily increasing [_G](https://wiki.facepunch.com/gmod/Global_Variables)’s size)

# Info.lua <shared>SHARED</shared>
The Info.lua gives Infomation about the Module to AtlasLoader so that it can be loaded properly. This file should always exist within all `/addons/amodule_*/` directories to provide the necessary information for loading & logging/debugging. The [Info Struct](#info-table-struct) is to be followed, here's an example of an `info.lua` file:

```lua
return {
    name = "Entity Utillity",
    logLevel = "INFO",
    deps = {},
}
```

# Environment
All Module Files (excluding [info.lua](infolua-shared)) are loaded inside a custom environment, this has the effect that global variables setup normally are not inside _G but stored in `AModules[name]`.
All Variables/Functions inside `_G` are still accessible.
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

# Reload (Env. Variable) <shared>SHARED</shared>
In the environment a custom variable called "RELOAD" is made.<br>
This is set when the module is reloading instead of loading for the first time.<br>
This allows a dev to easily make their module work with hotreloading.