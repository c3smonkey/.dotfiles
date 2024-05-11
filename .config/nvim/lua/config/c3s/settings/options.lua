-- ----------------------------------------------------------------------------------------------------
-- NOTE: Options settings
-- ----------------------------------------------------------------------------------------------------

local options = {
    fileencoding = "utf-8",
    termguicolors = true,
    background = "dark",
    signcolumn = "yes",
    guifont = "FiraCode Nerd Font:h11",
    number = false,
    relativenumber = false,
    numberwidth = 3,
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 8,
    expandtab = false,
    autoindent = true,
    textwidth = 180,
    colorcolumn = "180",
    breakindent = true,
    cursorline = true,
    scrolloff = 10,
    sidescrolloff = 10,
    updatetime = 250,
    timeoutlen = 300,
    splitright = true,
    splitbelow = true,
    inccommand = "split",
    list = false,
    listchars = { tab = '» ', trail = '·', nbsp = '␣' },
    spelllang = "en_us,de,de_ch",
    spell = true,
    showmode = false,
    clipboard = "unnamedplus",
    undofile = true,
    mouse = "a",
    swapfile = false,
}

for key, value in pairs(options) do
    vim.opt[key] = value
end
