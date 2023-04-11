local has, tree = pcall(require, 'nvim-tree')
if has then
    vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { noremap = true })
    tree.setup({})
end
