# 🌙 Tokyo Night Neovim — Complete Reference Guide

A clean, unified, and blazing-fast **Neovim (v0.10+)** configuration built on **[lazy.nvim](https://github.com/folke/lazy.nvim)**, **[mini.nvim](https://github.com/echasnovski/mini.nvim)**, and styled with the **Tokyo Night** color scheme.

---

## ⚡ The "Daily 5" Quick Start

| Action | Keybinding | Description |
| :--- | :--- | :--- |
| **Find file** | **`<Space> ff`** | Fuzzy search all files in project |
| **Search text** | **`<Space> fg`** | Live grep across all project files |
| **File explorer** | **`<Space> e`** | Open `mini.files` directory navigator |
| **Cycle tabs** | **`<Tab>`** / **`<S-Tab>`** | Jump between open files across top bar |
| **Close tab** | **`<Space> bc`** | Close current file (*or `:bd`*) |

---

## ⌨️ Exhaustive Keybindings Reference

The **Leader key** is set to **`<Space>`**.

### 1. Visual Tabs & Buffers (`mini.tabline`)
| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| **`<Tab>`** | Normal | Jump to **next** tab along top bar |
| **`<S-Tab>`** | Normal | Jump to **previous** tab along top bar |
| **`<Space> bc`** | Normal | Close current buffer / tab |
| **`:bd`** | Command | Close buffer (*`:bd!` to force close without saving*) |

---

### 2. File Explorer (`mini.files`)
Press **`<Space> e`** or **`<Space> pv`** to toggle the column-based file manager:

| Keybinding | Context | Action |
| :--- | :--- | :--- |
| **`<Space> e`** | Normal | Open / close file explorer at current file |
| **`<Space> pv`** | Normal | Open / close file explorer (ThePrimeagen alias) |
| **`h`** | In Explorer | Go to **parent** folder |
| **`l`** or **`<CR>`** | In Explorer | Expand folder or **open** selected file |
| **`j`** / **`k`** | In Explorer | Move cursor down / up |
| **Direct edit** | In Explorer | Type text directly to **rename** files or create new ones! |
| **`dd`** | In Explorer | Delete file under cursor |
| **`q`** or **`<Esc>`** | In Explorer | Close file explorer |

---

### 3. Navigation & ThePrimeagen Muscle Memory
| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| **`J`** | Visual | Move selected block **down** 1 line (with auto-indent) |
| **`K`** | Visual | Move selected block **up** 1 line (with auto-indent) |
| **`J`** | Normal | Join line below while keeping cursor position intact |
| **`<C-d>`** | Normal | Scroll half-page **down** keeping cursor centered (`zz`) |
| **`<C-u>`** | Normal | Scroll half-page **up** keeping cursor centered (`zz`) |
| **`n`** | Normal | Jump to next search match centered (`nzzzv`) |
| **`N`** | Normal | Jump to previous search match centered (`Nzzzv`) |
| **`<Space> p`** | Visual | **Paste over selection without losing your copied text** |
| **`<Space> y`** | Normal / Visual | Yank (copy) into **system clipboard** (`+` register) |
| **`<Space> Y`** | Normal | Yank entire line into system clipboard |
| **`<Space> d`** | Normal / Visual | Delete into black-hole register (does not overwrite clipboard) |
| **`<Space> s`** | Normal | Interactive find & replace for word under cursor across entire file |
| **`<Space> x`** | Normal | Make current script executable (`chmod +x %`) |
| **`<Esc>`** | Normal | Clear active search highlights (`:noh`) |
| **`<C-h>`** | Normal | Jump to **left** split window |
| **`<C-j>`** | Normal | Jump to **lower** split window |
| **`<C-k>`** | Normal | Jump to **upper** split window |
| **`<C-l>`** | Normal | Jump to **right** split window |

---

### 4. Fuzzy Search (`telescope.nvim`)
| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| **`<Space> ff`** | Normal | Search files in project directory |
| **`<Space> pf`** | Normal | Search files in project (ThePrimeagen alias) |
| **`<C-p>`** | Normal | Search only Git-tracked files |
| **`<Space> fg`** | Normal | Live grep search for text across entire project |
| **`<Space> ps`** | Normal | Live grep search (ThePrimeagen alias) |
| **`<Space> fb`** | Normal | Search and switch between open buffers |
| **`<Space> fh`** | Normal | Search Neovim `:help` tags |
| **`<Space> fo`** | Normal | Search recently opened files (oldfiles) |
| **`<C-n>` / `<C-p>`** | In Telescope | Move selection down / up |
| **`<CR>`** | In Telescope | Open selected file |
| **`<C-u>` / `<C-d>`** | In Telescope | Scroll preview window up / down |
| **`<Esc>`** | In Telescope | Close search window |

---

### 5. Bookmark Switching (`harpoon v2`)
| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| **`<Space> a`** | Normal | **Add** current file to Harpoon bookmark list |
| **`<C-e>`** | Normal | **Toggle** Harpoon quick menu |
| **`<C-h>`** | Normal | Jump instantly to bookmarked file **1** |
| **`<C-t>`** | Normal | Jump instantly to bookmarked file **2** |
| **`<C-n>`** | Normal | Jump instantly to bookmarked file **3** |
| **`<C-s>`** | Normal | Jump instantly to bookmarked file **4** |
| **`dd`** | In Harpoon Menu | Remove bookmarked file from list |
| **`j` / `k`** | In Harpoon Menu | Reorder bookmarks |

---

### 6. Code Intelligence & LSP
| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| **`gd`** | Normal | **Go to Definition** (jumps to function/type source) |
| **`gD`** | Normal | Go to Declaration |
| **`gr`** | Normal | Show all **References** (in Telescope list) |
| **`gi`** | Normal | Go to Implementation |
| **`K`** | Normal | **Hover Documentation** (type signatures & docstrings) |
| **`<C-k>`** | Normal / Insert | Signature help (arguments popup) |
| **`<Space> rn`** | Normal | **Rename Symbol** across entire project |
| **`<Space> ca`** | Normal | **Code Actions** (quick fixes, imports) |
| **`<Space> f`** | Normal | **Format** current buffer with LSP |
| **`<Space> d`** | Normal | Open floating diagnostic popup for current line error |
| **`[d`** | Normal | Jump to **previous** diagnostic error/warning |
| **`]d`** | Normal | Jump to **next** diagnostic error/warning |

---

### 7. Autocompletion (Insert Mode)
| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| **`<C-Space>`** | Insert | Manually trigger autocomplete popup |
| **`<CR>`** (Enter) | Insert | Confirm / accept selected completion item |
| **`<Tab>`** | Insert | Select next suggestion or jump forward in snippet |
| **`<S-Tab>`** | Insert | Select previous suggestion or jump backward in snippet |
| **`<C-n>`** | Insert | Cycle to next autocomplete candidate |
| **`<C-p>`** | Insert | Cycle to previous autocomplete candidate |
| **`<C-f>`** / **`<C-b>`** | Insert | Scroll completion documentation down / up |
| **`<C-e>`** | Insert | Cancel / abort completion popup |

---

### 8. Surround Text (`mini.surround`)
Manipulate quotes, brackets, and HTML tags:

| Keybinding Pattern | Mode | Example & Result |
| :--- | :--- | :--- |
| **`sa`** + motion + symbol | Normal | `saiw"` &rarr; surrounds word with `"` (`word` &rarr; `"word"`) |
| **`sd`** + symbol | Normal | `sd"` &rarr; deletes surrounding quotes (`"word"` &rarr; `word`) |
| **`sr`** + old + new | Normal | `sr"'` &rarr; replaces `"` with `'` (`"word"` &rarr; `'word'`) |
| **`sa`** + symbol | Visual | Select visual block, then press `sa)` to surround in `()` |

---

### 9. Extended Text Objects (`mini.ai`)
Use in visual mode (`v`) or with operator actions (`d`, `c`, `y`):

| Text Object | Description | Example Usage |
| :--- | :--- | :--- |
| **`a)`** / **`i)`** | Around / inside parentheses | `ci)` &rarr; change inside `(...)` |
| **`a]`** / **`i]`** | Around / inside square brackets | `di]` &rarr; delete inside `[...]` |
| **`a}`** / **`i}`** | Around / inside curly braces | `ya}` &rarr; yank entire `{...}` block |
| **`a"`** / **`i"`** | Around / inside double quotes | `ci"` &rarr; change inside `"..."` |
| **`a'`** / **`i'`** | Around / inside single quotes | `ci'` &rarr; change inside `'...'` |
| **`af`** / **`if`** | Around / inside entire function | `vaf` &rarr; visually select function |
| **`aa`** / **`ia`** | Around / inside function argument | `dia` &rarr; delete argument in `foo(bar, baz)` |

---

### 10. Git Changes & Visual Undo
| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| **`]c`** | Normal | Jump to **next** Git hunk (added/modified lines) |
| **`[c`** | Normal | Jump to **previous** Git hunk |
| **`<Space> u`** | Normal | Toggle **UndoTree** branching undo visualizer |

---

### 11. Essential Vim Commands & Splits
| Command | Mode | Action |
| :--- | :--- | :--- |
| **`:w`** | Command | Save active file |
| **`:q`** | Command | Quit current window |
| **`:wq`** or **`ZZ`** | Command | Save and quit |
| **`:q!`** or **`ZQ`** | Command | Quit without saving changes |
| **`:vsp`** | Command | Open vertical split |
| **`:sp`** | Command | Open horizontal split |
| **`<C-w> c`** | Normal | Close current split window |
| **`<C-w> =`** | Normal | Make all splits equal width and height |
| **`u`** | Normal | Undo last change |
| **`<C-r>`** | Normal | Redo last undone change |

---

## 📂 Architecture Overview

```text
nvim/
├── init.lua                   # Entrypoint setting leader to <Space>
├── README.md                  # This complete reference guide
└── lua/
    ├── config/
    │   ├── options.lua        # Options (tabs, clipboard, line numbers, undofile)
    │   ├── keymaps.lua        # ThePrimeagen & navigation remaps
    │   └── lazy.lua           # lazy.nvim bootstrapper
    └── plugins/
        ├── tokyonight.lua     # 🎨 Tokyo Night color scheme
        ├── mini.lua           # 🧩 mini.nvim unified UI & editing suite + UndoTree
        ├── treesitter.lua     # 🌳 AST syntax highlighting (Neovim 0.12 native)
        ├── telescope.lua      # 🔍 Fuzzy finder (files, grep, buffers)
        ├── lsp.lua            # 🧠 Mason & nvim-lspconfig (auto language servers)
        ├── completion.lua     # ✨ nvim-cmp & LuaSnip autocompletion
        └── harpoon.lua        # 📌 ThePrimeagen's Harpoon v2 (4-buffer instant switcher)
```

---

## 🚀 Installation & Restoration

```bash
# 1. Symlink into ~/.config/nvim
ln -sf ~/Projects/dotfiles/nvim ~/.config/nvim

# 2. Launch Neovim
nvim
```
*All plugins and parsers bootstrap automatically on first launch.*
