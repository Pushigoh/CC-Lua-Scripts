-- buildFloor.lua
os.loadAPI("TurtleNav.lua")
width = 10
length = 10


turtle.turnRight()
for i = 0, length do
    for x = 0, length do
        turtle.placeDown()
        turtle.forward()
        turtle.forward()
    end
    if i % 2 = 0 then
        turtle.turnLeft()
        turtle.forward()
        turtle.turnLeft()
    else
        turtle.turnRight()
        turtle.forward()
        turtle.turnRight()
    end
    
    

    