-- ╭─────────────────────────────────────────────────────────╮
-- │  DAP (Debug Adapter Protocol) Configuration             │
-- │  Konsistent mit IdeaVim Debug Keybindings               │
-- ╰─────────────────────────────────────────────────────────╯

local ok_dap, dap = pcall(require, "dap")
if not ok_dap then
  vim.notify("nvim-dap ist nicht geladen", vim.log.levels.WARN)
  return
end

local ok_dapui, dapui = pcall(require, "dapui")
if not ok_dapui then
  vim.notify("nvim-dap-ui ist nicht geladen", vim.log.levels.WARN)
  return
end

-- ═══════════════════════════════════════════════════════════
-- DAP UI Setup
-- ═══════════════════════════════════════════════════════════
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    enabled = true,
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "□",
    },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = "rounded",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
    max_value_lines = 100,
  },
})

-- ═══════════════════════════════════════════════════════════
-- Lua Debugger Configuration
-- ═══════════════════════════════════════════════════════════
dap.adapters["local-lua"] = {
  type = "executable",
  command = "node",
  args = {
    vim.fn.stdpath("data") .. "/mason/packages/local-lua-debugger-vscode/extension/debugAdapter.js"
  },
  enrich_config = function(config, on_config)
    if not config["extensionPath"] then
      local c = vim.deepcopy(config)
      c.extensionPath = vim.fn.stdpath("data") .. "/mason/packages/local-lua-debugger-vscode/"
      on_config(c)
    else
      on_config(config)
    end
  end,
}

dap.configurations.lua = {
  {
    name = "Current file (local-lua-dbg, lua)",
    type = "local-lua",
    request = "launch",
    cwd = "${workspaceFolder}",
    program = {
      lua = "lua",
      file = "${file}",
    },
    args = {},
  },
}

-- ═══════════════════════════════════════════════════════════
-- DAP Keymaps (konsistent mit IdeaVim <leader>d namespace)
-- ═══════════════════════════════════════════════════════════
local keymap_opts = { noremap = true, silent = true }

-- <leader>db: Toggle Breakpoint (IDENTISCH zu IdeaVim)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint,
  vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: Toggle [B]reakpoint" }))

-- <leader>dB: Conditional Breakpoint
vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: Conditional [B]reakpoint" }))

-- <leader>dc: Start/Continue Debugging (ÄHNLICH zu IdeaVim "Choose Debug Config")
vim.keymap.set("n", "<leader>dc", dap.continue,
  vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: Start/[C]ontinue" }))

-- <leader>dr: Resume/Continue (IDENTISCH zu IdeaVim)
vim.keymap.set("n", "<leader>dr", dap.continue,
  vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: [R]esume/Continue" }))

-- <leader>do: Step Over (IDENTISCH zu IdeaVim)
vim.keymap.set("n", "<leader>do", dap.step_over,
  vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: Step [O]ver" }))

-- <leader>di: Step Into (IDENTISCH zu IdeaVim)
vim.keymap.set("n", "<leader>di", dap.step_into,
  vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: Step [I]nto" }))

-- <leader>dt: Step Out (IDENTISCH zu IdeaVim)
vim.keymap.set("n", "<leader>dt", dap.step_out,
  vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: Step Ou[t]" }))

-- <leader>ds: Stop (IDENTISCH zu IdeaVim)
vim.keymap.set("n", "<leader>ds", dap.terminate,
  vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: [S]top/Terminate" }))

-- <leader>du: Toggle UI
vim.keymap.set("n", "<leader>du", dapui.toggle,
  vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: Toggle [U]I" }))

-- <leader>de: Evaluate Expression
vim.keymap.set("n", "<leader>de", dapui.eval,
  vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: [E]valuate expression" }))
vim.keymap.set("v", "<leader>de", dapui.eval,
  vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: [E]valuate selection" }))

-- <leader>dh: Hover (show value)
vim.keymap.set("n", "<leader>dh", function()
  require("dap.ui.widgets").hover()
end, vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: [H]over value" }))

-- <leader>dp: Preview (show value in floating window)
vim.keymap.set("n", "<leader>dp", function()
  require("dap.ui.widgets").preview()
end, vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: [P]review value" }))

-- <leader>df: Show frames
vim.keymap.set("n", "<leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end, vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: Show [F]rames" }))

-- <leader>dv: Show scopes
vim.keymap.set("n", "<leader>dv", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end, vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: Show [V]ariables/Scopes" }))

-- <leader>dR: Run to cursor
vim.keymap.set("n", "<leader>dR", dap.run_to_cursor,
  vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: [R]un to cursor" }))

-- <leader>dL: Run last configuration
vim.keymap.set("n", "<leader>dL", dap.run_last,
  vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: Run [L]ast configuration" }))

-- REPL
vim.keymap.set("n", "<leader>dq", dap.repl.toggle,
  vim.tbl_extend("force", keymap_opts, { desc = "[D]ebug: Toggle REPL" }))

-- ═══════════════════════════════════════════════════════════
-- Auto-open/close DAP UI
-- ═══════════════════════════════════════════════════════════
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
  vim.notify("Debugging session started", vim.log.levels.INFO)
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
  vim.notify("Debugging session terminated", vim.log.levels.INFO)
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
  vim.notify("Debugging session exited", vim.log.levels.INFO)
end

-- ═══════════════════════════════════════════════════════════
-- DAP Signs (Breakpoint indicators in gutter)
-- ═══════════════════════════════════════════════════════════
vim.fn.sign_define("DapBreakpoint", {
  text = "●",
  texthl = "DapBreakpoint",
  linehl = "",
  numhl = ""
})

vim.fn.sign_define("DapBreakpointCondition", {
  text = "◆",
  texthl = "DapBreakpointCondition",
  linehl = "",
  numhl = ""
})

vim.fn.sign_define("DapLogPoint", {
  text = "◆",
  texthl = "DapLogPoint",
  linehl = "",
  numhl = ""
})

vim.fn.sign_define("DapStopped", {
  text = "▶",
  texthl = "DapStopped",
  linehl = "DapStoppedLine",
  numhl = ""
})

vim.fn.sign_define("DapBreakpointRejected", {
  text = "✘",
  texthl = "DapBreakpointRejected",
  linehl = "",
  numhl = ""
})

-- ═══════════════════════════════════════════════════════════
-- DAP Highlight Groups
-- ═══════════════════════════════════════════════════════════
vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e51400" })
vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#ffa500" })
vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61afef" })
vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379" })
vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#e06c75" })
