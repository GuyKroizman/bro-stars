sceneGameOver = {
	update = function()
		if btnp(4) then
			_update = sceneGame.update
			_draw = sceneGame.draw
			bro.alive = true
			enemies = {}
			TimeUntilNextEnemySpwan = 80
			EnemySpawnSpeed = 30
			FrameCounter = 0
		end
	end,
	draw = function()
		cls()
		print("score " .. Score, 40, 54)
		print("so dead bro", 40, 64)
	end,
}
