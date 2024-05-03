require("jomunoz.remap")
require("jomunoz.editor-conf")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            window = { position = "right" },
        },
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },
    {
        'windwp/nvim-autopairs', -- plugin 1
        event = { 'InsertEnter' },
        config = function()
            local npairs_status_ok, npairs = pcall(require, 'nvim-autopairs')

            npairs.setup({})
        end
    },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping.confirm({ select = true })
                }),
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expant(args.body)
                    end
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }
                })
            })
        end
    },
    { 'L3MON4D3/LuaSnip' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function()
            local lsp_zero = require('lsp-zero')

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format()
                    end
                })
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require('mason').setup({})
            require('mason-lspconfig').setup({
                -- Replace the language servers listed here
                -- with the ones you want to install
                ensure_installed = { 'tsserver', 'rust_analyzer', 'zls' },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                },
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local configs = require('nvim-treesitter.configs')

            configs.setup({
                ensure_installed = { 'c', 'lua', 'typescript', 'html', 'css', 'zig' }
            })
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()
            local rosepine = require('rose-pine')
            rosepine.setup({
                styles = {
                    transparency = true
                }

            })
            vim.cmd [[colorscheme rose-pine]]
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            theme = 'auto'
        }
    },
    {
        'tpope/vim-fugitive'
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            numhl = true
        }
    },
    {
        "zbirenbaum/copilot.lua",
        config = function()
            require('copilot').setup({
                suggestion = {
                    auto_trigger = true,
                    keymap = {
                        accept = '<Tab>',
                    }
                },
            })
        end

    }



})
