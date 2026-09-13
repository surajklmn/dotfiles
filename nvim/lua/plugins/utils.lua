return {
    -- Auto pairs for brackets, quotes, etc.
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            check_ts = true,
        },
    },

    -- Surround text objects with quotes, brackets, tags: ys, cs, ds
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {},
    },

    -- Detect tabstop and shiftwidth automatically
    {
        "tpope/vim-sleuth",
    },

    -- Discord Rich Presence
    {
        "andweeb/presence.nvim",
        event = "VeryLazy",
        opts = {
            main_image = "file",
            neovim_image_text = "Neovim (Tokyo Night)",
            enable_line_number = true,
        },
    },
}
