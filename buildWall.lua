height = 5
length = 5
turtle.select(1)


function placeBlock()
    if turtle.getItemCount() == 0 then
        turtle.select(turtle.getSelectedSlot() + 1)
    end
    turtle.placeDown()
end

function start()
    turtle.up()
    placeBlock()
end

function turnAround()
    turtle.up()
    turtle.turnLeft()
    turtle.turnLeft()
    placeBlock()
end

function main()
    start()
    for i = 1, height do
        for x = 1, length do
            turtle.forward()
            placeBlock()
        end
        if i ~= height then
            turnAround()
        end
    end
end 
main()