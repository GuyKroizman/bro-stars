
function _init()
    _update = sceneMenu.update
    _draw = sceneMenu.draw
end

sceneMenu = {
    update = function()
        if btnp(4) then
            _update = sceneGame.update
            _draw = sceneGame.draw
        end
    end,
    draw = function()
        cls()
        print("press z to start bro", 40, 60, 7)
    end
}

