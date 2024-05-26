require("config.c3s.globals")

local plugin = "nvim-dap"

if Is_Enabled(plugin) then
    Keymap("n", "<leader>dU", [[<cmd>lua require("dapui").toggle()<cr>]], { desc = "[d]ebug toggle [U]I" })
    Keymap("n", "<leader>db", [[<cmd>lua require("dap").step_back()<cr>]], { desc = "[d]ebug [b]ack" })
    Keymap("n", "<leader>dc", [[<cmd>lua require("dap").continue()<cr>]], { desc = "[d]ebug [c]ontinue" })
    Keymap("n", "<leader>dd", [[<cmd>lua require("dap").disconnect()<cr>]], { desc = "[d]ebug [d]isconnect" })
    Keymap("n", "<leader>dg", [[<cmd>lua require("dap").session()<cr>]], { desc = "[d]ebug [g]et session" })
    Keymap("n", "<leader>di", [[<cmd>lua require("dap").step_into()<cr>]], { desc = "[d]ebug [i]nto" })
    Keymap("n", "<leader>do", [[<cmd>lua require("dap").step_over()<cr>]], { desc = "[d]ebug [o]ver" })
    Keymap("n", "<leader>dp", [[<cmd>lua require("dap").pause()<cr>]], { desc = "[d]ebug [p]ause" })
    Keymap("n", "<leader>dq", [[<cmd>lua require("dap").close()<cr>]], { desc = "[d]ebug [q]uit" })
    Keymap("n", "<leader>dS", [[<cmd>lua require("dap").continue()<cr>]], { desc = "[d]ebug [S]tart" })
    Keymap("n", "<leader>dr", [[<cmd>lua require("dap").repl.toggle()<cr>]], { desc = "[d]ebug [r]epl" })
    Keymap("n", "<leader>dt", [[<cmd>lua require("dap").toggle_breakpoint()<cr>]], { desc = "[d]ebug [t]oggle breakpoint" })
end

return {
    "mfussenegger/" .. plugin,
    enabled = Is_Enabled(plugin),
    event = Constants.file_types,
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
        "leoluz/nvim-dap-go",
        "fwcd/kotlin-debug-adapter",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("mason-nvim-dap").setup({
            automatic_setup = true,
            handlers = {},
            ensure_installed = {
                "delve",
                "kotlin",
            },
        })

        vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
        vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
        vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
        vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
        vim.keymap.set("n", "<leader>dB", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "[d]ebug: Set [B]reakpoint" })

        vim.keymap.set("n", "<leader>dC", function()
            dap.clear_breakpoints()
        end, { desc = "[d]ebug: [C]lear breakpoint" })

        dapui.setup({
            icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
            controls = {
                icons = {
                    pause = "⏸",
                    play = "▶",
                    step_into = "⏎",
                    step_over = "⏭",
                    step_out = "⏮",
                    step_back = "b",
                    run_last = "▶▶",
                    terminate = "⏹",
                    disconnect = "⏏",
                },
            },
        })

        vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

        dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close

        require("dap-go").setup()
        require("dap").defaults.kotlin.auto_continue_if_many_stopped = false
    end,
}
