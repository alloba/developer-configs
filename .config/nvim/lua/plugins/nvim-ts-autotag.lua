-- will automatically handle closing tags for languages like HTML
-- assumes that the relevant parser(s) are installed for TreeSitter
return { 
    'windwp/nvim-ts-autotag',
    config = function()
        require('nvim-ts-autotag').setup({
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = true 
            }
        })
    end
}
