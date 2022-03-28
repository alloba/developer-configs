-- All plugins used for the NeoVim configuration
-- If you see anything about "not a command blah blah ^M", 
-- it's a WSL + Git issue. I think updating Git fixes it... 
-- 2.25 -> error. 2.35 -> no error. shrug. 

return require('packer').startup(function()
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }
    use { 'airblade/vim-gitgutter' }
    use { 'folke/tokyonight.nvim'  }
    use { 'voldikss/vim-floaterm'  }
    use { 'kyazdani42/nvim-tree.lua',
            requires = { 'kyazdani42/nvim-web-devicons' },
            config = function() require'nvim-tree'.setup {} end
        }


    -- This massive thing is a premade setup for the language server 
    -- and supporting items. 
    -- The big pieces are the two items under LSP Support. 
    use { 'VonHeikemen/lsp-zero.nvim',
            requires = {
                -- LSP Support
                {'neovim/nvim-lspconfig'},
                {'williamboman/nvim-lsp-installer'},

                -- Autocompletion
                {'hrsh7th/nvim-cmp'},
                {'hrsh7th/cmp-buffer'},
                {'hrsh7th/cmp-path'},
                {'saadparwaiz1/cmp_luasnip'},
                {'hrsh7th/cmp-nvim-lsp'},
                {'hrsh7th/cmp-nvim-lua'},

                -- Snippets
                {'L3MON4D3/LuaSnip'},
                {'rafamadriz/friendly-snippets'},
            }
        }

    -- This one is a little iffy to get working... 
    -- I had to try a few different options on the use command, so I'm not 
    -- actually sure if this is the version that got it working all the way.
    use {'iamcco/markdown-preview.nvim', config = "vim.call('mkdp#util#install')"}
end)

