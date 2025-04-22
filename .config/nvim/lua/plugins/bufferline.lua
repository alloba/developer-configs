return {
   'akinsho/bufferline.nvim', 
   version = "*", 
   dependencies = 'nvim-tree/nvim-web-devicons',
   
   opts = {
    options = {
        always_show_bufferline = true ,
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            }
        },
    }
   },
   config = function(_, opts)
       require("bufferline").setup(opts)
   end 
}
