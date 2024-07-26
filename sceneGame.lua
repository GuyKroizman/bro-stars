Score = 0
bullets = {}

frameCounter = 0
lastShootFrame = 0

timeUntilNextEnemySpwan = 100

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
			if self.x > 128 then
				-- self.alive = false
				del(bullets, self)
			end
			self.x = self.x + self.dx
			self.y = self.y + self.dy
		end,
		draw = function(self)
			spr(11, self.x, self.y)
		end,
	}
	add(bullets, bullet)
end

function createBroDeathAnimation(animation)
	local frameCounter = 0
	local currentFrame = 1
	local isFinished = false
	return {
		nextFrame = function()
			frameCounter = frameCounter + 1
			if frameCounter % animation.frameRate == 0 then
				currentFrame = currentFrame + 1
			end
			if currentFrame > #animation.frames then
				isFinished = true
			end
		end,
		isFinished = function()
			return isFinished
		end,
		draw = function()
			spr(animation.frames[currentFrame], bro.x, bro.y)
		end,
		reset = function()
			currentFrame = 1
			frameCounter = 0
			isFinished = false
		end,
	}
end

animation = createBroDeathAnimation({ frameRate = 4, frames = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 } })

bro = {
	x = 64,
	y = 64,
	speed = 1,
	alive = true,
	direction = 1,
	update = function(self)
		if not self.alive then
			animation.nextFrame()
			if animation.isFinished() then
				animation.reset()
				_update = sceneGameOver.update
				_draw = sceneGameOver.draw
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
		if btn(2) then
			self.x = self.x + GetDx(self.speed)
			self.y = self.y + GetDy(self.speed)
		end
		if btn(4) then
			if frameCounter - lastShootFrame < 10 then
				return
			end
			lastShootFrame = frameCounter
			Shoot()
		end
	end,
	draw = function(self)
		if not self.alive then
			animation.draw()
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

function collisionBulletEnemy()
	for enemy in all(enemies) do
		for bullet in all(bullets) do
			if bullet.x > enemy.x and bullet.x < enemy.x + 8 and bullet.y > enemy.y and bullet.y < enemy.y + 8 then
				del(enemies, enemy)
				return true
			end
		end
	end
	return false
end

function collisionBroEnemy(bro, enemy)
	if not bro.alive then
		return false
	end

	if bro.x > enemy.x - 2 and bro.x < enemy.x + 2 + 8 and bro.y > enemy.y - 2 and bro.y < enemy.y + 2 + 8 then
		return true
	end
	return false
end

sceneGame = {
	update = function()
		timeUntilNextEnemySpwan -= 1
		frameCounter += 1
		bro:update()

		for bullet in all(bullets) do
			bullet:update()
			if collisionBulletEnemy(bullet, enemies) then
				sfx(1)
				del(bullets, bullet)
				Score += 1
			end
		end

		for enemy in all(enemies) do
			enemy:update()

			if collisionBroEnemy(bro, enemy) then
				bro.alive = false
				sfx(4)
				sfx(3)
			end
		end

		if timeUntilNextEnemySpwan <= 0 then
			timeUntilNextEnemySpwan = 20 + rnd(60)
			add(enemies, CreateEnemy(128, 64, 1))
		end
	end,
	draw = function()
		cls(1)

		bro:draw()
		for bullet in all(bullets) do
			bullet:draw()
		end
		for enemy in all(enemies) do
			enemy:draw()
		end
		print("score: " .. Score, 5, 5, 7)
	end,
}
