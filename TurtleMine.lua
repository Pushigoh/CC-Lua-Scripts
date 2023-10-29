-- TurtleMine.lua
os.loadAPI("TurtleNav.lua")
TurtleNav.initializeCoordinates()

local valuableOres = {
    ["minecraft:iron_ore"] = true,
    ["minecraft:diamond_ore"] = true,
    ["minecraft:coal_ore"] = true,
    ["minecraft:redstone_ore"] = true
}

local function digDown(blocks)
    for _ = 1, blocks do
        while turtle.detectDown() do
            turtle.digDown()
        end
        TurtleNav.move("down")
    end
end

local function digStraight(blocks)
    for _ = 1, blocks do
        while turtle.detect() do
            turtle.dig()
        end
        TurtleNav.move("forward")
    end
end

local function mineVeins()
    local function checkAndDig(direction)
        local success, block = turtle["inspect" .. direction]()
        if success and valuableOres[block.name] then
            turtle["dig" .. direction]()
            return true
        end
        return false
    end

    for _, direction in ipairs({"", "Up", "Down"}) do
        while checkAndDig(direction) do
            turtle["dig" .. direction]()
        end
    end
end

local function returnToOrigin()
    local x, y, z = fs.open("coordinates.txt", "r"):read("*a"):match("(-?%d+)%s+(-?%d+)%s+(-?%d+)")
    x, y, z = tonumber(x), tonumber(y), tonumber(z)

    while y < 0 do
        TurtleNav.move("up")
        y = y + 1
    end

    while z > 0 do
        TurtleNav.move("back")
        z = z - 1
    end

    if x > 0 then
        turtle.turnRight()
        for _ = 1, x do
            TurtleNav.move("forward")
        end
        turtle.turnLeft()
    else
        turtle.turnLeft()
        for _ = 1, -x do
            TurtleNav.move("forward")
        end
        turtle.turnRight()
    end
end

-- Main program
digDown(50)
digStraight(100)
mineVeins()
returnToOrigin()