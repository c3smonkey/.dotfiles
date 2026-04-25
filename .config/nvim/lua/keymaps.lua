-- ╭────────────────────────────────────────────╮
-- │  Essential Keybindings                    │
-- ╰────────────────────────────────────────────╯

-- Clear search highlight and exit insert mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR><Esc>', { desc = 'Clear search' })
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Exit insert mode' })

-- ╭────────────────────────────────────────────╮
-- │  Basic Operations                         │
-- ╰────────────────────────────────────────────╯

-- Save, Quit, and Buffer Management
vim.keymap.set('n', '<leader>w', '<cmd>write<CR>', { desc = 'Save' })
vim.keymap.set('n', '<leader>q', '<cmd>quit<CR>', { desc = 'Quit window' })
vim.keymap.set('n', '<leader>x', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>bb', '<cmd>b#<CR>', { desc = 'Toggle last buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
-- buffer next tab
vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>Q', '<cmd>qa!<CR>', { desc = 'Quit all' })
vim.keymap.set('n', '<leader>W', '<cmd>wa<CR>', { desc = 'Save all' })
vim.keymap.set('n', '<leader>Z', '<cmd>wqa<CR>', { desc = 'Save and quit all' })
vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>', { desc = 'Toggle undo tree' })

-- ╭────────────────────────────────────────────╮
-- │  Window Splits                            │
-- ╰────────────────────────────────────────────╯

-- Create and manage window splits
vim.keymap.set('n', '<leader>|', '<cmd>vsplit<CR>', { desc = 'Split vertically' })
vim.keymap.set('n', '<leader>-', '<cmd>split<CR>', { desc = 'Split horizontally' })
vim.keymap.set('n', '<leader>bx', '<cmd>only<CR>', { desc = 'Close all splits' })

-- Window navigation (Ctrl + hjkl)
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Window up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Window right' })
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { desc = 'Window left' })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { desc = 'Window down' })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { desc = 'Window up' })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { desc = 'Window right' })

-- Window Resize Mode (like Aerospace resize mode)
-- Toggle with <leader>wr, then use h/j/k/l to resize, ESC to exit
local resize_mode_active = false

local function toggle_resize_mode()
	resize_mode_active = not resize_mode_active
	
	if resize_mode_active then
		-- Set up resize keybindings
		vim.keymap.set('n', 'h', '<cmd>vertical resize -2<CR>', { buffer = true, desc = 'Resize: narrower' })
		vim.keymap.set('n', 'l', '<cmd>vertical resize +2<CR>', { buffer = true, desc = 'Resize: wider' })
		vim.keymap.set('n', 'j', '<cmd>resize +2<CR>', { buffer = true, desc = 'Resize: taller' })
		vim.keymap.set('n', 'k', '<cmd>resize -2<CR>', { buffer = true, desc = 'Resize: shorter' })
		
		-- Exit resize mode keybindings
		vim.keymap.set('n', '<Esc>', toggle_resize_mode, { buffer = true, desc = 'Exit resize mode' })
		vim.keymap.set('n', '<leader>wr', toggle_resize_mode, { buffer = true, desc = 'Exit resize mode' })
	else
		-- Remove resize keybindings
		vim.keymap.del('n', 'h', { buffer = true })
		vim.keymap.del('n', 'l', { buffer = true })
		vim.keymap.del('n', 'j', { buffer = true })
		vim.keymap.del('n', 'k', { buffer = true })
		vim.keymap.del('n', '<Esc>', { buffer = true })
		vim.keymap.del('n', '<leader>wr', { buffer = true })
	end
end

vim.keymap.set('n', '<leader>wr', toggle_resize_mode, { desc = 'Toggle window resize mode' })

-- ╭────────────────────────────────────────────╮
-- │  File Explorer                            │
-- ╰────────────────────────────────────────────╯

-- Yazi file manager integration
vim.keymap.set('n', '<leader>e', function()
  local bufname = vim.api.nvim_buf_get_name(0)
  local path = bufname ~= '' and bufname or vim.fn.getcwd()
  require('mini.files').open(path, true)
end, { desc = 'Open file explorer' })

vim.keymap.set('n', '<leader>ee', '<cmd>Yazi<CR>', { desc = 'Open Yazi file manager' })

-- ╭────────────────────────────────────────────╮
-- │  Theme & Transparency                     │
-- ╰────────────────────────────────────────────╯

-- Transparency levels and theme cycling
vim.keymap.set('n', '<leader>tn', function()
  require('colorscheme.transparent').set('none')
end, { desc = 'Transparency none' })

vim.keymap.set('n', '<leader>tm', function()
  require('colorscheme.transparent').set('minimal')
end, { desc = 'Transparency minimal' })

vim.keymap.set('n', '<leader>tr', function()
  require('colorscheme.transparent').set('moderate')
end, { desc = 'Transparency moderate' })

vim.keymap.set('n', '<leader>tf', function()
  require('colorscheme.transparent').set('full')
end, { desc = 'Transparency full' })

vim.keymap.set('n', '<leader>tc', function()
  require('colorscheme').cycle_theme()
end, { desc = 'Theme rotate' })

-- ╭────────────────────────────────────────────╮
-- │  Search & Navigation                      │
-- ╰────────────────────────────────────────────╯

-- File/Buffer/Grep search using mini.pick
vim.keymap.set('n', '<leader>sf', function()
  require('mini.pick').builtin.files()
end, { desc = '[S]earch [F]iles' })

vim.keymap.set('n', '<leader>sb', function()
  require('mini.pick').builtin.buffers()
end, { desc = '[S]earch [B]uffers' })

vim.keymap.set('n', '<leader>sg', function()
  require('mini.pick').builtin.grep_live()
end, { desc = '[S]earch [G]rep' })

-- Recent files (project only, max 10, includes subfolders)
vim.keymap.set('n', '<leader>sr', function()
  local cwd = vim.fn.getcwd()
  local recent = vim.v.oldfiles
  local filtered = {}
  
  -- Filter: only files from current project (includes subfolders)
  for _, file in ipairs(recent) do
    if vim.startswith(file, cwd) then
      table.insert(filtered, file)
      if #filtered >= 10 then break end  -- Max 10
    end
  end
  
  -- If no recent files, show notification
  if #filtered == 0 then
    vim.notify('No recent files in current project', vim.log.levels.INFO)
    return
  end
  
  require('mini.pick').start({
    source = {
      items = filtered,
      name = 'Recent files (this project)',
    }
  })
end, { desc = '[S]earch [R]ecent files (project, max 10)' })

-- ╭────────────────────────────────────────────╮
-- │  Yank Buffer Protection (KISS Prinzip)    │
-- ╰────────────────────────────────────────────╯

-- Visual mode: Paste without yanking deleted text
-- Protects yank register when pasting over selected text
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste without yank' })

-- Paste from yank-only register (register 0)
-- Use <leader>P to always paste last yanked text, even after delete operations
vim.keymap.set('n', '<leader>P', '"0p', { desc = 'Paste last yank' })
vim.keymap.set('v', '<leader>P', '"0p', { desc = 'Paste last yank' })

-- ╭────────────────────────────────────────────╮
-- │  LSP Navigation                           │
-- ╰────────────────────────────────────────────╯

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { desc = 'Go to type definition' })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to references' })
vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', 'grt', vim.lsp.buf.type_definition, { desc = 'Go to type definition' })
vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
vim.keymap.set('n', 'grr', vim.lsp.buf.references, { desc = 'Go to references' })
vim.keymap.set('n', 'grx', vim.diagnostic.setqflist, { desc = 'Diagnostics quickfix list' })
vim.keymap.set({ 'n', 'x' }, 'gra', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', 'ge', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', 'gE', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', 'gu', vim.lsp.buf.references, { desc = 'Show usages' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })

vim.keymap.set('i', '<Tab>', function()
  local ok, suggestion = pcall(require, 'copilot.suggestion')
  if ok and suggestion.is_visible() then
    suggestion.accept()
    return ''
  end
  return '<Tab>'
end, { expr = true, silent = true, desc = 'Copilot accept or Tab' })

vim.keymap.set('i', '<S-Tab>', function()
  local ok, suggestion = pcall(require, 'copilot.suggestion')
  if ok and suggestion.is_visible() then
    suggestion.prev()
    return ''
  end
  return '<S-Tab>'
end, { expr = true, silent = true, desc = 'Copilot prev or Shift-Tab' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function(args)
    vim.keymap.set('n', '<CR>', function()
      local idx = vim.fn.line('.')
      local info = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1]

      if info and info.loclist == 1 then
        vim.cmd(idx .. 'll')
      else
        vim.cmd(idx .. 'cc')
      end

      pcall(vim.cmd, 'cclose')
      pcall(vim.cmd, 'lclose')
      vim.cmd('only')
    end, { buffer = args.buf, desc = 'Jump and close other windows' })
  end,
})

local function compile_project_with_fallback()
  local root = vim.fs.root(0, { 'mvnw', 'pom.xml', 'gradlew', 'build.gradle.kts', 'build.gradle', '.git' })
    or vim.fn.getcwd()

  local has_file = function(name)
    return vim.fn.filereadable(root .. '/' .. name) == 1
  end

  local candidates = {}
  if has_file('mvnw') then
    table.insert(candidates, { label = 'mvnw', cmd = { './mvnw', '-DskipTests', 'compile' } })
  end
  if has_file('pom.xml') and vim.fn.executable('mvn') == 1 then
    table.insert(candidates, { label = 'mvn', cmd = { 'mvn', '-DskipTests', 'compile' } })
  end
  if has_file('gradlew') then
    table.insert(candidates, { label = 'gradlew', cmd = { './gradlew', 'classes' } })
  end
  if (has_file('build.gradle') or has_file('build.gradle.kts')) and vim.fn.executable('gradle') == 1 then
    table.insert(candidates, { label = 'gradle', cmd = { 'gradle', 'classes' } })
  end

  if #candidates == 0 then
    vim.notify('No supported build setup found (mvnw/pom.xml/gradlew/build.gradle)', vim.log.levels.WARN)
    return
  end

  local function attempt(index, failed)
    if index > #candidates then
      vim.notify('Compile failed: ' .. table.concat(failed, ' -> '), vim.log.levels.ERROR)
      return
    end

    local candidate = candidates[index]
    vim.notify('Compile: ' .. candidate.label, vim.log.levels.INFO)

    vim.system(candidate.cmd, { cwd = root, text = true }, function(result)
      vim.schedule(function()
        if result.code == 0 then
          vim.notify('Compile succeeded via ' .. candidate.label, vim.log.levels.INFO)
          return
        end

        table.insert(failed, candidate.label)
        attempt(index + 1, failed)
      end)
    end)
  end

  attempt(1, {})
end

-- ╭────────────────────────────────────────────╮
-- │  Code Formatting                          │
-- ╰────────────────────────────────────────────╯

-- Match IdeaVim: ,f formats current buffer
vim.keymap.set('n', ',f', function()
  vim.lsp.buf.format({ async = true })
end, { desc = 'Format buffer' })

vim.keymap.set('n', ',i', function()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { 'source.organizeImports' },
      diagnostics = {},
    },
  })
end, { desc = 'Organize imports' })

vim.keymap.set('n', ',c', compile_project_with_fallback, { desc = 'Compile project' })

vim.keymap.set('n', ',se', function()
  vim.diagnostic.open_float(nil, { scope = 'line' })
end, { desc = 'Show line diagnostics' })

-- ╭────────────────────────────────────────────╮
-- │  Git Integration                          │
-- ╰────────────────────────────────────────────╯

-- LazyGit: Terminal UI for Git
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>', { desc = 'LazyGit' })

-- Copilot Chat: minimal toggle
vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChatToggle<CR>', { desc = 'Copilot Chat toggle' })

-- Markdown preview in terminal style
vim.keymap.set('n', '<leader>md', '<cmd>Glow<CR>', { desc = 'Markdown preview' })

-- Terminal in centered modal window (toggle)
local terminal_modal = { win = nil, buf = nil }

local function toggle_terminal_modal()
  if terminal_modal.win and vim.api.nvim_win_is_valid(terminal_modal.win) then
    vim.api.nvim_win_close(terminal_modal.win, true)
    terminal_modal.win = nil
    terminal_modal.buf = nil
    return
  end

  local width = math.floor(vim.o.columns * 0.9)
  local height = math.floor(vim.o.lines * 0.85)
  local row = math.floor((vim.o.lines - height) / 2 - 1)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    border = 'rounded',
    title = ' Terminal ',
    title_pos = 'center',
    style = 'minimal',
  })

  terminal_modal.win = win
  terminal_modal.buf = buf
  vim.bo[buf].bufhidden = 'wipe'

  vim.fn.termopen(vim.o.shell, {
    on_exit = function()
      vim.schedule(function()
        if terminal_modal.win and vim.api.nvim_win_is_valid(terminal_modal.win) then
          vim.api.nvim_win_close(terminal_modal.win, true)
        end
        terminal_modal.win = nil
        terminal_modal.buf = nil
      end)
    end,
  })

  vim.keymap.set('n', 'q', function()
    if terminal_modal.win and vim.api.nvim_win_is_valid(terminal_modal.win) then
      vim.api.nvim_win_close(terminal_modal.win, true)
    end
    terminal_modal.win = nil
    terminal_modal.buf = nil
  end, { buffer = buf, desc = 'Close terminal modal' })

  vim.keymap.set('t', '<C-q>', function()
    if terminal_modal.win and vim.api.nvim_win_is_valid(terminal_modal.win) then
      vim.api.nvim_win_close(terminal_modal.win, true)
    end
    terminal_modal.win = nil
    terminal_modal.buf = nil
  end, { buffer = buf, desc = 'Close terminal modal' })

  vim.cmd('startinsert')
end

vim.keymap.set('n', '<leader>ot', toggle_terminal_modal, { desc = 'Toggle terminal modal' })

-- OpenCode in right-side terminal split
local function open_opencode_split()
  if vim.fn.executable('opencode') ~= 1 then
    vim.notify('opencode not found in PATH', vim.log.levels.ERROR)
    return
  end

  vim.cmd('botright vsplit')
  local win = vim.api.nvim_get_current_win()
  local width = math.min(math.max(math.floor(vim.o.columns * 0.45), 60), math.max(vim.o.columns - 20, 40))
  pcall(vim.api.nvim_win_set_width, win, width)

  vim.cmd('enew')
  local buf = vim.api.nvim_get_current_buf()
  vim.bo[buf].bufhidden = 'wipe'

  vim.fn.termopen({ 'opencode' }, {
    on_exit = function()
      vim.schedule(function()
        if vim.api.nvim_win_is_valid(win) then
          vim.api.nvim_win_close(win, true)
        end
      end)
    end,
  })

  vim.keymap.set('n', 'q', function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, { buffer = buf, desc = 'Close OpenCode' })

  vim.keymap.set('t', '<C-q>', function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, { buffer = buf, desc = 'Close OpenCode' })

  vim.cmd('startinsert')
end

vim.keymap.set('n', '<leader>oc', open_opencode_split, { desc = 'Open OpenCode split' })
