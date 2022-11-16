-- Theme
vim.opt.background = 'dark'

-- Text Formatting
vim.opt.encoding = 'utf-8'

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true -- automatically indent another level to respect {,}, or entries in cinwords.
vim.opt.tabstop = 4 -- how many spaces does a tab count as
vim.opt.shiftwidth = 4 -- number of spaces used for an (auto)indent
vim.opt.expandtab = true -- convert tabs to spaces

-- Folding
vim.g.markdown_folding = 1 -- markdown folding is off by default. which boggles my mind.
vim.g.markdown_enable_folding = 1
vim.opt.foldmethod = 'syntax' -- vs manually defined areas, or indentation level defined areas
vim.opt.foldcolumn = '0' -- columns to the left of the screen that show indentation levels. 0 keeps them off so they dont take up screen space.
vim.opt.foldlevel = 99 -- depth to begin default folding. 0=everything, 1=after the first layer, etc.

-- View Behavior
vim.opt.showmatch = true -- show matching brackets. cursor will briefly jump to it
vim.opt.scrolloff = 3 -- number of rows to offset the cursor from the edge of the screen, when scrolling
vim.opt.wrap = true -- line wrap.
vim.opt.showbreak = '↪' -- character to show when line is broken
vim.opt.showcmd = true -- indicate when the leader key is active

-- Line Numbering
-- -- Having both number and relative number on will enable hybrid mode.
vim.opt.number = true -- absolute line numbering
vim.opt.relativenumber = true -- distance from cursor
vim.opt.numberwidth = 3

-- Search
vim.opt.incsearch = true -- immediately start searching while typing
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Do not ignore case if capital letters are used in the search term.

-- Spelling
vim.opt.spelllang = "en"

local config_dir = os.getenv('XDG_CONFIG_HOME')
if config_dir ~= nil then
    local spellfile_location = config_dir .. "/nvim/spell/custom-general.utf-8.add"
    local f = io.open(spellfile_location, "r")
    if f == nil then
        print('WARN: spellfile not found in location' .. spellfile_location .. ', custom spellfile is not set.')
    else
        vim.opt.spellfile = spellfile_location
    end
else
    print('WARN: XDG_CONFIG_HOME not set, spellfile not set')
end

-- Misc
vim.opt.mouse = 'a' -- enable mouse in modes. a = all modes.
vim.opt.termguicolors = true
vim.opt.hidden = true -- close empty buffers? i think?
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.shortmess = 'filnxtToOFc' -- shorten messages. this is the default, except for the addition of 'c' (hide ins-completion-menu messages)
vim.opt.signcolumn = 'number'

-- Clipboard Sharing
-- Windows and Mac use unnamed, most linux distros use unnamedplus
local osName = vim.loop.os_uname().sysname
if osName == "Windows_NT" or osName == "Darwin" then
    vim.cmd 'set clipboard=unnamed'
elseif osName == "Linux" then
    vim.cmd 'set clipboard=unnamedplus'
else
    print("WARN: settings.lua: running on unrecognized OS - setting clipboard=unnamedplus. Detected OS=" .. osName)
    vim.cmd 'set clipboard=unnamedplus'
end


-- Shell setup
-- Getting powershell to work is a bit involved...
if vim.fn.executable('pwsh') == 1 then
    windows_terminal = 'pwsh'
else
    if vim.fn.executable('powershell') == 1 then
        windows_terminal = 'powershell'
    end
end

if windows_terminal then
    vim.opt.shell = windows_terminal
    vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
    vim.opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.opt.shellquote = nil
    vim.opt.shellxquote = nil
end
