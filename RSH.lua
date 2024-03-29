-- Copyright 2019 Elham Aryanpur
--
-- This project is not for use to third party and projects made by other than
-- Royal Studio.

local RSH = {}
json = require("lib.JSON")
local open = io.open
local Time = false
local function getTime() return os.time() end


local function read_file(path)
    local file = open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

local function write_file(path, data)
    local file = open(path, "wb") -- r read mode and b binary mode
    if not file then return nil end
    file:write(data) -- *a or *all reads the whole file
    file:close()
end

function getDB()
    Data = read_file("db.db")
    if Data == nil then
        Data = {}
        Data["Time"] = os.time()
        write_file("db.db", json.encode(Data))
        return Data
    else
        Data = json.decode(Data)
        Time = Data["Time"]
        return Data
    end
end

local function Timer(amount)
    amount = amount or false
    if amount == false then
        Data = getDB()
        if os.time() <= Time then return false end
        if os.time() > Time then return true end
    else
        Data = getDB()
        Data["Time"] = os.time() + amount
        write_file("db.db", json.encode(Data))
    end
end

local function registerEvent(name, points)
    name = name or "myEvent"
    points = points or 100
    DB = getDB()
    if DB == nil then
        DB = {}
    end
    if DB["Event"] == nil then
        DB["Event"] = {}
    end
    DB["Event"][name] = points
    write_file("db.db", json.encode(DB))
end

local function AddEventPoint(eventName, playerName, amount)
    eventName = eventName or "myEvent"
    playerName = playerName or "Player"
    amount = amount or 100

    DB = getDB()
    if DB == nil then
        DB = {}
    end
    if DB["Event"] == nil then
        DB["Event"] = {}
    end
    if DB["Event"][eventName] == nil then
        DB["Event"][eventName] = 100
    end
    if DB["Player"] == nil then
        DB["Player"] = {}
    end
    if DB["Player"][playerName] == nil then
        DB["Player"][playerName] = {}
        DB["Player"][playerName][eventName] = amount
    end
    
    if DB["Player"][playerName][eventName] >= DB["Event"][eventName] then
        write_file("db.db", json.encode(DB))
        return true
    else
        DB["Player"][playerName][eventName] = DB["Player"][playerName][eventName] + amount
        write_file("db.db", json.encode(DB))
        return false
    end

end

local function DeleteEvent(eventName)
    eventName = eventName or "myEvent"

    DB = getDB()
    
    if DB["Event"] == nil then
        DB["Event"] = {}
    end

    DB["Event"][eventName] = nil

    write_file("db.db", json.encode(DB))
end

local function DeletePlayer(playerName)
    playerName = playerName or "Player"

    DB = getDB()

    if DB["Player"] == nil then
        DB["Player"] = {}
    end

    DB["Player"][playerName] = nil

    write_file("db.db", json.encode(DB))
    
end

local function EditEvent(event, save)
    save = save or false
    event = event or "myEvent"

    if save == false then
        DB = getDB()
        if DB["Event"] == nil then
            DB["Event"] = {}
        end

        if DB["Event"][event] == nil then
            DB["Event"][event] = 100
        end

        Data = {}
        Data["name"] = event
        Data["point"] = DB["Event"][event]

        return Data
    else
        DB = getDB()

        if DB["Event"] == nil then
            DB["Event"] = {}
        end
        
        DB["Event"][event["name"]] = event["point"]

        write_file("db.db", json.encode(DB))
    end
end

local function EditPlayer(name, save)
    name = name or "Player"
    save = save or false

    DB = getDB()
    if DB["Player"] == nil then
        DB["Player"] = {}
        DB["Player"][name] = {}
    end
    if DB["Player"][name] == nil then
        DB["Player"][name] = {}
    end

    if save == false then

        Data = {}
        Data["name"] = name
        Data["data"] = DB["Player"][name]
        
        return Data

    else

        DB = getDB()
        if DB["Player"] == nil then
            DB["Player"] = {}
        end

        DB["Player"][name["name"]] = name["data"]

        write_file("db.db", json.encode(DB))
    end
end

RSH.Timer = Timer
RSH.ReadFile = read_file
RSH.WriteFile = write_file
RSH.GetTime = getTime
RSH.RegisterEvent = registerEvent
RSH.AddEventPoint = AddEventPoint
RSH.DeleteEvent = DeleteEvent
RSH.DeletePlayer = DeletePlayer
RSH.EditEvent = EditEvent
RSH.EditPlayer = EditPlayer
RSH.EncodeJSON = json.encode
RSH.DecodeJSON = json.decode
return RSH