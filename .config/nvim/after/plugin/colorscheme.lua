-- OneDark
local status, onedark = pcall(require, "onedark")
if status then
    onedark.setup {
        style = 'darker',
        transparent = true,
    }
    onedark.load()
end

-- TokyoNight
local status, tokyonight = pcall(require, "tokyonight")
if status then
    tokyonight.setup {
        style = "storm",
    }
    tokyonight.load()
end


-- i need a way to address automatically setting color schemes that aren't handled as function imports. 
vim.cmd[[colorscheme PaperColorSlim]]
