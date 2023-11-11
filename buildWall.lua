height = 10
length = 10
turtle.select(1)

function start()
    turtle.up()
end

function placeBlock()
    if turtle.getItemCount() == 0 then
        turtle.select(turtle.getSelectedSlot() + 1)
    end
    turtle.placeDown()
end

function turnAround()
    turtle.up()
    turtle.turnLeft()
    turtle.turnLeft()
    placeBlock()
end

function main()
    start()
    for i = 0, height do
        for x = 0, length do
            turtle.forward()
            placeBlock()
        end
        if i ~= height then
            turnAround()
        end
    end
end 
main()