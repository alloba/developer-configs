-- Bootstrap Packer automatically.
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end
--

return require('packer').startup({
    function(use)
        -- Packer
        use { "wbthomason/packer.nvim" } -- packer needs to know about itself to avoid deletion during PackerSync

        use {
            'nvim-treesitter/nvim-treesitter',
            branch = 'master',
            run = function() require('nvim-treesitter.install').update({ with_sync = true }).ts_update() end,
        }

        use {
            'williamboman/mason.nvim',
            branch = 'main',
            run = ':MasonUpdate'
        }

        use {
            'williamboman/mason-lspconfig.nvim'
        }

        -- language server configs
        use {
            'neovim/nvim-lspconfig',
            branch = 'master',
            wants = {
                "mason.nvim",
                "mason-lspconfig.nvim",
                "mason-tool-installer.nvim"
            }
        }

        -- cmp for completions. completion sources are pulled from depedencies and loaded explicitly (in plugin config file)
        use {
            'hrsh7th/nvim-cmp',
            branch = 'main',
            requires = {
                {'hrsh7th/cmp-nvim-lsp'},
                {'hrsh7th/cmp-buffer'},
                {'hrsh7th/cmp-path'},
                {'L3MON4D3/LuaSnip', tag = 'v1.*'}, -- it wasnt immediately clear, but you MUST have a snippet engine for cmp
                {'saadparwaiz1/cmp_luasnip' }
            }
        }

        -- Telescope is a fuzzy finder tool.
        -- Requires ripgrep to be installed on the machine for full functionality.
        use {
            'nvim-telescope/telescope.nvim',
            branch = 'master',
            requires = { { 'nvim-lua/plenary.nvim', branch = 'master' } },

        }

        use {
            'nvim-tree/nvim-tree.lua',
            branch = 'master',
            requires = { 'nvim-tree/nvim-web-devicons', branch = 'master' }
        }

        -- Persistent terminal / multiple terminals.
        -- It's suggested to specify major version tags. So keep updates in mind if errors start happening.
        use {
            'akinsho/toggleterm.nvim',
            tag = 'v2.*',
        }

        -- Add matching closing parens/brackets to text.
        use {
            'windwp/nvim-autopairs',
            branch = 'master',
        }
        --bufferline (show open buffers at top of screen)
        use {
            'akinsho/bufferline.nvim',
            branch = 'main',
            tag = 'v3.*',
            requires = { 'nvim-tree/nvim-web-devicons', branch = 'master' },
        }


        ---
        -- ColorSchemes.
        -- Disable anything not in use to cut down sync time.
        -- Mostly sourced from: https://github.com/rockerBOO/awesome-neovim#colorscheme
        ---
        use {
            'pappasam/papercolor-theme-slim',
            branch = 'main',
            disable = true
        }
        use {
            'sainnhe/gruvbox-material',
            branch = 'master',
            disable = true
        }

        use {
            'navarasu/onedark.nvim',
            branch = 'master',
            disable = false
        }

        use {
            'folke/tokyonight.nvim',
            branch = 'main',
            disable = true
        }
        ------------------------------------------------

        -- If bootstrap triggered, sync packer. This must be the last thing that executes in this function
        if PACKER_BOOTSTRAP then
            require('packer').sync()
        end
    end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
})
