local has, null_ls = pcall(require, 'null-ls')
if not has then return end


null_ls.setup({
    sources = {
        null_ls.builtins.formatting.xmlformat
    }
})
