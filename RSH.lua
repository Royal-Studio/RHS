local RSH = {}
json = require("lib.JSON")
local open = io.open
local Time = false
local function getTime() return os.time() end


function catch(what)
    return what[1]
end
function try(what)
    status, result = pcall(what[1])
    if not status then
       what[2](result)
    end
    return result
end

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

local function Timer(amount)
    amount = amount or false
    if amount == false then
        if os.time() <= Time then return false end
        if os.time() > Time then return true end
    end
    Time = os.time() + amount
end

RSH.Timer = Timer
RSH.ReadFile = read_file
RSH.WriteFile = write_file
return RSH