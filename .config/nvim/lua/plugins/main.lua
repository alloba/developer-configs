-- Bootstrap Packer automatically.
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
--


return require('packer').startup({
    function(use)
        -- Packer
        use { "wbthomason/packer.nvim" } -- packer needs to know about itself to avoid deletion during PackerSync

        -- General
        -- LSP/config/lang servers
        -- nvim tree
        -- nvim toggleterm
        --
        -- nvim autopairs
        -- gitsigns
      
       
        -- Telescope is a fuzzy finder tool. 
        -- Requires ripgrep to be installed on the machine for full functionality. 
        use { 
            'nvim-telescope/telescope.nvim',
            branch = 'master',
            requires = { {'nvim-lua/plenary.nvim', branch = 'master'} },
            config = function() require('plugins.config.telescope') end
        }

        use {
            'kyazdani42/nvim-tree.lua',
            branch = 'master', 
            requires = {'kyazdani42/nvim-web-devicons', branch = 'master'},
            config = function () require('plugins.config.nvimtree') end 
        }

        use {
            'akinsho/toggleterm.nvim',
            tag = 'v1.*',
            config = function() require('plugins.config.toggleterm') end 
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

