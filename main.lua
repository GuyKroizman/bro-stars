function _init()
	_update = sceneMenu.update
	_draw = sceneMenu.draw
end

sceneMenu = {
	update = function()
		if btnp(4) or btnp(3) or btnp(2) or btnp(1) or btnp(0) then
			_update = sceneGame.update
			_draw = sceneGame.draw
		end
	end,
	draw = function()
		cls(15)
		print("go bro - save us!", 25, 60, 2)
	end,
}
