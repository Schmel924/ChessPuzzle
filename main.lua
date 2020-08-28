Cell_width, Cell_height = 50, 50
Cell_table = {--[[ Cell={	x = 0, y = 0, status = 1 }]] }
Board_size = 16
row_count = 4

function draw_cell (iter)
	if iter.status == 1 then 
		love.graphics.rectangle( 'fill', iter.x+1, iter.y+1, Cell_width-2, Cell_height-2 )
	 else 
	 	love.graphics.rectangle( 'line', iter.x, iter.y, Cell_width, Cell_height )
	 end
end

function read_table ()
	local res = 0	
	for k,v in pairs(Cell_table) do
		res = res + k*v.status
	end
	return res%Board_size	
end

function generate_table ()
	for i=1,Board_size do
		local k=i-1
		local cell = { y = math.floor(k/row_count)*Cell_width, x = k%row_count*Cell_height, status = love.math.random( 0, 1 ) }
		--print (math.floor(i/4), i%4)
		Cell_table [i] = cell
	end
end

function love.load()
	generate_table ()
end

function love.update(dt)
	x, y = love.mouse.getPosition()
	for i=1,Board_size do
		local c = Cell_table [i]
		if c.x<x and c.y<y and c.x+Cell_width >x and c.y+Cell_height>y then
			Hot_cell = Cell_table [i]
		end
	end
	if x>Cell_table[Board_size].x+Cell_width or y>Cell_table[Board_size].y+Cell_height then
		Hot_cell = nil
	end
end

function love.draw()
	for i,v in ipairs(Cell_table) do
		draw_cell (v)
	end
	if Hot_cell ~= nil then
		love.graphics.setColor(255, 0, 0)
		love.graphics.print('X', Hot_cell.x+9, Hot_cell.y+3, 0, 4, 3, 0, 0, 0, 0)
		love.graphics.setColor(255, 255, 255)
	end
	local s = read_table ()+1
	--print (s)
	love.graphics.print(s,450,200)
end

function love.mousepressed (x,y,b)
if b == 1 and Hot_cell~=nil then
	if Hot_cell.status == 1 then Hot_cell.status = 0 else Hot_cell.status = 1 end
end
end	

function love.keyreleased( key, scancode )
	if key == 'space' then generate_table() end
	if key == "tab" then
      local state = not love.mouse.isVisible()   -- the opposite of whatever it currently is
      love.mouse.setVisible(state)
	end
end