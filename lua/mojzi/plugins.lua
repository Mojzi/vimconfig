local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("rose-pine").setup({
                --- @usage 'main'|'moon'|'dawn'
                dark_variant = 'main'
            })
            vim.o.background = "dark"
            vim.cmd('colorscheme rose-pine')
        end
    })
    use 'wbthomason/packer.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'nvim-treesitter/playground'
    use 'christoomey/vim-tmux-navigator'
    use 'mbbill/undotree'
    use('tpope/vim-fugitive')
    use 'tikhomirov/vim-glsl'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },           -- Required
            { 'williamboman/mason.nvim' },         -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },       -- Required
            { 'hrsh7th/cmp-nvim-lsp' },   -- Required
            { 'hrsh7th/cmp-buffer' },     -- Optional
            { 'hrsh7th/cmp-path' },       -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },   -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },           -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    use {'robertbrunhage/dart-tools.nvim'}

    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
