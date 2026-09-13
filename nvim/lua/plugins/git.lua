return {
    -- Fugitive for full git workflow inside vim
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "G" },
        keys = {
            { "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
        },
    },

    -- Gitsigns for gutter indicators and hunk actions
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation between hunks
                map("n", "]c", function()
                    if vim.wo.diff then return "]c" end
                    vim.schedule(function() gs.next_hunk() end)
                    return "<Ignore>"
                end, { expr = true, desc = "Next Git hunk" })

                map("n", "[c", function()
                    if vim.wo.diff then return "[c" end
                    vim.schedule(function() gs.prev_hunk() end)
                    return "<Ignore>"
                end, { expr = true, desc = "Previous Git hunk" })

                -- Actions
                map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, { desc = "Git blame line" })
                map("n", "<leader>gp", gs.preview_hunk, { desc = "Git preview hunk" })
                map("n", "<leader>gr", gs.reset_hunk, { desc = "Git reset hunk" })
            end,
        },
    },
}
