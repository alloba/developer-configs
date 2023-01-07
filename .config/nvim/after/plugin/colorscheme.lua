-- OneDark
local status, onedark = pcall(require, "onedark")
if status then
    onedark.setup {
        style = 'darker',
        transparent = false,
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
