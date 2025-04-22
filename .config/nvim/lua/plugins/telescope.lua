return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },

    keys = {
        {"<leader>ff", function() require("telescope.builtin").find_files() end, mode = {"n"}, desc = "Telescope find file"},
        {"<leader>fg", function() require("telescope.builtin").live_grep() end, mode = {"n"}, desc = "Telescope live grep"},
        {"<leader>fb", function() require("telescope.builtin").buffers() end, mode = {"n"}, desc = "Telescope find in buffers"},
        {"<leader>fh", function() require("telescope.builtin").help_tags() end, mode = {"n"}, desc = "Telescope help tags"},
        
        {"<C-A-r>", function() require("telescope.builtin").lsp_references() end, mode = {"n"}, desc = "Telescope LSP references under cursor"},
        {"<C-A-d>", function() require("telescope.builtin").lsp_definitions() end, mode = {"n"}, desc = "Telescope LSP definition under cursor"},

    },
    
    cmd = "Telescope",
}

