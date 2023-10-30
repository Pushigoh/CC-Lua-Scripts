-- buildFloor.lua
-- os.loadAPI("TurtleNav.lua")
width = 25
length = 25
select(1)

function placeBlock()
    if turtle.getItemCount() == 0 then
        select(getSelectedSlot() + 1)
    end
    turtle.placeDown()
end


turtle.turnRight()
for i = 0, length do
    for x = 0, length do
        placeBlock()
        turtle.forward()
    end
    if i % 2 == 0 then
        turtle.turnLeft()
        turtle.forward()
        turtle.turnLeft()
        turtle.forward()
    else
        turtle.turnRight()
        turtle.forward()
        turtle.turnRight()
        turtle.forward()
    end
end 
    

    