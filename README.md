# Royal Studio's Helper script

## About

RSH is scripts that are used in projects made by [Royal Studio](https://discord.gg/C2FnfJF).

```
This project is not licensed of use for projects made by other than Royal Studio.
And shall not be used by third party.

Copyright 2019 - Royal Studio

```

## Documentation

### Installation

#### Git

``` bash
git clone https://www.github.com/royal-studio/RSH
```

#### Bruteforce

On the [RSH's Github Repository](https://www.github.com.royal-studio/RSH), click
on download. After download is done, just extract it

#### Extra Files

You can delete files that are not required which goes as follow:

1. `.gitignore`
2. `README.md`


### Getting Started

RSH's functions are bundled and exported as a dictionary (Or JSON format as in
terms of other languages). Thus it can be imported and used as follow:

``` lua
RSH = require("RSH")

RSH.Timer(5)
```

Remember, RSH is imported as "`dictionary`", __NOT__ "`Class`"!

### API

#### Timer

``` lua
RSH.Timer(amount)
```

This function is used to make a global timer. It can be givin parameter in seconds and it
can be called without parameters as well.

The following example will make a timer of 5 seconds:

``` lua
RSH.Timer(5)

while (RSH.Timer() == false) do
    print("Not Yet!")
end

print("I AM DONE!")
```

#### ReadFile

``` lua
fileData = RSH.ReadFile(path)
```

This function read a file and return a string containing it's data. It can read
binary files as well.

Example below will read `foo.txt` and print it's content:

``` lua
foo = RSH.ReadFile("foo.txt")

print(foo)
```

#### WriteFile

```lua
RSH.WriteFile(path, data)
```

This function writes data to a file given in path. Both parameters are required.
This function write as binary thus you can write binary data to a file too. If
the file does not exist yet, it will auto make it.

`WARNING: This function will overwrite existing data the file has!`

Example below will write some text to `foo.txt`:

``` lua
path = "foo.txt"
data = "I am AWESOME!"

RSH.WriteFile(path, data)
```

#### Register Event

```lua
RSH.RegisterEvent(name, points)
```

This function is used to register an event with given amount of points. By
default, if no parameter given, it will set an event by name of `myEvent` with
amount of `100` points.

Example below will register an event by name of `Bar` with amount of `5000`
points:

```lua
name = "Bar"
points = 5000

RSH.RegisterEvent(name, points)
```

#### AddEventPoint

```lua
RSH.AddEventPoint(eventName, playerName, amount)
```

This function will add an amount of points to the player for a given event. 

If
player's amount of point get bigger than the event's limit, it will not append
points and return `true`. Otherwise it will return `false`.

By default, it has eventName as `myEvent`, playerName as `Player` and amount as
`100`

Example below will give `500` points to player `Foo`

```lua
eventName = "Bar"
playerName = "Foo"
amount = 500

RSH.AddEventPoint(eventName, playerName, amount)
```

#### Delete Event

```lua
RSH.DeleteEvent(eventName)
```

This function will delete a given event. By default, it will delete an event by
name of `myEvent`.

Following Example will delete the event `Bar` we recently made:

```lua
eventName = "Bar"

RSH.DeleteEvent(eventName)
```

#### Delete Player

```lua
RSH.DeletePlayer(playerName)
```

This function will delete a give player. By default, it will delete a player by
name of `Player`.

Following Example will delete the player `Foo` we recently made:

```lua
playerName = "Foo"

RSH.DeletePlayer(playerName)
```

#### Edit Event

```lua
event = RSH.EditEvent(event, save)
```

This function, if second parameter is not given, will return a table containing
`name` and `point`s of the event... so that you can adjust it.

Once you are satisfied with the adjusment, you can call the function again, but
this time having second parameter as `true`.

The table have two keys:

1. `name` - This is the name of event
2. `point` - This is the amount of points assigned to event

`NOTE: If name is adjusted, it will be saved as new event rather than replacing
old one!`

The following example will edit the points of the event `Bar` and assign it's
points to value of `1000`:

```lua
eventName = "Bar"

event = RSH.EditEvent(eventName)

event["point"] = 1000

RSH.EditEvent(event, true)
```

#### Edit Player

```lua
player = RSH.EditPlayer(player, save)
```

This function, if second parameter is not given, will return a table containing
`name` and `data`s of the player... so that you can adjust it.

Once you are satisfied with the adjusment, you can call the function again, but
this time having second parameter as `true`.

The table have two keys:

1. `name` - This is the name of event
2. `data` - This is the data table containing events the player has been given
   to and amount of point the player recieved

`NOTE: If name is adjusted, it will be saved as new player rather than replacing
old one!`

The following example will edit the points for the event `Bar` and assign it's
points to value of `1000`:

```lua
playerName = "Foo"

Player = RSH.EditPlayer(playerName)

Player["data"]["Bar"] = 1000

RSH.EditPlayer(Player, true)
```

#### Encode JSON

```lua
encodedTable = RSH.EncodeJSON(Table)
```

This function will return a parsed string version of a Table, Dictionary, JSON,
...

You can use this to save your JSON data on the disk, Database, ...

Example below will make a `Table` and `print` it:

```lua
myTable = {}

myTable["key"] = "value"

encodedTable = RSH.EncodeJSON(myTable)

print(encodedTable)
```

#### Decode JSON

```lua
decodedTable = RSH.DecodeJSON(JSON)
```

This function will turn `string JSON` into a `Table`. Useful when you want to
use saved JSON from disk, database, ...

Example below will make a `string JSON` and print it's `Table Value`:

```lua
myJSON = '{"key":"value"}'

decodedJSON = RSH.DecodeJSON(myJSON)

print(decodedJSON["key"])
```

#### CURRENTLY THIS IS ALL IT HAS! MORE FEATURES WILL COME AS NEEDED
