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
        return nil
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

local function AddEventPoint(playerName, amount)
    -- TODO
    -- Here it will add points to player... or make player if it do not exist
end

RSH.Timer = Timer
RSH.ReadFile = read_file
RSH.WriteFile = write_file
RSH.GetTime = getTime
RSH.RegisterEvent = registerEvent
return RSH