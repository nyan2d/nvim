local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    -- web icons
    use 'kyazdani42/nvim-web-devicons'

    -- color scheme
    use 'olivercederborg/poimandres.nvim'

    -- lualine
    use 'nvim-lualine/lualine.nvim'

    -- Bufferline
    -- TODO: check https://github.com/romgrk/barbar.nvim
    use 'akinsho/bufferline.nvim'

    -- Nvim Tree
    use 'kyazdani42/nvim-tree.lua'

    -- Autopairs
    use 'windwp/nvim-autopairs'

    -- Nvim Commentary
    use 'b3nj5m1n/kommentary'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- LuaSnip
    use 'L3MON4D3/LuaSnip'

    -- Snippets
    use 'rafamadriz/friendly-snippets'

    -- nvim-cmp
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'

    -- LSP Signature
    use 'ray-x/lsp_signature.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- todo comments
    use 'folke/todo-comments.nvim'

    -- hop (navigation)
    use 'phaazon/hop.nvim'

    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
