function _init()
	_update = SceneMenu.update
	_draw = SceneMenu.draw
end

SceneMenu = {
	update = function()
		if btnp(4) or btnp(3) or btnp(2) or btnp(1) or btnp(0) then
			_update = SceneGame.update
			_draw = SceneGame.draw
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

function CreateEnemyAnimation(params)
	local currentFrame = 1
	local framesUntilNextFrame = params.frameRate
	return {
		nextFrame = function()
			framesUntilNextFrame -= 1
			if framesUntilNextFrame <= 0 then
				framesUntilNextFrame = params.frameRate
				currentFrame += 1
				if currentFrame > #params.frames then
					currentFrame = 1
				end
			end
		end,
		draw = function(x, y)
			spr(params.frames[currentFrame], x, y)
		end,
	}
end

function CreateEnemy(init_x, init_y, speed)
	animation = CreateEnemyAnimation({ frameRate = 15, frames = { 33, 17, 34, 35 } })

	return {
		x = init_x,
		y = init_y,
		dx = -1 + rnd(2),
		dy = -1 + rnd(2),
		framesuntilnextdirectionchange = 10 + rnd(50),
		update = function(self)
			if self.x < 0 then
				self.dx = 3
			end
			if self.x > WORLD_SIZE - 10 then
				self.dx = -3
			end
			if self.y < 0 then
				self.dy = 3
			end
			if self.y > WORLD_SIZE - 10 then
				self.dy = -3
			end
			self.framesuntilnextdirectionchange -= 1
			if self.framesuntilnextdirectionchange <= 0 then
				self.framesuntilnextdirectionchange = 10 + rnd(50)
				local d = 1
				self.dx = -1 * d + rnd(2 * d)
				self.dy = -1 * d + rnd(2 * d)
			end

			self.x += self.dx
			self.y += self.dy

			animation.nextFrame()
		end,
		draw = function(self)
			animation.draw(self.x, self.y)
		end,
	}
end

WORLD_SIZE = 1280
Enemies = {}
Score = 0
Bullets = {}

FrameCounter = 0
LastShootFrame = 0

TimeUntilNextEnemySpwan = 80
EnemySpawnSpeed = 30

function CreateStars()
	local brightStars = {}
	local dimStars = {}
	for i = 0, 444 do
		add(brightStars, { x = rnd(WORLD_SIZE), y = rnd(WORLD_SIZE) })
	end
	for i = 0, 1111 do
		add(dimStars, { x = rnd(WORLD_SIZE), y = rnd(WORLD_SIZE) })
	end
	return {
		draw = function()
			for star in all(brightStars) do
				pset(star.x, star.y, 7)
			end
			for star in all(dimStars) do
				pset(star.x, star.y, 13)
			end
		end,
	}
end

Stars = CreateStars()

function CreateSuns()
	local suns = {}
	for i = 0, 40 do
		add(suns, { x = rnd(WORLD_SIZE), y = rnd(WORLD_SIZE) })
	end
	return {
		draw = function()
			for sun in all(suns) do
				circfill(sun.x, sun.y, 3, 13)
				circfill(sun.x, sun.y, 2, 10)
				circfill(sun.x, sun.y, 1, 9)
			end
		end,
	}
end

Suns = CreateSuns()

function GetDx(speed)
	if bro.direction == 1 then
		return 0
	elseif bro.direction == 2 then
		return sqrt(speed)
	elseif bro.direction == 3 then
		return speed
	elseif bro.direction == 4 then
		return sqrt(speed)
	elseif bro.direction == 5 then
		return 0
	elseif bro.direction == 6 then
		return -sqrt(speed)
	elseif bro.direction == 7 then
		return -speed
	elseif bro.direction == 8 then
		return -sqrt(speed)
	end
end
function GetDy(speed)
	if bro.direction == 1 then
		return -speed
	elseif bro.direction == 2 then
		return -sqrt(speed)
	elseif bro.direction == 3 then
		return 0
	elseif bro.direction == 4 then
		return sqrt(speed)
	elseif bro.direction == 5 then
		return speed
	elseif bro.direction == 6 then
		return sqrt(speed)
	elseif bro.direction == 7 then
		return 0
	elseif bro.direction == 8 then
		return -sqrt(speed)
	end
end
function Shoot()
	sfx(2)
	local bullet = {
		-- alive=false,
		x = bro.x,
		y = bro.y,
		speed = 2,
		dx = GetDx(2),
		dy = GetDy(2),
		update = function(self)
			if self.x > bro.x + 64 or self.x < bro.x - 64 or self.y < bro.y - 64 or self.y > bro.y + 64 then
				del(Bullets, self)
			end
			self.x = self.x + self.dx
			self.y = self.y + self.dy
		end,
		draw = function(self)
			spr(11, self.x, self.y)
		end,
	}
	add(Bullets, bullet)
end

function CreateBroDeathAnimation(params)
	local frameCounter = 0
	local currentFrame = 1
	local isFinished = false
	return {
		nextFrame = function()
			frameCounter = frameCounter + 1
			if frameCounter % params.frameRate == 0 then
				currentFrame = currentFrame + 1
			end
			if currentFrame > #params.frames then
				isFinished = true
			end
		end,
		isFinished = function()
			return isFinished
		end,
		draw = function()
			spr(params.frames[currentFrame], bro.x, bro.y)
		end,
		reset = function()
			currentFrame = 1
			frameCounter = 0
			isFinished = false
		end,
	}
end

DeathAnimation = CreateBroDeathAnimation({ frameRate = 4, frames = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 } })

bro = {
	x = WORLD_SIZE / 2,
	y = WORLD_SIZE / 2,
	speed = 1,
	alive = true,
	direction = 1,
	update = function(self)
		if not self.alive then
			DeathAnimation:nextFrame()
			if DeathAnimation.isFinished() then
				DeathAnimation:reset()
				_update = SceneGameOver.update
				_draw = SceneGameOver.draw
			end
			return
		end
		if btnp(0) then
			self.direction -= 1
		end
		if btnp(1) then
			self.direction += 1
		end
		if self.direction > 8 then
			self.direction = 1
		end
		if self.direction < 1 then
			self.direction = 8
		end
		if btn(2) or btn(3) then
			if (self.direction == 8 or self.direction == 1 or self.direction == 2) and self.y < 0 then
				return
			end
			if (self.direction == 2 or self.direction == 3 or self.direction == 4) and self.x > 1200 then
				return
			end
			if (self.direction == 4 or self.direction == 5 or self.direction == 6) and self.y > 1200 then
				return
			end
			if (self.direction == 6 or self.direction == 7 or self.direction == 8) and self.x < 0 then
				return
			end
			self.x = self.x + GetDx(self.speed)
			self.y = self.y + GetDy(self.speed)
		end
		if btn(4) then
			if FrameCounter - LastShootFrame < 10 then
				return
			end
			LastShootFrame = FrameCounter
			Shoot()
		end

		camera(self.x - 64, self.y - 64)
	end,
	draw = function(self)
		if not self.alive then
			DeathAnimation.draw()
			return
		end
		if self.direction == 1 then
			spr(1, self.x, self.y)
		elseif self.direction == 2 then
			spr(2, self.x, self.y, 1, 1, true)
		elseif self.direction == 3 then
			spr(18, self.x, self.y, 1, 1, true, 0)
		elseif self.direction == 4 then
			spr(2, self.x, self.y, 1, 1, true, true)
		elseif self.direction == 5 then
			spr(1, self.x, self.y, 1, 1, true, true)
		elseif self.direction == 6 then
			spr(2, self.x, self.y, 1, 1, false, true)
		elseif self.direction == 7 then
			spr(18, self.x, self.y, 1, 1, false, false)
		elseif self.direction == 8 then
			spr(2, self.x, self.y)
		end
	end,
}

function CollisionBulletEnemy(bullet)
	for enemy in all(Enemies) do
		if bullet.x > enemy.x and bullet.x < enemy.x + 8 and bullet.y > enemy.y and bullet.y < enemy.y + 8 then
			del(Enemies, enemy)
			return true
		end
	end
	return false
end

function CollisionBroEnemy(bro, enemy)
	if not bro.alive then
		return false
	end

	if bro.x > enemy.x - 2 and bro.x < enemy.x + 2 + 8 and bro.y > enemy.y - 2 and bro.y < enemy.y + 2 + 8 then
		return true
	end
	return false
end

SceneGame = {
	update = function()
		TimeUntilNextEnemySpwan -= 1
		FrameCounter += 1
		bro:update()

		for bullet in all(Bullets) do
			bullet:update()
			if CollisionBulletEnemy(bullet) then
				sfx(1)
				del(Bullets, bullet)
				Score += 1
			end
		end

		for enemy in all(Enemies) do
			enemy:update()

			if CollisionBroEnemy(bro, enemy) then
				bro.alive = false
				sfx(4)
				sfx(3)
			end
		end

		if TimeUntilNextEnemySpwan <= 0 then
			TimeUntilNextEnemySpwan = rnd(EnemySpawnSpeed)
			if FrameCounter > 999 then
				EnemySpawnSpeed = 0
			elseif FrameCounter > 666 then
				EnemySpawnSpeed = 5
			elseif FrameCounter > 333 then
				EnemySpawnSpeed = 10
			end
			add(Enemies, CreateEnemy(128, 64, 1))
		end
	end,
	draw = function()
		cls(1)

		Stars:draw()
		Suns:draw()

		bro:draw()
		for bullet in all(Bullets) do
			bullet:draw()
		end
		for enemy in all(Enemies) do
			enemy:draw()
		end
		print("score: " .. Score, bro.x - 60, bro.y - 60, 15)
	end,
}

SceneGameOver = {
	update = function()
		if btnp(4) then
			_update = SceneGame.update
			_draw = SceneGame.draw
			bro.alive = true
			Enemies = {}
			TimeUntilNextEnemySpwan = 80
			EnemySpawnSpeed = 30
			FrameCounter = 0
			LastShootFrame = 0
			Score = 0
		end
	end,
	draw = function()
		cls()
		print("score " .. Score, 40, 54)
		print("so dead bro", 40, 64)
	end,
}
