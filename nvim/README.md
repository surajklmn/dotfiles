# 🌙 Tokyo Night Neovim (Powered by mini.nvim)

A clean, unified, and blazing-fast **Neovim (v0.10+)** configuration built on **[lazy.nvim](https://github.com/folke/lazy.nvim)**, **[mini.nvim](https://github.com/echasnovski/mini.nvim)**, and styled with the **Tokyo Night** color scheme.

Instead of stitching together dozens of plugins from different authors, the entire UI and editing suite is powered by **`mini.nvim`**—a coherent, ultra-fast library with first-class Tokyo Night integration.

---

## ⚡ The Modular Architecture

```text
nvim/
├── init.lua                   # Entrypoint setting leader to <Space>
├── README.md                  # This documentation & keybindings guide
└── lua/
    ├── config/
    │   ├── options.lua        # Tabs (4 spaces), clipboard, undofile, line numbers
    │   ├── keymaps.lua        # ThePrimeagen navigation & ergonomics remaps
    │   └── lazy.lua           # lazy.nvim bootstrapper
    └── plugins/
        ├── tokyonight.lua     # 🎨 Tokyo Night color scheme
        ├── mini.lua           # 🧩 mini.nvim unified UI & editing suite + UndoTree
        ├── treesitter.lua     # 🌳 AST syntax highlighting (pinned to stable master)
        ├── telescope.lua      # 🔍 Blazing fast fuzzy search (files, grep, buffers)
        ├── lsp.lua            # 🧠 Mason & nvim-lspconfig (auto language servers)
        ├── completion.lua     # ✨ nvim-cmp & LuaSnip autocompletion
        └── harpoon.lua        # 📌 ThePrimeagen's Harpoon v2 (4-buffer instant switcher)
```

---

## 🧩 mini.nvim Modules Included

| Module | What it does | Replaces |
| :--- | :--- | :--- |
| **`mini.tabline`** | Fast visual tabs across the top with icons and buffer indicators | `bufferline.nvim` |
| **`mini.statusline`** | Clean Tokyo Night statusline at the bottom | `lualine.nvim` |
| **`mini.files`** | Column-based file explorer with live preview and in-place file editing | `netrw` / `nvim-tree` |
| **`mini.icons`** | Ultra-fast Nerd Font filetype icons | `nvim-web-devicons` |
| **`mini.diff`** | Live Git diff signs in the sign column (`▎`, ``) with hunk jumping | `gitsigns.nvim` |
| **`mini.indentscope`** | Subtle vertical line highlighting the current indentation block | `indent-blankline` |
| **`mini.surround`** | Add, delete, or replace surrounding quotes/brackets (`sa`, `sd`, `sr`) | `nvim-surround` |
| **`mini.pairs`** | Clean automatic closing of brackets and quotes | `nvim-autopairs` |
| **`mini.ai`** | Extended text objects (`va)`, `vaq`, `vaf`, etc.) | `textobjects` |

---

## ⌨️ Keybindings Reference

Leader key is set to **`<Space>`**.

### 1. Visual Tabs (`mini.tabline`)
| Keybinding | Action |
| :--- | :--- |
| `<Tab>` | Cycle to **next** buffer tab |
| `<S-Tab>` | Cycle to **previous** buffer tab |
| `<leader>bc` | Close current buffer / tab |

### 2. File Explorer (`mini.files`)
| Keybinding | Action |
| :--- | :--- |
| `<leader>pv` or `<leader>e` | Toggle `mini.files` explorer at current file location |
| `h` / `l` *(inside explorer)* | Go to parent directory / expand folder or open file |
| `j` / `k` *(inside explorer)* | Navigate up / down |
| Edit text directly | Rename files, or create new files/folders on the fly! |
| `<Esc>` or `q` | Close file explorer |

### 3. Navigation & ThePrimeagen Muscle Memory
| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| `J` | Visual | Move selected block **down** with auto-indent |
| `K` | Visual | Move selected block **up** with auto-indent |
| `J` | Normal | Join lines below keeping cursor in place |
| `<C-d>` | Normal | Half-page jump down keeping cursor centered |
| `<C-u>` | Normal | Half-page jump up keeping cursor centered |
| `n` / `N` | Normal | Next / previous search match centered |
| `<leader>p` | Visual | Paste over selection **without** replacing register |
| `<leader>y` / `<leader>Y` | Normal / Visual | Yank into system clipboard (`+` register) |
| `<leader>d` | Normal / Visual | Delete into black hole register |
| `<leader>s` | Normal | Search & replace word under cursor across entire buffer |
| `<leader>x` | Normal | Make current file executable (`chmod +x`) |
| `<Esc>` | Normal | Clear search highlights |
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | Normal | Jump between split windows |

### 4. Fuzzy Search (`telescope.nvim`)
| Keybinding | Action |
| :--- | :--- |
| `<leader>ff` or `<leader>pf` | Find files in project |
| `<C-p>` | Find git-tracked files |
| `<leader>ps` or `<leader>fg` | Live grep across all project files |
| `<leader>fb` | Search open buffers |
| `<leader>fh` | Search help documentation |
| `<leader>fo` | Search recent files |

### 5. Fast File Switching (`harpoon v2`)
| Keybinding | Action |
| :--- | :--- |
| `<leader>a` | Mark current file |
| `<C-e>` | Open Harpoon quick menu |
| `<C-h>` | Direct jump to file **1** |
| `<C-t>` | Direct jump to file **2** |
| `<C-n>` | Direct jump to file **3** |
| `<C-s>` | Direct jump to file **4** |

### 6. Git & Visual Undo
| Keybinding | Action |
| :--- | :--- |
| `]c` / `[c` | Jump to next / previous Git change hunk |
| `<leader>u` | Toggle visual UndoTree panel |

### 7. LSP Code Intelligence
| Keybinding | Action |
| :--- | :--- |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Show references (in Telescope) |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<C-k>` | Signature help |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `<leader>f` | Format buffer with LSP |
| `<leader>d` | Show line diagnostic popup |
| `[d` / `]d` | Jump to previous / next diagnostic |

---

## 🚀 Quick Start & Installation

```bash
# 1. Symlink into ~/.config/nvim
ln -sf ~/Projects/dotfiles/nvim ~/.config/nvim

# 2. Launch Neovim
nvim
```
