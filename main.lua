Cell_width, Cell_height = 50, 50
Cell_table = {
-- Cell={	x = 0, y = 0, status = 1 }
}
function draw_cell (iter)
	if iter.status == 1 then 
		love.graphics.rectangle( 'fill', iter.x+1, iter.y+1, Cell_width-2, Cell_height-2 )
	 else 
	 	love.graphics.rectangle( 'line', iter.x, iter.y, Cell_width, Cell_height )
	 end
end


function generate_table ()
	for i=1,64 do
		local k=i-1
		local cell = { x = math.floor(k/8)*Cell_width, y = k%8*Cell_height, status = love.math.random( 0, 1 ) }
		--print (math.floor(i/4), i%4)
		Cell_table [i] = cell
	end
end

function love.load()
	generate_table ()
end
function love.update(dt)
	x, y = love.mouse.getPosition()
	for i=1,64 do
		local c = Cell_table [i]
		if c.x<x and c.y<y and c.x+Cell_width >x and c.y+Cell_height>y then
			Hot_cell = Cell_table [i]
		end
	end
	if x>Cell_table[64].x+Cell_width or y>Cell_table[64].y+Cell_height then
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
end

function love.keyreleased( key, scancode )
	if key == 'space' then generate_table() end
end