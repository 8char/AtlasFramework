# Networking
Atlas Framework's networking module aims to simplify and streamline the process of sending and receiving data between clients and servers in a Garry's Mod project. It provides a set of functions and variables for easy handling of network messages, as well as automatic detection and handling of networked variables.

The module utilizes a system of message types, allowing developers to easily distinguish between different types of data being sent over the network. It also provides functions for efficiently sending and receiving large amounts of data, such as tables and strings.

In addition, Atlas Framework's networking module includes built-in support for detecting and handling networked variables. These variables are automatically synced between clients and servers, allowing for seamless communication and real-time updates in a multiplayer environment.

Overall, Atlas Framework's networking module provides a simple and reliable solution for networking in Garry's Mod projects, allowing developers to focus on creating their project rather than worrying about the complexities of networking.

# AtlasUI.Network <shared>SHARED</shared> <class>CLASS</class>

The `AtlasUI.Network` class is a utility for sending and receiving data over the network in a Garry's Mod project. It provides functions for preparing and receiving network messages, as well as functions for writing and reading different data types to and from the network.

---

## Properties
* `DYNAMIC_DATA_SIZE`: determines the size of the data type identifier when writing data to the network.
* `FLOAT`, `INTEGER`, `BOOL`, `STRING`, `TABLE`: represent the different data types that can be written to the network.

---

## Constructor

```lua
constructor()
```

Initializes the `writeTypes` and `readTypes` tables, which contain functions for writing and reading different data types to and from the network. It also sets the prefix for network messages to an empty string.

---

## AtlasUI.Network :: prepare

```lua
<AtlasUI.Network>:prepare(str: string | table)
```

Adds a network string with the specified name and the current prefix to the list of network strings. If a table of strings is passed, it will add a network string for each string in the table.

**Arguments**

1. str - The name of the network string to be added, or a table of string names.

---

## AtlasUI.Network :: receiver

```lua
<AtlasUI.Network>:receiver(name: string, func: function = function() end)
```

Creates a network message receiver for the specified network string name and prefix. When the network message is received, the specified function will be called with the `AtlasUI.Network` instance, the player who sent the message, and the length of the message as arguments.

**Arguments**

1. name - The name of the network message to listen for.
2. func - The function to be called when the message is received.

---

## AtlasUI.Network :: send

```lua
<AtlasUI.Network>:send(name: string, target: any, func: function)
```

Sends a network message with the specified name and prefix. If the code is running on the client, the target function will be called with the `AtlasUI.Network` instance as an argument and the message will be sent to the server. If the code is running on the server, the func function will be called with the `AtlasUI.Network` instance as an argument and the message will be sent to the specified target.

**Arguments**

1. name - The name of the network message to send.
2. target - The target to send the message to. On the client, this should be a function. On the server, this should be a player or a table of players.
3. func - The function to be called on the server when sending the message.

---

## AtlasUI.Network :: compress

```lua
<AtlasUI.Network>:compress(data: any)
```

Compresses the specified data and writes it to the network along with the length of the data and a boolean indicating whether the data is a table.

**Arguments**

1. data - The data to be compressed and written to the network.

---

## AtlasUI.Network :: decompress

```lua
<AtlasUI.Network>:decompress() :: any
```

Reads and decompresses data from the network, returning the decompressed data as a string or table depending on the boolean value read from the network.

---

## AtlasUI.Network :: getNetworkType

```lua
<AtlasUI.Network>:getNetworkType(input: any) :: number
```

Returns the data type identifier for the specified input.

**Arguments**

1. input - The input to determine the data type identifier for.

---

## AtlasUI.Network :: writeType

```lua
<AtlasUI.Network>:writeType(input: any) :: number
```

Writes the data type identifier for the specified input to the network.

**Arguments**

1. input - The input to determine the data type identifier for.

---

## AtlasUI.Network :: readType

```lua
<AtlasUI.Network>:readType() :: number
```

Reads a data type identifier from the network.

---

## AtlasUI.Network :: write

```lua
<AtlasUI.Network>:write(input: any, ...: any) :: number
```

Writes the specified input and any additional arguments to the network, using the appropriate write function based on the data type of the input.

**Arguments**

1. input - The input to write to the network.
2. ... - Any additional arguments to write to the network.

**Returns**

The data type identifier of the input.

---

## AtlasUI.Network :: writeFromType

```lua
<AtlasUI.Network>:writeFromType(type: number, input: any, ...: any)
```

Writes the specified input and any additional arguments to the network using the write function for the specified data type.

**Arguments**

1. type - The data type identifier to use for writing the input.
2. input - The input to write to the network.
3. ... - Any additional arguments to write to the network.

---

## AtlasUI.Network :: readFromType

```lua
<AtlasUI.Network>:readFromType(type: number, ...: any) -> any
```

Reads data from the network using the read function for the specified data type and returns the data.

**Arguments**

1. type - The data type identifier to use for reading the data.

## Example

```lua
-- Declare a new class that extends AtlasUI.Network
class Network extends AtlasUI.Network
    -- Constructor function, called when creating a new instance of the class
    constructor(...)
        -- Call the constructor of the parent class
        super(...)

        -- Set the prefix for network messages to "SkillSystem."
        self:setPrefix("SkillSystem.")

        -- Add the following network strings to the list of network strings
        self:prepare({
            "MachineUse",
            "ResetSkills",
            "BuySkill",
            "UpdateOwnXP",
            "SyncOnBuy",
            "ChatPrint",
            "PlayerLeveledUp"
        })

        -- Set up a network message receiver for the "ResetSkills" message, calling the "receiveResetSkills" function when the message is received
        self:receiver("ResetSkills",    self.receiveResetSkills)
        -- Set up a network message receiver for the "BuySkill" message, calling the "receiveBuySkill" function when the message is received
        self:receiver("BuySkill",       self.receiveBuySkill)
    end

    -- "sendMachineUse" function, sends a "MachineUse" network message to the specified target
    sendMachineUse(target)
        -- Start the "MachineUse" network message and send it to the specified target
        self:send("MachineUse", target, () -> end)
    end

    -- "sendUpdateOwnXP" function, sends an "UpdateOwnXP" network message to the specified target with the specified XP value
    sendUpdateOwnXP(target, xp: number)
        -- Start the "UpdateOwnXP" network message and send it to the specified target
        self:send("UpdateOwnXP", target, () ->
            -- Write the xp value to the network as a 32-bit integer
            net.WriteInt(xp, 32)
        end)
    end

    -- "sendSyncOnBuy" function, sends a "SyncOnBuy" network message to the specified target with the specified skill id and level
    sendSyncOnBuy(target, skillId, level)
        -- Start the "SyncOnBuy" network message and send it to the specified target
        self:send("SyncOnBuy", target, () ->
            -- Write the skill id to the network as a string
            net.WriteString(skillId)
            -- Write the level to the network as a 32-bit integer
            net.WriteInt(level, 32)
        end)
    end

    -- "sendChatPrint" function, sends a "ChatPrint" network message to the specified target with the specified color and text
    sendChatPrint(target, color, text)
        -- Start the "ChatPrint" network message and send it to the specified target
        self:send("ChatPrint", target, () ->
            -- Compress and write the color to the network
            self:compress(color)
            -- Write the text to the network as a string
            net.WriteString(text)
        end)
    end

    -- "sendPlayerLevelUp" function, sends a "PlayerLeveledUp" network message to the specified target with the specified new level
    sendPlayerLevelUp(target, newLevel)
        -- Start the "PlayerLeveledUp" network message and send it to the specified target
        self:send("PlayerLeveledUp", target, () ->
            -- Write the new level to the network as a 32-bit integer
            net.WriteInt(newLevel, 32)
        end)
    end

    -- "receiveResetSkills" function, called when the "ResetSkills" network message is received
    receiveResetSkills(ply)
        -- TODO: Implement
    end

    -- "receiveBuySkill" function, called when the "BuySkill" network message is received
    receiveBuySkill(ply)
        -- TODO: Implement
    end
end

-- Create a new instance of the Network class and assign it to the "SkillSystem.Network" variable
SkillSystem.Network = Network()
```

*Keep in mind that this is from a server sided file which means that the networking would look slightly different on a client.*

The provided code example uses the `AtlasUI.Network` class to centralize the networking for a "SkillSystem" in a Garry's Mod project. The `Network` class extends the `AtlasUI.Network` class and overrides the constructor function to set up network message receivers and prepare the network strings that it will use. It also defines several functions for sending various types of network messages, as well as functions for handling the receiving of these messages.

To use the `AtlasUI.Network` class similarly, a developer would need to create a new class that extends `AtlasUI.Network` and override the constructor function to set up their own network message receivers and prepare their own network strings. They would then define their own functions for sending and receiving network messages, utilizing the functions provided by the `AtlasUI.Network` class to write and read data to and from the network. They can then create an instance of their class and use it to send and receive network messages as needed in their project.