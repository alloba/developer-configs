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

        -- To Evaulate:
        -- nvim autopairs -- automatically add closing braces and brackes and stuff.
        -- gitsigns -- git change detection and blame

        -- CoC is the LSP path that I've gone with.
        -- This is instead of manually setting everything up myself. Which is not worth.
        use {
            'neoclide/coc.nvim',
            branch = 'release',
            config = function() require('plugins.config.coc') end,
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
        use {
            'akinsho/toggleterm.nvim',
            tag = 'v1.*',
            config = function() require('plugins.config.toggleterm') end
        }

        -- Nice markdown renderer. 
        -- On windows, you must install glow separately. Once it is on the path it works fine. 
        -- For other platforms, just run :GlowInstall
        use {
            'ellisonleao/glow.nvim',
            branch = 'main',
        }




        -- Themes (set disable = false for whichever is in use)
        use {
            'NLKNguyen/papercolor-theme',
            branch = 'master',
            config = function() require('plugins.config.papercolor') end,
            disable = false
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
