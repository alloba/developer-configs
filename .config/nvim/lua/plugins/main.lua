-- Bootstrap Packer automatically.
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end
--

return require('packer').startup({
    function(use)
        -- Packer
        use { "wbthomason/packer.nvim" } -- self-updating packer (and proper tracking behavior)

        -- LSP+completions via lsp-zero.
        use {
            'VonHeikemen/lsp-zero.nvim',
            requires = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' },
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-nvim-lua' },

                -- Snippets
                { 'L3MON4D3/LuaSnip' },
                { 'rafamadriz/friendly-snippets' },
            },
            config = function() require('plugins.config.lsp-zero') end
        }

        -- Telescope is a fuzzy finder tool.
        -- Requires ripgrep to be installed on the machine for full functionality.
        use {
            'nvim-telescope/telescope.nvim',
            branch = 'master',
            requires = { { 'nvim-lua/plenary.nvim', branch = 'master' } },
            config = function() require('plugins.config.telescope') end
        }

        -- File system viewer
        use {
            'kyazdani42/nvim-tree.lua',
            branch = 'master',
            requires = { 'kyazdani42/nvim-web-devicons', branch = 'master' },
            config = function() require('plugins.config.nvimtree') end
        }

        -- Persistent terminal / multiple terminals.
        -- It's suggested to specify major version tags. So keep updates in mind if errors start happening.
        use {
            'akinsho/toggleterm.nvim',
            tag = 'v2.*',
            config = function() require('plugins.config.toggleterm') end
        }

        -- Nice markdown renderer.
        -- On windows, you must install glow separately. Once it is on the path it works fine.
        -- For other platforms, just run :GlowInstall
        use {
            'ellisonleao/glow.nvim',
            branch = 'main',
        }

        -- Add matching closing parens/brackets to text.
        use {
            'windwp/nvim-autopairs',
            branch = 'master',
            config = function() require('plugins.config.autopairs') end
        }

        -- Show list of open buffers on edge of screen
        use {
            'akinsho/bufferline.nvim',
            branch = 'main',
            tag = 'v3.*',
            requires = { 'nvim-tree/nvim-web-devicons', branch = 'main' },
            config = function() require('bufferline').setup {} end
        }

        -- Themes
        -- Flip the disabled flag on whichever you want to use.
        use {
            'NLKNguyen/papercolor-theme',
            branch = 'master',
            config = function() require('plugins.config.papercolor') end,
            disable = false
        }
        use {
            'ellisonleao/gruvbox.nvim',
            branch = 'main',
            config = function() require('plugins.config.gruvbox') end,
            disable = true
        }

        ------------------------------------------------

        -- If bootstrap triggered, sync packer. This must be the last thing that executes in this function
        if packer_bootstrap then
            require('packer').sync()
        end
    end,

    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
})
