-- lazy package manager used for grabbing plugins from the internet
-- This is the default config taken from:
-- URL: https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- Setups for internet plugins I'm using
-- lua table design inspired by kickstart.nvim
require("lazy").setup({
    -- telescope.nvim
    -- Gaze deeply into unknown regions using the power of the moon!
    -- telescope.nvim let's you search files with ease
    -- URL: https://github.com/nvim-telescope/telescope.nvim
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                          , branch = '0.1.x',
        dependencies = {
            -- plenary.nvim
            -- a library of functions needed by telescope
            -- URL: https://github.com/nvim-lua/plenary.nvim
            'nvim-lua/plenary.nvim',
            -- telescope-fzf-native.nvim
            -- Fuzzy Finder Algorithm which requires local dependencies to be built
            -- Only load if 'make' is available & system requirements are installed
            -- URL: https://github.com/nvim-telescope/telescope-fzf-native.nvim
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },

    -- onedark.nvim
    -- Theme inspired by Atom
    -- URL: https://github.com/navarasu/onedark.nvim
    {
        'navarasu/onedark.nvim',
        priority = 1000,
        config = function()
            vim.cmd('colorscheme onedark')
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {'mbbill/undotree'},

    {'tpope/vim-fugitive'},

    -- LSP Support
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', opts = {} },
            -- Additional lua configuration, makes nvim stuff amazing!
            { 'folke/neodev.nvim', opts = {} },
        },
    },

    -- Autcompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },
    },

    -- Popup menu for keymaps
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the 'Configuration' section on github
        },
    },

    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {}, -- this is equivalent to setup({}) function
    },

    -- Creates lines for indents on 
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {},
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add          = { text = '+' },
                change       = { text = '~' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
        },
    },

    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {},
    },

    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },

    {
        'wakatime/vim-wakatime',
        lazy=false,
        setup = function()
            vim.cmd([[packadd wakatime/vim-wakatime]])
        end,
    },

    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },

    { 'ThePrimeagen/vim-be-good' },

    {
        'nvim-tree/nvim-tree.lua',
        version = '*',
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('nvim-tree').setup {}
        end,
    },

}, {})
