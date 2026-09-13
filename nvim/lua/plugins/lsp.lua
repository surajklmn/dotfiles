return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            { "j-hui/fidget.nvim", opts = {} },
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            -- Capabilities broadcasted to LSP servers
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            -- Common on_attach handler
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    map("gd", vim.lsp.buf.definition, "Goto definition")
                    map("gD", vim.lsp.buf.declaration, "Goto declaration")
                    map("gr", require("telescope.builtin").lsp_references, "Goto references")
                    map("gi", vim.lsp.buf.implementation, "Goto implementation")
                    map("K", vim.lsp.buf.hover, "Hover documentation")
                    map("<C-k>", vim.lsp.buf.signature_help, "Signature help")
                    map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
                    map("<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format code")
                    map("<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
                    map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
                    map("]d", vim.diagnostic.goto_next, "Next diagnostic")
                end,
            })

            -- Configure Mason
            require("mason").setup({
                ui = {
                    border = "rounded",
                },
            })

            -- Language servers to ensure installed
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = { globals = { "vim" } },
                            workspace = { checkThirdParty = false },
                            telemetry = { enable = false },
                        },
                    },
                },
                rust_analyzer = {},
                pyright = {},
                clangd = {},
                gopls = {},
            }

            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(servers),
                handlers = {
                    function(server_name)
                        local server_opts = servers[server_name] or {}
                        server_opts.capabilities = capabilities
                        require("lspconfig")[server_name].setup(server_opts)
                    end,
                },
            })
        end,
    },
}
