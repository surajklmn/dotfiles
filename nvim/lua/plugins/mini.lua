return {
    {
        "echasnovski/mini.nvim",
        version = false,
        event = "VeryLazy",
        config = function()
            -- 1. Icons (fast Nerd Font icon provider)
            require("mini.icons").setup()

            -- 2. Visual Tabs across the top (fast, lightweight bufferline)
            require("mini.tabline").setup({
                show_icons = true,
            })
            vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer tab" })
            vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer tab" })
            vim.keymap.set("n", "<leader>bc", "<cmd>bdelete<CR>", { desc = "Close active buffer" })

            -- 3. Statusline (Tokyo Night styled status bar)
            require("mini.statusline").setup({
                use_icons = true,
                set_vim_settings = false,
            })

            -- 4. File Explorer (modern column navigation & in-place editing)
            local minifiles = require("mini.files")
            minifiles.setup({
                windows = {
                    preview = true,
                    width_focus = 30,
                    width_preview = 45,
                },
                options = {
                    use_as_default_explorer = true,
                },
            })
            local toggle_files = function()
                if not minifiles.close() then
                    minifiles.open(vim.api.nvim_buf_get_name(0), true)
                end
            end
            vim.keymap.set("n", "<leader>pv", toggle_files, { desc = "Open Mini.Files explorer" })
            vim.keymap.set("n", "<leader>e", toggle_files, { desc = "Open Mini.Files explorer" })

            -- 5. Autopairs (automatic brackets & quotes)
            require("mini.pairs").setup()

            -- 6. Surround (sa = add, sd = delete, sr = replace surround)
            require("mini.surround").setup()

            -- 7. Git Diff in gutter (live additions, changes, deletions)
            local diff = require("mini.diff")
            diff.setup({
                view = {
                    style = "sign",
                    signs = { add = "▎", change = "▎", delete = "" },
                },
            })
            vim.keymap.set("n", "]c", function() diff.goto_hunk("next") end, { desc = "Next Git hunk" })
            vim.keymap.set("n", "[c", function() diff.goto_hunk("prev") end, { desc = "Previous Git hunk" })

            -- 8. Indent Scope (subtle active block line)
            require("mini.indentscope").setup({
                symbol = "│",
                options = { try_as_border = true },
            })

            -- 9. Better Text Objects (around/inside function, args, quotes)
            require("mini.ai").setup({ n_lines = 500 })
        end,
    },

    -- Visual Undo History tree (<leader>u)
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" },
        },
    },
}
