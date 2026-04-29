local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local resize_mode = false

local function with_pick(method)
  return function()
    local ok, pick = pcall(require, "mini.pick")
    if not ok then
      vim.notify("mini.pick ist nicht geladen", vim.log.levels.WARN)
      return
    end
    pick.builtin[method]()
  end
end

local function keymap_opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

local function resize_mode_on()
  map("n", "h", ":vertical resize -2<CR>", keymap_opts("Resize links"))
  map("n", "j", ":resize +2<CR>", keymap_opts("Resize unten"))
  map("n", "k", ":resize -2<CR>", keymap_opts("Resize oben"))
  map("n", "l", ":vertical resize +2<CR>", keymap_opts("Resize rechts"))
  vim.notify("Resize-Mode: AN (h/j/k/l)", vim.log.levels.INFO)
end

local function resize_mode_off()
  pcall(vim.keymap.del, "n", "h")
  pcall(vim.keymap.del, "n", "j")
  pcall(vim.keymap.del, "n", "k")
  pcall(vim.keymap.del, "n", "l")
  vim.notify("Resize-Mode: AUS", vim.log.levels.INFO)
end

map("n", "<leader>r", function()
  resize_mode = not resize_mode
  if resize_mode then
    resize_mode_on()
  else
    resize_mode_off()
  end
end, keymap_opts("Resize-Mode umschalten"))

map("n", "<Tab>", ":tabprevious<CR>", keymap_opts("Vorheriger Tab"))
map("n", "<S-Tab>", ":tabnext<CR>", keymap_opts("Nächster Tab"))

map("n", "<leader>bp", ":bprevious<CR>", keymap_opts("Vorheriger Buffer"))
map("n", "<leader>bn", ":bnext<CR>", keymap_opts("Nächster Buffer"))
map("n", "<leader>bd", ":bdelete<CR>", keymap_opts("Buffer schließen"))
map("n", "<leader>bc", ":bdelete<CR>", keymap_opts("Buffer schließen"))
map("n", "<leader>bx", ":only<CR>", keymap_opts("Unsplit (nur aktuelles Fenster)"))
map("n", "<leader>-", "<cmd>silent split<CR>", keymap_opts("Horizontal split"))
map("n", "<leader>|", "<cmd>silent vsplit<CR>", keymap_opts("Vertical split"))

map("n", "<leader>sg", with_pick("grep_live"), keymap_opts("Search by grep"))
map("n", "<leader>se", with_pick("resume"), keymap_opts("Search everywhere"))
map("n", "<leader>sE", function()
  local ok, pick = pcall(require, "mini.pick")
  if not ok then
    vim.notify("mini.pick ist nicht geladen", vim.log.levels.WARN)
    return
  end
  pick.builtin.files({ cwd = vim.fn.expand("~") })
end, keymap_opts("Search everywhere (home)"))
map("n", "<leader>sf", with_pick("files"), keymap_opts("Search file"))
map("n", "<leader>sr", function()
  local ok, extra = pcall(require, "mini.extra")
  if not ok then
    vim.notify("mini.extra ist nicht geladen", vim.log.levels.WARN)
    return
  end
  extra.pickers.oldfiles()
end, keymap_opts("Search recent files"))
map("n", "<Esc>", function()
  if resize_mode then
    resize_mode = false
    resize_mode_off()
    return
  end
  vim.cmd("nohlsearch")
end, keymap_opts("Search Highlight löschen / Resize-Mode aus"))

map("n", "<leader>w", ":write<CR>", keymap_opts("Speichern"))
map("n", "<leader>q", ":quit<CR>", keymap_opts("Schließen"))
map("n", "<leader>Q", ":quitall<CR>", keymap_opts("Alle schließen"))
map("n", "<leader>e", ":Lexplore<CR>", keymap_opts("Datei-Explorer (Toggle)"))

map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

map("n", "J", "mzJ`z", opts)

map("v", "<", "<gv", keymap_opts("Indent links"))
map("v", ">", ">gv", keymap_opts("Indent rechts"))

map("v", "J", ":move '>+1<CR>gv=gv", keymap_opts("Text runter"))
map("v", "K", ":move '<-2<CR>gv=gv", keymap_opts("Text hoch"))

map("v", "p", '"_dP', opts)

map("i", "jj", "<Esc>", keymap_opts("Exit Insert Mode"))
map("i", "jk", "<Esc>", keymap_opts("Exit Insert Mode"))
map("i", "kj", "<Esc>", keymap_opts("Exit Insert Mode"))

map("n", "<leader>tt", ":TransparencyCycle<CR>", keymap_opts("Transparenz durchschalten"))

map("n", "<leader>tn", ":TransparencySet none<CR>", keymap_opts("Transparenz: Keine"))
map("n", "<leader>tm", ":TransparencySet minimal<CR>", keymap_opts("Transparenz: Minimal"))
map("n", "<leader>tr", ":TransparencySet moderate<CR>", keymap_opts("Transparenz: Moderat"))
map("n", "<leader>tf", ":TransparencySet full<CR>", keymap_opts("Transparenz: Maximal"))

map("n", "<leader>pu", function()
  vim.pack.update()
end, keymap_opts("Plugins updaten"))
map("n", "<leader>ps", function()
  vim.pack.update(nil, { offline = true, target = "lockfile" })
end, keymap_opts("Plugins aus Lockfile syncen"))
map("n", "<leader>pi", function()
  vim.print(vim.pack.get())
end, keymap_opts("Plugin-Liste anzeigen"))

map("n", "<leader>gg", ":LazyGit<CR>", keymap_opts("LazyGit"))
