-- Leader key
-- vim.keymap.set("n", "<Space>", "<Nop>")
-- vim.g.mapleader = "<Space>" 
-- vim.g.maplocalleader = "\\" 

-- Having end of line sit beside beginning of line feels right. 
vim.keymap.set("n", "-", "$", { noremap = true })

-- Move current line of text up/down quickly with shift + arrow keys
vim.keymap.set("n", "<S-Up>", ":m -2<CR>==", { noremap = true }) -- nnoremap <S-Up>   :m-2<CR>
vim.keymap.set("n", "<S-Down>", ":m +<CR>==", { noremap = true }) -- nnoremap <S-Down> :m+<CR>
vim.keymap.set("i", "<S-Up>", "<Esc>:m -2<CR>==gi", { noremap = true }) -- inoremap <S-Up>   <Esc>:m-2<CR>
vim.keymap.set("i", "<S-Down>", "<Esc>:m +<CR>==gi", { noremap = true }) -- inoremap <S-Down> <Esc>:m+<CR>
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv", { noremap = true })

vim.keymap.set("n", "<C-_>", "gcc", {remap = true} ) -- comment or uncomment line (relies on commentstring being defined for buffer)
vim.keymap.set("v", "<C-_>", "gc", {remap = true} ) -- comment or uncomment selection (relies on commentstring being defined for buffer)

-- LSP Stuff 
vim.keymap.set("n", "<C-l>", vim.lsp.buf.format, {}) -- reformat current file
vim.keymap.set("i", "<C-l>", vim.lsp.buf.format, {}) -- reformat current file
vim.keymap.set("n", "K", vim.lsp.buf.hover, {}) -- hover action (show docs for highlighted element)

---- Telescope keys. Will skip if not installed.
--local has_telebuiltin, builtin = pcall(require, "telescope.builtin")
--if has_telebuiltin then
--  vim.keymap.set("n", "gr", builtin.lsp_references, {}) -- goto references
--  vim.keymap.set("n", "gd", builtin.lsp_definitions, {}) -- goto definitions
--  vim.keymap.set("n", "gi", builtin.lsp_implementations, {}) -- goto implementations
--else
--  -- fallback shortcuts if telescope is not installed. Not sure if these actually work as expected, i havent needed them in a long time.
--  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
--  vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
--end

