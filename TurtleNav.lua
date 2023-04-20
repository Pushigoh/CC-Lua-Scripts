local TurtleNav = {}
local function readFile()
    local file = fs.open("coordinates.txt", "r")
    if file then
        local contents = file.readAll()
        file.close()
        local x, y, z = contents:match("(-?%d+)%s+(-?%d+)%s+(-?%d+)")
        return tonumber(x), tonumber(y), tonumber(z)
    end
    return nil
end

local function writeFile(x, y, z)
    local file = fs.open("coordinates.txt", "w")
    file.write(x .. " " .. y .. " " .. z)
    file.close()
end

function initializeCoordinates()
    if not fs.exists("coordinates.txt") then
        writeFile(0, 0, 0)
    end
end

function TurtleNav.move(direction)
    local success = false
    local x, y, z = readFile()
    
    if direction == "forward" then
        success = turtle.forward()
        if success then z = z + 1 end
    elseif direction == "back" then
        success = turtle.back()
        if success then z = z - 1 end
    elseif direction == "up" then
        success = turtle.up()
        if success then y = y + 1 end
    elseif direction == "down" then
        success = turtle.down()
        if success then y = y - 1 end
    elseif direction == "left" then
        turtle.turnLeft()
        success = turtle.forward()
        if success then x = x - 1 end
        turtle.turnRight()
    elseif direction == "right" then
        turtle.turnRight()
        success = turtle.forward()
        if success then x = x + 1 end
        turtle.turnLeft()
    end

    if success then
        writeFile(x, y, z)
    end

    return success
end

return TurtleNav