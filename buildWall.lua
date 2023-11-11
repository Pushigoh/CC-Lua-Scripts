height = 10
length = 10
turtle.select(1)

function placeBlock()
    if turtle.getItemCount() == 0 then
        turtle.select(turtle.getSelectedSlot() + 1)
    end
    turtle.placeDown()
end

function turnAround()
    turtle.Up()
    turtle.turnLeft()
    turtle.turnLeft()
    placeBlock()
end

function main()
    for i = 0, height do
        for x = 0, length do
            turtle.forward()
            placeBlock()
        end
        turnAround()
    end
end 
main()