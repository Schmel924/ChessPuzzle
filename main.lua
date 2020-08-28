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
	if iter.hot == 1 then
		love.graphics.setColor(255, 0, 0)
		love.graphics.print('X', iter.x+9, iter.y+3, 0, 4, 3, 0, 0, 0, 0)
		love.graphics.setColor(255, 255, 255)
	end	
end


function generate_table ()
	for i=1,64 do
		local k=i-1
		local cell = { x = math.floor(k/8)*Cell_width, y = k%8*Cell_height, hot = 0, status = love.math.random( 0, 1 ) }
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
			Cell_table[i].hot = 1
		else 
			Cell_table[i].hot = 0
		end
	end
end

function love.draw()
	for i,v in ipairs(Cell_table) do
		draw_cell (v)
	end
end

function love.keyreleased( key, scancode )
	if key == 'space' then generate_table() end
end