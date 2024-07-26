
function CreateEnemy(init_x, init_y, speed)
    return {
        x=init_x,
        y=init_y,
        dx=-1+rnd(2),
        dy=-1+rnd(2),
        framesuntilnextdirectionchange = 10 + rnd(50),
        update = function(self)
            if self.x <0 then 
                self.dx = 3
            end
            if self.x > 118 then
                self.dx = -3
            end
            if self.y <0 then 
                self.dy = 3
            end
            if self.y > 118 then
                self.dy = -3
            end
            self.framesuntilnextdirectionchange -= 1
            if self.framesuntilnextdirectionchange <= 0 then
                self.framesuntilnextdirectionchange = 10 + rnd(50)
                local d = 1
                self.dx = -1 *d+rnd(2*d)
                self.dy = -1 *d+rnd(2*d)
            end
            
            self.x += self.dx
            self.y += self.dy
        end,
        draw = function(self)
            spr(17, self.x, self.y)
        end
    }
end

enemies = {}