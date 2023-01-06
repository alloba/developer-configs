-- note that key mappings are handled in the setup (open_mappings), not via default nvim api operations.

require('toggleterm').setup({
    open_mapping = [[<F1>]],
    insert_mappings = true,
    terminal_mappings = true,
    close_on_exit = true,
    direction = 'float' -- how to orient the shell. vertical | horizontal | tab | float
})
