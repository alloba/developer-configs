-- Indentation
-- vim.opt.tabstop = 4 -- width used to display the tabulation character itself on screen
-- vim.opt.shiftwidth = 4 -- width to use for shifting commands (>>, <<. ==)
-- vim.opt.softtabstop = 4 -- how wide an indentation is supposed to span
-- vim.opt.expandtab = true -- indenting is always done with the space character
-- vim.opt.smartindent = true -- syntax aware indentations for newlines
-- vim.opt.shiftround = true -- when shiting lines, round the distance up to the nearest shiftwidth incremement
--
-- Gutter
vim.opt.relativenumber = true -- show relative line distance from cursor in gutter
vim.opt.number = true -- show absolute line number in gutter
vim.opt.signcolumn = "auto" -- show sign column in gutter if needed. tends to be a plugin/debugger kind of thing.

-- Searching
vim.opt.hlsearch = true -- search highlighting
vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- switch to case sensitive when using capital letters
vim.opt.incsearch = true -- partial matches

-- Text Rendering
vim.opt.display:append({ "lastline" }) -- always try to include the end of the paragraph on the screen
vim.opt.linebreak = true -- avoid line wraps in the middle of a word
vim.opt.scrolloff = 10 -- number of lines to keep around the cursor when scrolling
vim.opt.sidescrolloff = 5 -- number of columns to keep around the cursor when scrolling

-- UI
vim.opt.ruler = true -- always show cursor position
vim.opt.wildmenu = true -- show command line completion options as a menu
vim.opt.errorbells = false -- dont ever play error bells
vim.opt.mouse = "a" -- enable mouse for scrolling and resizing

-- Misc
vim.opt.autoread = true -- automatically reread unmodified files in nvim
vim.opt.history = 10000 -- large undo history (10k is neovim's default)
vim.opt.termguicolors = true -- enable 24bit RGB color in TUI


-- Share clipboard 
-- Todo - make h
if vim.fn.has("unnamedplus") == 1 then
  vim.opt.clipboard = "unnamedplus"
else
  -- Fallback to 'unnamed' if 'unnamedplus' is not available
  -- This might be useful on systems where the '+' register isn't supported.
  -- You might also choose to do nothing if 'unnamedplus' isn't available.
  vim.opt.clipboard = "unnamed"
end
