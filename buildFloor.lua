-- buildFloor.lua
os.loadAPI("TurtleNav.lua")
width = 10
length = 10


turtle.turnRight()
for i = 0, length do
    for x = 0, length do
        turtle.placeDown()
        TurtleNav.move("forward")
    end
    if i % 2 = 0 then
        turtle.turnLeft()
        TurtleNav.move("forward")
        turtle.turnLeft()
    else
        turtle.turnRight()
        TurtleName.move("forward")
        turtle.turnRight()
    end
    
    

    