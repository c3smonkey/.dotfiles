local Customize = {}

-- @formatter:off
-- enabled:         enable or disable the plugin
-- default:         default options, config and keys for the plugin
--      opts:       options for the plugin
--      config:     configuration for the plugin
--      keys:       keybindings for the plugin
Customize                           = {
    plugins                           = {
        ["catppuccin"]                  = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["tokyonight.nvim"]             = { enabled = true,  default     = { opts = false, config = false,keys = true  }},
        ["nvim-asciidoc-preview"]       = { enabled = true,  default     = { opts = true,  config = true, keys = false }},
        ["diffview.nvim"]               = { enabled = true,  default     = { opts = true,  config = true, keys = false }},
        ["dressing.nvim"]               = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["fzf.vim"]                     = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["gitsigns.nvim"]               = { enabled = true,  default     = { opts = false, config = true, keys = false }},
        ["harpoon"]                     = { enabled = true,  default     = { opts = true,  config = true, keys = false }},
        ["indent-blankline"]            = { enabled = true,  default     = { opts = false, config = true, keys = true  }},
        ["lazygit.nvim"]                = { enabled = true,  default     = { opts = true,  config = true, keys = false }},
        ["lualine.nvim"]                = { enabled = true,  default     = { opts = false, config = true, keys = true  }},
        ["neo-tree.nvim"]               = { enabled = true,  default     = { opts = true,  config = true, keys = true }},
        ["markdown-preview.nvim"]       = { enabled = true,  default     = { opts = true,  config = true, keys = false }},
        ["noice.nvim"]                  = { enabled = true,  default     = { opts = false, config = true, keys = true  }},
        ["nvim-treesitter"]             = { enabled = true,  default     = { opts = false, config = true, keys = true  }},
        ["nvim-surround"]               = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["telescope.nvim"]              = { enabled = true,  default     = { opts = false, config = false,keys = false }},
        ["todo-comments.nvim"]          = { enabled = true,  default     = { opts = false, config = true, keys = true  }},
        ["toggleterm"]                  = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["trouble.nvim"]                = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["undotree"]                    = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["vim-fugitive"]                = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["vim-tmux-navigator"]          = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["vim-wakatime"]                = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["which-key.nvim"]              = { enabled = true,  default     = { opts = true,  config = false,keys = true  }},
        ["zen-mode.nvim"]               = { enabled = true,  default     = { opts = true,  config = true ,keys = true  }},
        ["copilot.vim"]                 = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["twilight.nvim"]               = { enabled = true,  default     = { opts = true,  config = true ,keys = true  }},
        ["yazi.nvim"]                   = { enabled = true,  default     = { opts = true,  config = true ,keys = true  }},
        ["goyo.vim"]                    = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["limelight.vim"]               = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["mini.nvim"]                   = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["oil.nvim"]                    = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["mason.nvim"]                  = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["mason-lspconfig.nvim"]        = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["nvim-lspconfig"]              = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["nvim-autopairs"]              = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["nvim-cmp"]                    = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["nvim-dap"]                    = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["vim-test"]                    = { enabled = true,  default     = { opts = true,  config = true, keys = true  }},
        ["lsp-zero.nvim"]               = { enabled = false, default     = { opts = true,  config = true, keys = true  }},
        ["go.nvim"]                     = { enabled = false, default     = { opts = true,  config = true, keys = true  }},
    }
}

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
