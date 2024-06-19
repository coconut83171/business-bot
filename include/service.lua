return setmetatable({ }, {
    __index = function(_, index)
        return cloneref(game.GetService(game, index));
    end
});
