return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
        { "<leader>pf", "<cmd>Telescope find_files<CR>", desc = "Find project files" },
        { "<C-p>", "<cmd>Telescope git_files<CR>", desc = "Find git files" },
        { "<leader>ps", "<cmd>Telescope live_grep<CR>", desc = "Live grep search" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find help tags" },
        { "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
    },
    opts = {
        defaults = {
            prompt_prefix = "   ",
            selection_caret = "  ",
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    preview_width = 0.55,
                },
            },
        },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        pcall(telescope.load_extension, "fzf")
    end,
}
