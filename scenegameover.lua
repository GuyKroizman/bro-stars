sceneGameOver = {
    update = function()
        if btnp(4) then
            _update = sceneGame.update
            _draw = sceneGame.draw
            bro.alive = true
        end
    end,
    draw = function()
        cls()
        print("GAME OVER BRO", 20, 64)
    end
}