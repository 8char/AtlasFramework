# AtlasUI :: GetUTCTime

```lua
AtlasUI:GetUTCTime() :: number
```

Returns the current time in UTC format.

**Arguments**

1. None.

**Returns**

1. The current time in UTC format as a Unix timestamp (the number of seconds since January 1, 1970).

**Exmaple**

```lua
local current_time = AtlasUI:GetUTCTime()
```

# AtlasUI :: SecondsToTimeString

```lua
AtlasUI:SecondsToTimeString(s: number, _format: string, as_tbl: boolean) :: string or table
```

Converts a given number of seconds to a formatted time string.

**Arguments**

1. `s`: A number representing the number of seconds to convert.
2. `_format` (optional): A string representing the format of the output time string. The default format is `"%d:%02d:%02d:%02d"`, which will produce a string in the format `DD:HH:MM:SS`.
3. `as_tbl` (optional): A boolean value indicating whether to return the result as a table. If `true`, the method will return a table with keys `d`, `h`, `m`, and `s` representing the number of days, hours, minutes, and seconds, respectively. If `false` (the default), the method will return the formatted time string.

**Returns**

1. If `as_tbl` is `false` (the default), this method returns a string representing the formatted time. If `as_tbl` is `true`, this method returns a table with keys `d`, `h`, `m`, and `s` representing the number of days, hours, minutes, and seconds, respectively.

**Example**

```lua
-- Returns a formatted time string using the default format
local time_string = AtlasUI:SecondsToTimeString(12345) -- "3:25:45:05"

-- Returns a formatted time string using a custom format
local time_string = AtlasUI:SecondsToTimeString(12345, "%02d:%02d") -- "25:45"

-- Returns a table containing the time broken down into days, hours, minutes, and seconds
local time_table = AtlasUI:SecondsToTimeString(12345, nil, true) -- { d = 0, h = 3, m = 25, s = 45 }
```

# AtlasUI :: SecondsToSmallTime

```lua
AtlasUI:SecondsToSmallTime(s: number, _format: string, as_tbl: boolean) :: string or table
```

Converts a given number of seconds to a formatted time string using a smaller format than `SecondsToTimeString()`.

**Arguments**

1. `s` - A number representing the number of seconds to convert.
2. `_format` - A string representing the format of the output time string. Optional, default format is `"%02d:%02d"`, which will produce a string in the format `MM:SS`.
3. `as_tbl` - A boolean value indicating whether to return the result as a table. If `true`, the method will return a table with keys `d`, `h`, `m`, and `s` representing the number of days, hours, minutes, and seconds, respectively. If `false` (the default), the method will return the formatted time string. Optional, the default value is `false`

**Returns**

1. If `as_tbl` is `false` (the default), this method returns a string representing the formatted time. If `as_tbl` is `true`, this method returns a table with keys `d`, `h`, `m`, and `s` representing the number of days, hours, minutes, and seconds, respectively.

**Example**

```lua
-- Get the time string in the default format with no leading zeros
time_string = AtlasUI:SecondsToSmallTime(3661)
-- time_string is now "61:01"

-- Get the time string in the default format with leading zeros
time_string = AtlasUI:SecondsToSmallTime(61, "%02d:%02d")
-- time_string is now "01:01"

-- Get the time as a table with no leading zeros
time_table = AtlasUI:SecondsToSmallTime(3661, nil, true)
-- time_table is now {d = 0, h = 0, m = 61, s = 1}

-- Get the time as a table with leading zeros
time_table = AtlasUI:SecondsToSmallTime(61, "%02d:%02d", true)
-- time_table is now {d = 0, h = 0, m = 1, s = 1}
```
