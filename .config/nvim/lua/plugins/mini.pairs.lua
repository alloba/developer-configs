return { 
    'echasnovski/mini.nvim', 
    version = '*',
    opts = {} ,
    config = function(_, opts)
        require("mini.pairs").setup(opts)
    end 
}

