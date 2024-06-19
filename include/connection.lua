local connection = { };
local cache = { };

function connection.create(instance: Instance, connection: string, closure: () -> ()): RBXScriptSignal
    if (not instance or not connection or not closure) then
        return;
    end

    local connection = instance[connection]:Connect(closure);

    table.insert(cache, connection);
    return connection;
end

function connection.destroy(connection: RBXScriptSignal)
    if (not connection) then
        return;
    end

    if (not cache[connection]) then
        return;
    end

    cache[connection]:Disconnect();
    table.remove(cache, connection);
end

return connection;
