function CreateEnemyAnimation(params)
	local currentFrame = 1
	local framesUntilNextFrame = params.frameRate
	return {
		nextFrame = function(self)
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
			if self.x > 118 then
				self.dx = -3
			end
			if self.y < 0 then
				self.dy = 3
			end
			if self.y > 118 then
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

enemies = {}

