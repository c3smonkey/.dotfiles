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

-- Lexplore (native Netrw) - toggle
vim.keymap.set('n', '<leader>e', function()
  local lexplore_win = nil
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_buf_get_option(buf, 'filetype') == 'netrw' then
      lexplore_win = win
      break
    end
  end
  if lexplore_win then
    vim.api.nvim_win_close(lexplore_win, true)
  else
    vim.cmd('Lexplore!')
    vim.cmd('30wincmd |')
  end
end)

-- mini.files (overlay file explorer) - toggle
vim.keymap.set('n', '<leader>f', function()
  local MiniFiles = require('mini.files')
  local is_open = false
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, 'filetype') == 'minifiles' then
      is_open = true
      break
    end
  end
  if is_open then
    MiniFiles.close()
  else
    local bufname = vim.api.nvim_buf_get_name(0)
    local path = bufname ~= '' and vim.fn.fnamemodify(bufname, ':p:h') or vim.fn.getcwd()
    MiniFiles.open(path, true)
  end
end)

-- Yazi - file manager
vim.keymap.set('n', '<leader>y', '<cmd>Yazi<CR>')

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
  local cwd = vim.fn.getcwd()
  local cmd = 'cd ' .. vim.fn.shellescape(cwd) .. ' && rg --files --hidden --glob "!.git"'
  local files = vim.fn.systemlist(cmd)
  if vim.v.shell_error ~= 0 then
    vim.notify('ripgrep (rg) not found or failed', vim.log.levels.WARN)
    return
  end
  if #files == 0 then
    vim.notify('No files found (rg)', vim.log.levels.INFO)
    return
  end
  require('mini.pick').start({
    source = {
      items = files,
      name = 'Files (rg)',
    },
  })
end, { desc = '[S]earch [F]iles (rg)' })

vim.keymap.set('n', '<leader>sb', function()
  require('mini.pick').builtin.buffers()
end, { desc = '[S]earch [B]uffers' })

-- Search Kotlin/Java Classes (production + test)
vim.keymap.set('n', '<leader>sc', function()
  local cwd = vim.fn.getcwd()
  
  -- Simpler ripgrep: find any line with class/interface/enum/object keyword
  -- Use -g for glob patterns, --hidden to search in .config and other hidden dirs
  local cmd = string.format(
    'cd %s && rg -g "*.kt" -g "*.java" -n ' ..
    '"\\b(class|interface|enum|object)\\s+\\w+" ' ..
    '--no-heading --color=never --hidden --glob "!.git" 2>/dev/null',
    vim.fn.shellescape(cwd)
  )
  
  local results = vim.fn.systemlist(cmd)
  
  if vim.v.shell_error ~= 0 or #results == 0 then
    vim.notify('No classes found', vim.log.levels.INFO)
    return
  end
  
  -- Parse ripgrep output: file:line:content
  -- Format for display: ClassName (file:line)
  local items = {}
  local seen = {}  -- Dedup by class name
  
  for _, line in ipairs(results) do
    local file, line_num, content = line:match('^(.+):(%d+):(.*)')
    if file and line_num and content then
      -- Extract class name (word after class/interface/enum/object)
      local class_name = content:match('class%s+([%w_]+)') 
                      or content:match('interface%s+([%w_]+)')
                      or content:match('enum%s+([%w_]+)')
                      or content:match('object%s+([%w_]+)')
      
      if class_name and not seen[class_name] then
        seen[class_name] = true
        -- Embed full file path in display string for parsing in choose callback
        table.insert(items, string.format('%-40s (%s:%s)', class_name, file, line_num))
      end
    end
  end
  
  if #items == 0 then
    vim.notify('No classes found', vim.log.levels.INFO)
    return
  end
  
  table.sort(items)
  
  require('mini.pick').start({
    source = {
      items = items,
      name = 'Classes',
      choose = function(selected)
        if selected then
          -- Parse: "ClassName (file:line)" → extract file and line
          local file, line = selected:match('%((.+):(%d+)%)')
          if file and line then
            -- Defer to next tick so mini.pick closes first
            vim.schedule(function()
              vim.cmd('edit ' .. vim.fn.fnameescape(file))
              vim.api.nvim_win_set_cursor(0, {tonumber(line), 0})
              vim.cmd('normal! zz')  -- Center line
            end)
          end
        end
      end,
    },
  })
end, { desc = '[S]earch [C]lass' })

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

-- Search Keymaps
vim.keymap.set('n', '<leader>sk', function()
  local keymaps = {}
  
  -- Collect keymaps from all modes
  for _, mode in ipairs({'n', 'i', 'v', 'x', 't', 'o', 'c'}) do
    local maps = vim.api.nvim_get_keymap(mode)
    for _, map in ipairs(maps) do
      local desc = map.desc or map.rhs or '(no description)'
      local lhs = map.lhs:gsub('%s', '<Space>')  -- Make spaces visible
      table.insert(keymaps, string.format('[%s] %-20s → %s', mode, lhs, desc))
    end
  end
  
  -- Also get buffer-local keymaps
  local buf_maps = vim.api.nvim_buf_get_keymap(0, 'n')
  for _, map in ipairs(buf_maps) do
    local desc = map.desc or map.rhs or '(no description)'
    local lhs = map.lhs:gsub('%s', '<Space>')
    table.insert(keymaps, string.format('[n-buf] %-20s → %s', lhs, desc))
  end
  
  if #keymaps == 0 then
    vim.notify('No keymaps found', vim.log.levels.INFO)
    return
  end
  
  require('mini.pick').start({
    source = {
      items = keymaps,
      name = 'Keymaps',
    },
  })
end, { desc = '[S]earch [K]eymaps' })

-- Search Commands
vim.keymap.set('n', '<leader>sC', function()
  local commands = vim.api.nvim_get_commands({})
  local items = {}
  
  for name, details in pairs(commands) do
    local desc = details.definition or details.script_id or '(user command)'
    table.insert(items, string.format('%-30s → %s', name, desc))
  end
  
  table.sort(items)
  
  if #items == 0 then
    vim.notify('No commands found', vim.log.levels.INFO)
    return
  end
  
  require('mini.pick').start({
    source = {
      items = items,
      name = 'Commands',
    },
  })
end, { desc = '[S]earch [C]ommands' })

-- Search Registers
vim.keymap.set('n', '<leader>sR', function()
  local registers = {}
  
  -- Common registers to show
  local reg_list = {
    '"', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
    '+', '*', '/', '-', ':', '.', '%', '#', '='
  }
  
  for _, reg in ipairs(reg_list) do
    local ok, content = pcall(vim.fn.getreg, reg)
    if ok and content and content ~= '' then
      -- Limit preview to first 100 chars, replace newlines with ↵
      local preview = content:gsub('\n', '↵'):sub(1, 100)
      if #content > 100 then preview = preview .. '...' end
      table.insert(registers, {
        register = reg,
        content = content,
        display = string.format('["%s] %s', reg, preview)
      })
    end
  end
  
  if #registers == 0 then
    vim.notify('No registers with content found', vim.log.levels.INFO)
    return
  end
  
  local items = vim.tbl_map(function(r) return r.display end, registers)
  
  require('mini.pick').start({
    source = {
      items = items,
      name = 'Registers',
      choose = function(selected)
        if selected then
          -- Extract register name from selection
          local reg = selected:match('%[\"(.-)%]')
          if reg then
            -- Paste the register content
            vim.cmd('normal! "' .. reg .. 'p')
            vim.notify('Pasted from register "' .. reg, vim.log.levels.INFO)
          end
        end
      end,
    },
  })
end, { desc = '[S]earch [R]egisters' })

-- Search Word (word under cursor)
vim.keymap.set('n', '<leader>sw', function()
  local word = vim.fn.expand('<cword>')
  
  if word == '' then
    vim.notify('No word under cursor', vim.log.levels.WARN)
    return
  end
  
  local cwd = vim.fn.getcwd()
  -- Use ripgrep to search for the word
  local cmd = string.format('cd %s && rg --line-number --column --no-heading --color=never --hidden --glob "!.git" -- %s',
    vim.fn.shellescape(cwd),
    vim.fn.shellescape(word))
  
  local results = vim.fn.systemlist(cmd)
  
  if vim.v.shell_error ~= 0 or #results == 0 then
    vim.notify('No matches found for: ' .. word, vim.log.levels.INFO)
    return
  end
  
  require('mini.pick').start({
    source = {
      items = results,
      name = 'Search: ' .. word,
      choose = function(selected)
        if selected then
          -- Parse ripgrep output: filename:line:column:text
          local file, line, col = selected:match('^(.+):(%d+):(%d+):')
          if file and line then
            vim.cmd('edit ' .. vim.fn.fnameescape(file))
            vim.api.nvim_win_set_cursor(0, {tonumber(line), tonumber(col) - 1})
            vim.cmd('normal! zz')  -- Center the line
          end
        end
      end,
    },
  })
end, { desc = '[S]earch [W]ord under cursor' })

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
-- │  Spring Boot Run (Kotlin)                 │
-- ╰────────────────────────────────────────────╯

-- State tracking for running Spring Boot apps
local spring_boot_state = {
  terminal_buf = nil,
  terminal_win = nil,
  job_id = nil,
  root = nil,
  module = nil,
}

-- Run Spring Boot application (auto-detect Gradle/Maven)
local function run_spring_boot(module_path)
  -- Find project root
  local root = vim.fs.root(0, { 
    'mvnw', 'pom.xml', 
    'gradlew', 'build.gradle.kts', 'build.gradle',
    'settings.gradle.kts', 'settings.gradle',
    '.git' 
  }) or vim.fn.getcwd()

  local has_file = function(name)
    return vim.fn.filereadable(root .. '/' .. name) == 1
  end

  -- Detect build tool and construct command
  local candidates = {}
  
  -- Module-specific bootRun task
  local module_task = module_path and (':' .. module_path .. ':bootRun') or 'bootRun'
  
  if has_file('gradlew') then
    table.insert(candidates, { 
      label = 'gradlew', 
      cmd = './gradlew ' .. module_task 
    })
  end
  if (has_file('build.gradle') or has_file('build.gradle.kts')) and vim.fn.executable('gradle') == 1 then
    table.insert(candidates, { 
      label = 'gradle', 
      cmd = 'gradle ' .. module_task 
    })
  end
  -- Prefer system mvn over mvnw (mvnw may be corrupted in corporate networks)
  if has_file('pom.xml') and vim.fn.executable('mvn') == 1 then
    local mvn_module = module_path and ('-pl ' .. module_path .. ' ') or ''
    table.insert(candidates, { 
      label = 'mvn', 
      cmd = 'mvn ' .. mvn_module .. 'spring-boot:run' 
    })
  end
  if has_file('mvnw') then
    local mvn_module = module_path and ('-pl ' .. module_path .. ' ') or ''
    table.insert(candidates, { 
      label = 'mvnw', 
      cmd = './mvnw ' .. mvn_module .. 'spring-boot:run' 
    })
  end

  if #candidates == 0 then
    vim.notify('No build tool found (gradlew/mvnw)', vim.log.levels.WARN)
    return
  end

  -- Use first available build tool
  local candidate = candidates[1]
  local cmd = candidate.cmd
  
  -- Warn if using mvn fallback (mvnw might be corrupted)
  if candidate.label == 'mvn' and has_file('mvnw') then
    vim.notify(
      'Maven wrapper found but using system mvn\n' ..
      'If mvnw is corrupted, fix with: mvn wrapper:wrapper',
      vim.log.levels.WARN
    )
  end
  
  vim.notify('Starting Spring Boot via ' .. candidate.label .. '...', vim.log.levels.INFO)

  -- Open terminal in bottom split (30% height)
  vim.cmd('botright split')
  local height = math.floor(vim.o.lines * 0.3)
  vim.cmd('resize ' .. height)
  
  -- Start Spring Boot in terminal
  local full_cmd = 'cd ' .. vim.fn.shellescape(root) .. ' && ' .. cmd
  vim.cmd('terminal ' .. full_cmd)
  
  -- Track state
  spring_boot_state.terminal_buf = vim.api.nvim_get_current_buf()
  spring_boot_state.terminal_win = vim.api.nvim_get_current_win()
  spring_boot_state.job_id = vim.b.terminal_job_id
  spring_boot_state.root = root
  spring_boot_state.module = module_path
  
  -- Enter insert mode to see logs
  vim.cmd('startinsert')
  
  vim.notify('Spring Boot started. Press Ctrl-C to stop, q to close terminal', vim.log.levels.INFO)
end

-- Stop running Spring Boot application
local function stop_spring_boot()
  if spring_boot_state.job_id then
    -- Send SIGTERM to job
    vim.fn.jobstop(spring_boot_state.job_id)
    vim.notify('Spring Boot stopped', vim.log.levels.INFO)
    
    -- Clear state
    spring_boot_state = {
      terminal_buf = nil,
      terminal_win = nil,
      job_id = nil,
      root = nil,
      module = nil,
    }
  else
    vim.notify('No running Spring Boot application found', vim.log.levels.WARN)
  end
end

-- Detect Spring Boot modules in multi-module projects
local function detect_spring_boot_modules()
  local root = vim.fs.root(0, { 
    'settings.gradle.kts', 'settings.gradle',
    'pom.xml', '.git' 
  }) or vim.fn.getcwd()

  local modules = {}
  
  -- Try Gradle settings.gradle.kts first
  local settings_gradle_kts = root .. '/settings.gradle.kts'
  local settings_gradle = root .. '/settings.gradle'
  
  if vim.fn.filereadable(settings_gradle_kts) == 1 then
    local content = vim.fn.readfile(settings_gradle_kts)
    for _, line in ipairs(content) do
      -- Match: include("module-name") or include(":module-name")
      local module = line:match('include%(["\'][:]*([^"\']+)["\']%)')
      if module then
        table.insert(modules, module)
      end
    end
  elseif vim.fn.filereadable(settings_gradle) == 1 then
    local content = vim.fn.readfile(settings_gradle)
    for _, line in ipairs(content) do
      local module = line:match('include%(["\'][:]*([^"\']+)["\']%)')
      if module then
        table.insert(modules, module)
      end
    end
  end
  
  -- Fallback: scan for directories with build.gradle.kts
  if #modules == 0 then
    local subdirs = vim.fn.globpath(root, '*/', 0, 1)
    for _, dir in ipairs(subdirs) do
      if vim.fn.filereadable(dir .. 'build.gradle.kts') == 1 or 
         vim.fn.filereadable(dir .. 'build.gradle') == 1 then
        local module_name = vim.fn.fnamemodify(dir, ':h:t')
        table.insert(modules, module_name)
      end
    end
  end
  
  return modules
end

-- Choose and run Spring Boot module (interactive)
local function choose_and_run_module()
  local modules = detect_spring_boot_modules()
  
  if #modules == 0 then
    -- No modules found, run from root
    vim.notify('No modules detected, running from root', vim.log.levels.INFO)
    run_spring_boot(nil)
  elseif #modules == 1 then
    -- Only one module, run it directly
    vim.notify('Running module: ' .. modules[1], vim.log.levels.INFO)
    run_spring_boot(modules[1])
  else
    -- Multiple modules, let user choose with mini.pick
    require('mini.pick').start({
      source = {
        items = modules,
        name = 'Spring Boot Modules',
      },
      choose = function(selected)
        if selected then
          vim.notify('Running module: ' .. selected, vim.log.levels.INFO)
          run_spring_boot(selected)
        end
      end,
    })
  end
end

-- Keymaps (match IdeaVim ,rr, ,rs, ,R)
vim.keymap.set('n', ',rr', run_spring_boot, { desc = 'Run Spring Boot' })
vim.keymap.set('n', ',rs', stop_spring_boot, { desc = 'Stop Spring Boot' })
vim.keymap.set('n', ',R', choose_and_run_module, { desc = 'Run Spring Boot (choose module)' })

-- ╭────────────────────────────────────────────╮
-- │  Spring Boot Testing (JUnit)              │
-- ╰────────────────────────────────────────────╯

-- Test state tracking (for rerun)
local test_state = {
  last_test_cmd = nil,
  last_test_root = nil,
}

-- Test terminal state (for reuse - avoid creating multiple terminals)
local test_terminal_state = {
  buf = nil,
  win = nil,
  job_id = nil,
}

-- Helper: Run command in reusable test terminal
local function run_in_test_terminal(cmd, root)
  local full_cmd = 'cd ' .. vim.fn.shellescape(root) .. ' && ' .. cmd
  
  -- Check if terminal exists and is valid
  if test_terminal_state.buf and 
     vim.api.nvim_buf_is_valid(test_terminal_state.buf) and
     test_terminal_state.job_id then
    
    -- Terminal exists, check if window is open
    if test_terminal_state.win and vim.api.nvim_win_is_valid(test_terminal_state.win) then
      -- Window open, focus it
      vim.api.nvim_set_current_win(test_terminal_state.win)
    else
      -- Window closed, reopen buffer in split
      vim.cmd('botright split')
      local height = math.floor(vim.o.lines * 0.3)
      vim.cmd('resize ' .. height)
      vim.cmd('buffer ' .. test_terminal_state.buf)
      test_terminal_state.win = vim.api.nvim_get_current_win()
    end
    
    -- Clear terminal and send new command
    vim.fn.chansend(test_terminal_state.job_id, 'clear\n')
    vim.fn.chansend(test_terminal_state.job_id, full_cmd .. '\n')
  else
    -- Terminal doesn't exist, create new one
    vim.cmd('botright split')
    local height = math.floor(vim.o.lines * 0.3)
    vim.cmd('resize ' .. height)
    vim.cmd('terminal ' .. full_cmd)
    
    -- Track state
    test_terminal_state.buf = vim.api.nvim_get_current_buf()
    test_terminal_state.win = vim.api.nvim_get_current_win()
    test_terminal_state.job_id = vim.b.terminal_job_id
  end
  
  -- Enter insert mode to see output
  vim.cmd('startinsert')
end

-- Detect test context (class + method) under cursor
local function detect_test_context()
  local bufnr = vim.api.nvim_get_current_buf()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local cursor_line = cursor[1]
  
  -- 1. Extract package from file (search top 50 lines)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 50, false)
  local package_name = nil
  for _, line in ipairs(lines) do
    local pkg = line:match('^package%s+([%w%.]+)')
    if pkg then
      package_name = pkg
      break
    end
  end
  
  -- 2. Find class name (search backward from cursor)
  local class_name = nil
  for i = cursor_line - 1, 1, -1 do
    local line = vim.api.nvim_buf_get_lines(bufnr, i - 1, i, false)[1]
    -- Kotlin: class MyTest or class MyTest : BaseTest
    -- Java: public class MyTest
    local name = line:match('^%s*class%s+(%w+)') or line:match('^%s*public%s+class%s+(%w+)')
    if name then
      class_name = name
      break
    end
  end
  
  -- 3. Find test method name (search upward for @Test + fun/void methodName)
  local method_name = nil
  local found_test_annotation = false
  for i = cursor_line, 1, -1 do
    local line = vim.api.nvim_buf_get_lines(bufnr, i - 1, i, false)[1]
    
    -- Check for JUnit test annotations
    if line:match('@Test') or line:match('@ParameterizedTest') or line:match('@RepeatedTest') then
      found_test_annotation = true
    end
    
    -- Check for method declaration after @Test
    if found_test_annotation then
      -- Kotlin: fun methodName() or fun `method name with spaces`()
      -- Java: void methodName() or public void methodName()
      local method = line:match('fun%s+`?([%w_]+)`?%s*%(') 
                  or line:match('void%s+(%w+)%s*%(')
      if method then
        method_name = method
        break
      end
    end
    
    -- Stop if we hit another method or class (we've gone too far)
    if line:match('^%s*class%s+') or (line:match('^%s*fun%s+') and not found_test_annotation) then
      break
    end
  end
  
  -- 4. Construct full qualified name
  if not class_name then
    vim.notify('Could not detect test class', vim.log.levels.WARN)
    return nil
  end
  
  local full_class_name = package_name and (package_name .. '.' .. class_name) or class_name
  
  return {
    class = full_class_name,
    method = method_name, -- nil if not found (will run entire class)
  }
end

-- Run test with Gradle/Maven
local function run_test(context, run_type)
  if not context then return end
  
  local root = vim.fs.root(0, { 
    'gradlew', 'build.gradle.kts', 'build.gradle',
    'mvnw', 'pom.xml', '.git' 
  }) or vim.fn.getcwd()

  local has_file = function(name)
    return vim.fn.filereadable(root .. '/' .. name) == 1
  end

  -- Build test command
  local candidates = {}
  
  -- Gradle commands
  if has_file('gradlew') then
    local test_filter = context.class
    if run_type == 'method' and context.method then
      test_filter = test_filter .. '.' .. context.method
    end
    table.insert(candidates, { 
      label = 'gradlew', 
      cmd = './gradlew test --tests ' .. vim.fn.shellescape(test_filter)
    })
  end
  if (has_file('build.gradle') or has_file('build.gradle.kts')) and vim.fn.executable('gradle') == 1 then
    local test_filter = context.class
    if run_type == 'method' and context.method then
      test_filter = test_filter .. '.' .. context.method
    end
    table.insert(candidates, { 
      label = 'gradle', 
      cmd = 'gradle test --tests ' .. vim.fn.shellescape(test_filter)
    })
  end
  
  -- Maven commands (prefer system mvn over mvnw)
  -- Use test-compile + surefire:test to resolve @{argLine} and skip main compile
  -- Skip heavy plugins (ktlint, jacoco, dependency unpack) for speed
  if has_file('pom.xml') and vim.fn.executable('mvn') == 1 then
    local test_filter = context.class
    if run_type == 'method' and context.method then
      test_filter = test_filter .. '#' .. context.method
    end
    table.insert(candidates, { 
      label = 'mvn', 
      cmd = 'mvn test-compile surefire:test ' ..
            '-Dktlint.skip=true ' ..
            '-Djacoco.skip=true ' ..
            '-Dmaven.gitcommitid.skip=true ' ..
            '-Dasciidoctor.skip=true ' ..
            '-Dtest=' .. vim.fn.shellescape(test_filter)
    })
  end
  if has_file('mvnw') then
    local test_filter = context.class
    if run_type == 'method' and context.method then
      test_filter = test_filter .. '#' .. context.method
    end
    table.insert(candidates, { 
      label = 'mvnw', 
      cmd = './mvnw test-compile surefire:test ' ..
            '-Dktlint.skip=true ' ..
            '-Djacoco.skip=true ' ..
            '-Dmaven.gitcommitid.skip=true ' ..
            '-Dasciidoctor.skip=true ' ..
            '-Dtest=' .. vim.fn.shellescape(test_filter)
    })
  end

  if #candidates == 0 then
    vim.notify('No build tool found (gradlew/mvnw)', vim.log.levels.WARN)
    return
  end

  -- Use first available build tool
  local candidate = candidates[1]
  local cmd = candidate.cmd
  
  -- Warn if using mvn fallback (mvnw might be corrupted)
  if candidate.label == 'mvn' and has_file('mvnw') then
    vim.notify(
      'Maven wrapper found but using system mvn\n' ..
      'If mvnw is corrupted, fix with: mvn wrapper:wrapper',
      vim.log.levels.WARN
    )
  end
  
  local test_desc = run_type == 'method' and 'test method' or 'test class'
  vim.notify('Running ' .. test_desc .. ' via ' .. candidate.label .. '...', vim.log.levels.INFO)

  -- Run in reusable test terminal
  run_in_test_terminal(cmd, root)
  
  -- Track for rerun
  test_state.last_test_cmd = cmd
  test_state.last_test_root = root
end

-- Run test method under cursor
local function run_test_method()
  local context = detect_test_context()
  if not context then return end
  
  if not context.method then
    vim.notify('No @Test method found under cursor. Use ,T to run entire class', vim.log.levels.WARN)
    return
  end
  
  run_test(context, 'method')
end

-- Run entire test class
local function run_test_class()
  local context = detect_test_context()
  if not context then return end
  
  run_test(context, 'class')
end

-- Rerun last test
local function rerun_last_test()
  if not test_state.last_test_cmd then
    vim.notify('No previous test to rerun', vim.log.levels.WARN)
    return
  end
  
  vim.notify('Rerunning last test...', vim.log.levels.INFO)
  
  -- Run in reusable test terminal
  run_in_test_terminal(test_state.last_test_cmd, test_state.last_test_root)
end

-- Keymaps (match IdeaVim ,t, ,T, ,rf)
vim.keymap.set('n', ',t', run_test_method, { desc = 'Run test method' })
vim.keymap.set('n', ',T', run_test_class, { desc = 'Run test class' })
vim.keymap.set('n', ',rf', rerun_last_test, { desc = 'Rerun last test' })

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
