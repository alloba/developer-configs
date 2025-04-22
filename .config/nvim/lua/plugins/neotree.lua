return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- image support in preview mode - needs luarocks and broke instantly, so skipping it. 
    },
    lazy = false, -- neotree loads itself lazily
    opts = {},
    keys = {
        {"<leader>e", "<cmd>Neotree toggle<cr>", desc = "Neotree toggle view"}
    },
}
