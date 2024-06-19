local service = loadstring(
    request({
        Url = "https://raw.githubusercontent.com/coconut83171/business-bot/main/include/service.lua"
    }).Body
)();

local is = { };

function is.teammate(character: Model): boolean
    if (not character) then
        return nil;
    end

    for _, value in service.Players.LocalPlayer.PlayerGui:GetChildren() do
        if (
            value:IsA("BillboardGui") and
            value.Name == "NameGui" and
            value.Adornee.Parent.Parent == character
        ) then
            return true;
        end
    end

    return false;
end

return is;
