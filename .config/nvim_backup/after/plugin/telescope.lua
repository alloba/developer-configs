local has, telescope = pcall(require, 'telescope')
if has then
    telescope.setup({
        defaults = {
            layout_strategy = 'vertical'
        },
        extensions = {
        },
    })

    vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope grep_string<cr>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>fq', '<cmd>Telescope help_tags<cr>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>.', '<cmd>Telescope spell_suggest<cr>', { noremap = true })
end
