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
        -- telescope.nvim - fuzzy finder
        -- LSP
        -- nvim tree
        -- nvim toggleterm
        --
        -- nvim autopairs
        -- gitsigns
       
        use { 
            'nvim-telescope/telescope.nvim',
            branch = 'master',
            requires = { {'nvim-lua/plenary.nvim', branch = 'master'} },
            config = function() require('plugins.config.telescope') end
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

