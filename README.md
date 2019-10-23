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
points.

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

#### CURRENTLY THIS IS ALL IT HAS! MORE FEATURES WILL COME AS NEEDED
