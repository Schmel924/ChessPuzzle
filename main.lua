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
	for i=1,63 do
		local cell = { x = math.floor(i/8)*Cell_width, y = i%8*Cell_height, status = love.math.random( 0, 1 ) }
		Cell_table [i] = cell
	end
end

function love.load()
	generate_table ()
end
function love.update(dt)
end

function love.draw()
	for i,v in ipairs(Cell_table) do
		draw_cell (v)
	end
end

function love.keyreleased( key, scancode )
	if key == 'space' then generate_table() end
end