function placeStairs(level)
	turtle.forward()
	turtle.dig()
	turtle.forward()
	turtle.dig()
	turtle.select(16)
	turtle.place()
	turtle.select(1)
	if (level % 5) == 0 then
		turtle.turnRight()
		turtle.dig()
    	clearInventory()
    	turtle.turnLeft()
    end
	turtle.back()
	turtle.back()
end

function placeStairsOdd(level)
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
	if (level % 5) == 0 then
		turtle.dig()
    	clearInventory()
    end
	turtle.turnLeft()
	turtle.forward()
	turtle.forward()
end

function clearInventory()
	turtle.select(15)
	turtle.place()

	for i=1,14 do
		local item = turtle.getItemDetail(i)
		if item ~= nil then
			if item.name == "minecraft:dirt" or item.name == "minecraft:cobblestone" 
				or item.name == "minecraft:coal" or item.name == "minecraft:stone"
				or item.name == "minecraft:wheat_seeds" or item.name == "minecraft:gravel"
				then
				turtle.select(i)
				turtle.drop()
			end
		end
	end

	for i = 1, 13 do
		turtle.select(i)
		local item = turtle.getItemDetail(i)
		if item ~= nil then 
			for j = i+1, 14 do
				local itemToCompare = turtle.getItemDetail(j)
				if itemToCompare ~= nil then 
					if item.name == itemToCompare.name then
						turtle.select(j)
						turtle.transferTo(i, turtle.getItemCount(j))
					end
				end
			end
		end
	end


	turtle.select(1)
end

level = 50
size = 7
isTurn = false

turtle.refuel()

for i = 1, level do
    isTurn = false
    
    for j = 1, size do
        for k = 1, size do
            turtle.dig()  
            if (j == 1 and (not isTurn) and k == size and (i % 2) == 0) then
	        	placeStairs(i)
	        elseif (j == size and (not isTurn) and k == 1 and (i % 2) ~= 0) then
				placeStairsOdd(i)
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
