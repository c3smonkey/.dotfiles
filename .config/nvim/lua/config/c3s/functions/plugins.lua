Plugin = require("config.c3s.configure-plugin")

-- @formatter:on
function Plugin.in_tmux()
    return os.getenv("TMUX") ~= nil
end

function Plugin.use_default_opts(plugin)
    return Customize.plugins[plugin].default.opts or false
end

function Plugin.use_default_config(plugin)
    return Customize.plugins[plugin].default.config or false
end

function Plugin.use_default_keys(plugin)
    return Customize.plugins[plugin].default.keys or false
end

function Plugin.is_enabled(plugin)
    local status = Customize.plugins[plugin]
    if status and status.enabled then
        return true
    else
        return false
    end
end

return Plugin
