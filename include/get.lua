local service = loadstring(
    request({
        Url = "https://raw.githubusercontent.com/coconut83171/business-bot/main/include/service.lua"
    }).Body
)();

local get_children_which_are_a = function(instance: Instance, class: string)
    local children = { };

    for _, value in instance:GetChildren() do
        if (value:IsA(class)) then
            table.insert(children, value);
        end
    end

    return children;
end

local get = { };

function get.characters(): { Model }
    local characters = workspace:WaitForChild("Characters");

    return characters and characters:GetChildren();
end

function get.character(): Model
    for _, value in get.characters() do
        if (#get_children_which_are_a(value, "Model") == 2) then
            return value;
        end
    end

    return nil;
end

function get.weapon(): Model
    for _, value in service.Workspace:GetChildren() do
        if (value:IsA("Model") and value.Name ~= "Arms" and value:FindFirstChild("LeftHand") and value:FindFirstChild("RightHand")) then
            return value;
        end
    end

    return nil;
end

function get.states(character: Model): Folder
    return character:FindFirstChild("State");
end

function get.state(name: string): ValueBase
    local character = get.character();

    if (not character) then
        return nil;
    end

    local states = get.states(character);

    if (not states) then
        return nil;
    end

    return states:FindFirstChild(name);
end

return get;
