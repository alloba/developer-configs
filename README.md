# Developer-Environment-Configs

This repo is a collection of configurations and settings that are meant to be carried between machines.
For the most part, this is just a couple of helper scripts and my neovim configuration.

## Setup Instructions

### Global Rules

- Ensure the `XDG_CONFIG_HOME` directory is set as expected in your shell.
  In my case, I always want it at `~/.config/`
- Symlink (or Junction on Windows) the files in the `.config` folder of this repo to the `XDG_CONFIG_HOME` location
  - I don't really recommend linking the root `config` folder itself - this makes it inflexible enough to be annoying

### Zshrc

I use ZSH + OMZ for my default terminal configuration. 
On new machines, once you install omz just replace the config file that was created by default with a symlink to 
the `.zshrc` file in this repo. 

Refer to that file for more specific info about the config. 

### Windows Powershell

An example powershell profile can be found in the `.config` folder.
Refer to the `Microsoft.PowerShell_profile.ps1` file in that folder for more detailed instructions.  
Specifically concerning where to place the file by default (Powershell has its own rules for where to look for profile information).


### NeoVim

Instructions exist in the `.config/nvim/README.md` file.
Generally you should just have to launch it and follow messages around missing dependencies.
There are some issues floating around with things not exactly installing cleanly in one go though, 
so you may have to launch it a few times and be attentive to warning messages. 
