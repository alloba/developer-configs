local telescope = require('telescope')

telescope.setup({
    extensions = {
        coc = {
            theme = 'ivy', -- panel is stuck to the bottom instead of floating in the middle with this theme.
            prefer_locations = true,
        }
    },
})

telescope.load_extension('coc')

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>.', '<cmd>Telescope spell_suggest<cr>', { noremap = true })
