# Structs and Enums

## LOG_LEVEL (Enum) <shared>SHARED</shared>

| | | |
| --- | --- | --- |
| `TRACE`  | `1` | Trace level - Allows print() to be used |
| `INFO`  | `2` | Info level - Allows print() to be used |
| `WARNING`  | `3`  | Warning level |
| `ERROR`  | `99`  | Error level - No Log prints |

## Info (Table Struct) <shared>SHARED</shared>
The table used for loading modules, returned by an `info.lua` file in the base of your `garrysmod/addons/*/amodule_*/`

`name` \[[string](https://wiki.facepunch.com/gmod/string)\]<br>
The name of your module. This is what will be displayed in the log messages aswell as when you refference a dependency module.

`logLevel` \[[LOG_LEVEL](#log_level-enums)]<br>
The name of your module.

`deps` \[[strings](https://wiki.facepunch.com/gmod/string)]<br>
A numerical table of module name's that will be loaded before this module.