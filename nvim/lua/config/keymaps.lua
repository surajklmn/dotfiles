local keymap = vim.keymap

-- File explorer (Netrw)
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw explorer" })

-- Move visual selection up/down with automatic indent
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down", silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up", silent = true })

-- Keep cursor in place when joining lines
keymap.set("n", "J", "mzJ`z", { desc = "Join line keeping cursor position" })

-- Half-page jumps keeping cursor centered
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down centered" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up centered" })

-- Keep search matches centered
keymap.set("n", "n", "nzzzv", { desc = "Next search match centered" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search match centered" })

-- Paste over selection without replacing clipboard contents with replaced text
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without losing register" })

-- Yank to system clipboard explicitly
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

-- Delete to void register (doesn't overwrite clipboard)
keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to black hole register" })

-- Quick search & replace word under cursor
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search & replace word" })

-- Make current file executable
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make file executable", silent = true })

-- Window navigation shortcuts
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Clear search highlight on ESC
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
