# Developer-Environment-Configs

This repo is a collection of configurations and settings that are meant to be carried between workstations.
For this most part, this is just a couple of helper scripts and my neovim configuration.

## Setup Instructions

### Global Rules

- Ensure the `XDG_CONFIG_HOME` directory is set as expected in your shell.
  In my case, I always want it at `~/.config/`
- Symlink (or Junction on Windows) the `.config` folder of this repo to the `XDG_CONFIG_HOME` location

Both of these actions just explicitly define what should be default settings typically. 
However, I don't really trust everything across Windows/Linux/Mac to always behave the way I think they should. 
So it's better to be strict. 

### Windows Powershell

An example powershell profile can be found in the .config folder.
Refer to the `Microsoft.PowerShell_profile.ps1` file in that folder for more detailed instructions.  
Specifically concerning where to place the file by default (Powershell has its own rules for where to look for profile information).

### NeoVim

Instructions exist in the `.config/nvim/README.md` file.
Generally you should just have to launch it and follow messages around missing dependencies.
There are some issues floating around with things not exactly installing cleanly in one go though, 
so you may have to launch it a few times and be attentive to warning messages. 

### Iterm2

There is a thick layer of dust on this. 
I don't really customize the terminal much, and I never had much to customize in the first place. 

Custom scripts in this project must be imported into Iterm2 manually vai the `Scripts` menu.  
iTerm2 puts scripts in `~/.config/iterm2/AppSupport/Scripts/` by default.

Read each plugin for specific instructions on how to use / detailed configuration.
Also don't expect anything to particularly work.
