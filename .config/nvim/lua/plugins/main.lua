-- Bootstrap Packer automatically.
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
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
            -- run = ':TSUpdate'  -- running this causes sync to fail the first time it is run. below is the alternative.
            run = function() require('nvim-treesitter.install').update({ with_sync = true }).ts_update() end,
        }

        -- coc for autocompletion/lsp/etc
        use {
            'neoclide/coc.nvim',
            branch = 'release',
        }

        -- Telescope is a fuzzy finder tool.
        -- Requires ripgrep to be installed on the machine for full functionality.
        use {
            'nvim-telescope/telescope.nvim',
            branch = 'master',
            requires = { { 'nvim-lua/plenary.nvim', branch = 'master' } },
        }
        -- coc integration with telescope
        use {
            'fannheyward/telescope-coc.nvim',
            branch = 'master',
            requires = { { 'nvim-telescope/telescope.nvim', branch = 'master' },
                { 'neoclide/coc.nvim', branch = 'release' } },
        }

        -- File system viewer
        use {
            'kyazdani42/nvim-tree.lua',
            branch = 'master',
            requires = { 'kyazdani42/nvim-web-devicons', branch = 'master' },
        }

        -- Persistent terminal / multiple terminals.
        -- It's suggested to specify major version tags. So keep updates in mind if errors start happening.
        use {
            'akinsho/toggleterm.nvim',
            tag = 'v2.*',
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
        }
        use {
            'akinsho/bufferline.nvim',
            branch = 'main',
            tag = 'v3.*',
            requires = { 'nvim-tree/nvim-web-devicons', branch = 'main' },
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
