function placeStairs()
	turtle.forward()
	turtle.dig()
	turtle.forward()
	turtle.dig()
	turtle.select(16)
	turtle.place()
	turtle.select(1)
	turtle.back()
	turtle.back()
end

function placeStairsOdd()
	turtle.turnRight()
	turtle.turnRight()
	turtle.forward()
	turtle.dig()
	turtle.forward()
	turtle.dig()
	turtle.select(16)
	turtle.place()
	turtle.select(1)
	turtle.turnLeft()
	turtle.turnLeft()
	turtle.forward()
	turtle.forward()
end

function clearInventory()
	turtle.select(15)
	turtle.placeUp()

	for i=1,14 do
		local item = turtle.getItemDetail(i)
		if item ~= nil then
			if item.name == "minecraft:dirt" or item.name == "minecraft:cobblestone" then
				turtle.select(i)
				turtle.dropUp()
			end
		end
	end

	turtle.select(1)
end

level = 10
size = 5
isTurn = false

turtle.refuel()

for i = 1, level do
    isTurn = false
    
    for j = 1, size do
        for k = 1, size do
            turtle.dig()
            
	 		if (j == 1 and (not isTurn) and k == size and (i % 2) == 0) then
	        	placeStairs()
	        elseif (j == size and (not isTurn) and k == 1 and (i % 2) ~= 0) then
				placeStairsOdd()
	        end

            turtle.forward()
        end

        if j == size then
            turtle.turnRight()
            turtle.turnRight()
            break
        end
        
        if isTurn then
            isTurn = false
            turtle.turnLeft()
            turtle.dig()
            turtle.forward()
            turtle.turnLeft()
        else
            isTurn = true
            turtle.turnRight()
            turtle.dig()
            turtle.forward()
            turtle.turnRight()
        end
    end
    
    turtle.digDown()
    turtle.down()

    if (i % 10) == 0 then
    	clearInventory()
    end
end

turtle.dig()
turtle.forward()
turtle.up()
turtle.back()
turtle.back()
local turnToReturn = false
turtle.turnRight()
if turtle.detect() then
	turtle.turnLeft()
	turtle.turnLeft()
	turnToReturn = true
end
turtle.forward()
turtle.forward()
turtle.forward()

for i = 1, level do
    turtle.up()
end

turtle.back()
turtle.back()
turtle.back()
turtle.back()
