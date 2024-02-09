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




vim.keymap.set("n", "<C-l>", vim.lsp.buf.format, {})
vim.keymap.set("i", "<C-l>", vim.lsp.buf.format, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

local has_telebuiltin, builtin = pcall(require, "telescope.builtin")
if has_telebuiltin then
  vim.keymap.set("n", "gr", builtin.lsp_references, {})
  vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
  vim.keymap.set("n", "gi", builtin.lsp_implementations, {})
else
  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
end


