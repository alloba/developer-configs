# Developer-Environment-Configs

This repo is a collection of configurations and settings that are meant to be carried between workstations.
Turns out I don't have overly much to cart between locations config wise. :P

A couple of helper scripts and my neovim configuration.

# Setup Instructions

### Global Rules

- Ensure the `XDG_CONFIG_HOME` directory is set as expected.
  In my case, I always want it at `~/.config/`
- Symlink (or Junction on Windows) the `.config` folder of this repo to the `XDG_CONFIG_HOME` location

These two actions seem redundant, but I no longer trust tools to consistently obey the config home setting.
Sometimes they just make the assumption that the directory is consistent on all machines.

### Windows Powershell

An example powershell profile can be found in the .config folder.
Refer to the `Microsoft.PowerShell_profile.ps1` file in that folder for more detailed instructions.  
Specifically concerning where to place the file by default.

### NeoVim

Instructions exist in the `.config/nvim/README.md` file.
Generally you should just have to launch it and follow messages around missing dependencies.

### Iterm2

Custom scripts in this project must be imported into Iterm2 manually vai the `Scripts` menu.  
iTerm2 puts scripts in `~/.config/iterm2/AppSupport/Scripts/` by default.

Read each plugin for specific instructions on how to use / detailed configuration.
Also don't expect anything to particularly work.
There is a thick layer of dust on that stuff.
