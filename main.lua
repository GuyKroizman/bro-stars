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

		print("use left and right to turn bro", 5, 92, 3)
		print("use up to thrust bro", 5, 100, 3)
		print("use z to shoot bro", 5, 108, 3)
	end,
}
