# Functions

## AtlasLoader:LoadModule <shared>SHARED</shared> <internal>INTERNAL</internal>
```lua
AtlasLoader:LoadModule(info: Info, force_env: boolean = false)
```
Loads a Module based on its Info table, normally called via AtlasLoader:ReloadModule”.<br>
if force_env is set to true, a new Environment is generated, discarding all previous data.


## AtlasLoader:LoadModules <shared>SHARED</shared> <internal>INTERNAL</internal>
```lua
AtlasLoader:LoadModules()
```
Finds all Modules and loads them. Called at Start automatically.

## AtlasLoader:ReloadModules <shared>SHARED</shared> <internal>INTERNAL</internal>
```lua
AtlasLoader:ReloadModules(force_env: boolean = false)
```
Calls [AlasLoader:LoadModule](#) internally for every Module.<br>
See [AlasLoader:LoadModule](#) for further documentation.


## AtlasLoader:ReloadModules <shared>SHARED</shared> <internal>INTERNAL</internal>
```lua
AtlasLoader:ReloadModules(name: string, force_env: boolean = false)
```
Calls [AlasLoader:LoadModule](#) on the Module with the given name.<br>
See [AlasLoader:LoadModule](#) for further documentation.