# Introduction

This module provides an implementation of A+ promises for the AtlasUI framework. Promises are a pattern for managing asynchronous code that makes it easier to write and reason about complex, asynchronous code.

## What is an A+ promise?

An A+ promise is a promise that conforms to the A+ specification, which is a set of guidelines for implementing promise objects in JavaScript. The specification is designed to ensure that promise objects are interoperable, meaning that they can be used with any promise-aware code and can be easily composed together to create more complex asynchronous operations. The A+ specification provides guidelines for the behavior of promises, including how they should handle resolution and rejection, how they should handle chaining and composition, and how they should handle errors and exceptions. The goal of the A+ specification is to provide a consistent and predictable interface for working with asynchronous operations.

# Usage

To use the AtlasUI.Promises global variable, you will first need to install the AtlasUI framework

## Creating a promise

To create a new promise, use the `new` function:

```lua
local promise = AtlasUI.Promises.new()
```

This returns a new `Promise` object that can be used to create and manage a promise.

## Resolving a promise

To resolve a promise, call the `resolve` method on the `Promise` object:

```lua
promise:resolve(value)
```

This will cause the promise to be fulfilled with the given value. If the promise has already been resolved or rejected, this method has no effect.

## Rejecting a promise

To reject a promise, call the `reject` method on the `Promise` object:

```lua
promise:reject(reason)
```

This will cause the promise to be rejected with the given reason. If the promise has already been resolved or rejected, this method has no effect.

## Chaining promises

To create a chain of promises, use the `then` method on a promise:

```lua
promise:then(onFulfilled, onRejected)
```


This returns a new promise that will be fulfilled or rejected based on the result of the original promise. If the original promise is fulfilled, the `onFulfilled` callback will be called with the value of the promise, and the new promise will be fulfilled with the return value of the `onFulfilled` callback. If the original promise is rejected, the `onRejected` callback will be called with the reason for the rejection, and the new promise will be rejected with the return value of the `onRejected` callback.

# Methods

These methods are the interface that developers use to create and manipulate promises. Some common methods that are included in promise libraries include `then`, `catch`, `finally`, `all`, and `race`. The Method heading typically includes a brief description of each method, as well as information about the arguments that the method accepts and the value that it returns. The documentation may also include examples of how to use the methods in code.

## AtlasUI.Promises.new()

```lua
AtlasUI.Promises.new(options?: {success: function, failure: function, extend: function}) :: Promise
```

Creates a new `Promise` object to be used inside of an asynchronous function.


**Arguments**

1.options - An optional table containing the following keys:
    * success - The success callback function.
    * failure - The failure callback function.
    * extend - A function that extends the deferred object.

**Returns**

1. A new `Promise` object.

## AtlasUI.Promises.all()

```lua
AtlasUI.Promises.all(args: {Promise...}) :: Promise
```

Takes a list of `Promise` objects and returns a new `Promise` that is fulfilled with the values from the original `Promise` objects. If any of the passed in `Promise` objects are rejected, the returned `Promise` is immediately rejected with the value from the rejected `Promise`.

**Arguments**

1. args - An array of Promise objects to wait for.

**Returns**

1. A new Promise object that is fulfilled with the values from the original Promise objects.

## AtlasUI.Promises.map()

```lua
AtlasUI.Promises.map(args: {Promise...}, fn: function) :: Promise
```

Returns a new `Promise` object that is resolved with the values of sequential application of function fn to each element in the list. `fn` is expected to return `Promise` object.

**Arguments**

1. args - An array of Promise objects to map.
2. fn - The function to use for mapping the Promise objects to new values.

**Returns**
1. A Promise object representing the mapped array of values.

**Example**

```lua
local items = {'a.txt', 'b.txt', 'c.txt'}

-- Read 3 files, one by one
AtlasUI.Promises.map(items, read):next(function(files)
  -- here files is an array of file contents for each of the files
end, function(err)
  -- handle reading error
end)
```

# Example

```lua
local function asyncTask1()
    local promise = AtlasUI.Promises.new()

    -- Perform some asynchronous work
    timer.Simple(1, function()
        promise:resolve('Task 1 completed')
    end)

    return promise
end

local function asyncTask2()
    local promise = AtlasUI.Promises.new()

    -- Perform some asynchronous work
    timer.Simple(0.5, function()
        promise:resolve('Task 2 completed')
    end)

    return promise
end

local function asyncTask3()
    local promise = AtlasUI.Promises.new()

    -- Perform some asynchronous work
    timer.Simple(2, function()
        promise:resolve('Task 3 completed')
    end)

    return promise
end

AtlasUI.Promises.all(
    asyncTask1(),
    asyncTask2(),
    asyncTask3()
):then(function(results)
    print('All tasks completed:')
    for i, result in ipairs(results) do
        print(result)
    end
end)
```

This is an example of how to use promises in Lua. It defines three asynchronous functions, `asyncTask1`, `asyncTask2`, and `asyncTask3`, which each return a `Promise` object. These promises are then passed to the `AtlasUI.Promises.all` function, which returns a new promise that is resolved when all of the promises passed to it have been resolved. The promise returned by `AtlasUI.Promises.all` is then chained using the `:then` method, which allows the results of the three asynchronous tasks to be processed once they have all completed.