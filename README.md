# Developer-Environment-Configs

This repo is a collection of configurations and settings 
that are meant to be carried between workstations. 

Meaning generally - terminal program config files and 
custom scripts that I've written that have been useful enough to not want to 
lose track of. 

**Specific Setup Instructions**

- Vim: 
  - Copy the `.vim` folder and the `.vimrc` file to the home directory.
  - To install VimPlug items, open vim and run `:PlugInstall` (plugins installed are derived from `.vimrc`)

- NeoVim
  - Copy the the `.config/nvim` folder to the home directory (the entire folder structure).
  - To install VimPlug items, open vim and run `:PlugInstall` (plugins installed are derived from `init.vim`)

- iTerm2: Scripts must be imported via the `Scripts` menu. 
  Read each plugin for specific instructions on how to use / detailed configuration
    - iTerm2 puts scripts in `~/.config/iterm2/AppSupport/Scripts/`
