return {    
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                "lua", "markdown", "markdown_inline", 
                "python", "bash", "css", "dockerfile", 
                "editorconfig", "git_config","go",
                "html", "java", "javadoc", 
                "javascript", "jsdoc", "json", 
                "json5", "kotlin", "powershell", 
                "sql", "terraform", "toml", 
                "typescript", "yaml"
            },
            sync_install = false,
            highlight = {enable = true},
            indent = {
                enable = false, -- sounds nice, but seems to cause people more grief than anything else
                disable = {} -- list of languages to turn off 
            }
        })
    end
}
