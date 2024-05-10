Customzie = require("config.c3s.customize")

-- @formatter:on
function Customize.in_tmux()
    return os.getenv("TMUX") ~= nil
end

function Customize.use_default_opts(plugin)
    return Customize.plugins[plugin].default.opts or false
end

function Customize.use_default_config(plugin)
    return Customize.plugins[plugin].default.config or false
end

function Customize.use_default_keys(plugin)
    return Customize.plugins[plugin].default.keys or false
end

function Customize.is_enabled(plugin)
    local status = Customize.plugins[plugin]
    if status and status.enabled then
        return true
    else
        return false
    end
end

return Customize
