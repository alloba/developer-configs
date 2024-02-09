-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<S-Up>", ":m -2<CR>==", { noremap = true }) -- nnoremap <S-Up>   :m-2<CR>
vim.api.nvim_set_keymap("n", "<S-Down>", ":m +<CR>==", { noremap = true }) -- nnoremap <S-Down> :m+<CR>
vim.api.nvim_set_keymap("i", "<S-Up>", "<Esc>:m -2<CR>==gi", { noremap = true }) -- inoremap <S-Up>   <Esc>:m-2<CR>
vim.api.nvim_set_keymap("i", "<S-Down>", "<Esc>:m +<CR>==gi", { noremap = true }) -- inoremap <S-Down> <Esc>:m+<CR>
vim.api.nvim_set_keymap("v", "<S-Up>", ":m '<-2<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<S-Down>", ":m '>+1<CR>gv=gv", { noremap = true })


vim.keymap.set("n", "<C-l>", vim.lsp.buf.format, {}) -- reformat current file
vim.keymap.set("i", "<C-l>", vim.lsp.buf.format, {}) -- reformat current file
vim.keymap.set("n", "K", vim.lsp.buf.hover, {}) -- hover action (show docs for highlighted element)

-- Telescope keys. Will skip if not installed.
local has_telebuiltin, builtin = pcall(require, "telescope.builtin")
if has_telebuiltin then
  vim.keymap.set("n", "gr", builtin.lsp_references, {})  -- goto references
  vim.keymap.set("n", "gd", builtin.lsp_definitions, {}) -- goto definitions
  vim.keymap.set("n", "gi", builtin.lsp_implementations, {}) -- goto implementations
else
  -- fallback shortcuts if telescope is not installed. Not sure if these actually work as expected, i havent needed them in a long time.
  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
end