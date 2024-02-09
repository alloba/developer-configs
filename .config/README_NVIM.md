# NeoVim Configuration Information 

I always forget what was going on with this config folder within a few days of touching it, 
so having a readme seems like a good idea. 

## Loading User Configs
NeoVim follows the [XDG Directory specification](https://specifications.freedesktop.org/basedir-spec), 
with sane defaults set in the case that the current terminal session is missing the defined variables. 

Unfortunately (for me), the sane defaults are OS-dependent. 
Meaning that instead of using the `~/.config` folder in Windows it uses `~/AppData/Local`.
Which is very thoughtful but not what I want. 

Fortunately I can just change it!
All you have to do is set the environment variable for the terminal/session: 

`XDG_CONFIG_HOME` -> `~/.config`  
(Or whatever you want. But you are probably me, so set it to that folder.)


**Default Directories** 

None of these deeply matter except the config home, honestly. 

| XDG Label         | Windows                | Unix-Flavors         |
|-------------------|------------------------|----------------------|
| `XDG_CONFIG_HOME` | `~/AppData/Local`      | `~/.config`          | 
| `XDG_DATA_HOME`   | `~/AppData/Local`      | `~/.local/share`     |
| `XDG_RUNTIME_DIR` | `~/$TMP/nvim.user/xxx` | `/tmp/nvim.user/xxx` |
| `XDG_STATE_HOME`  | `~/AppData/Local`      | `~/.local/state`     |


## Plugins

***A lot of this info is obsoleted by using LazyVim, but I don't care to remove it right now. Refer to LazyVim docs for plugins and folder layout***

They good. 
I use Packer to handle all plugins/external resources.
Things should be pretty nicely set up to where all you have to do is follow the 
[installation instructions](https://github.com/wbthomason/packer.nvim) 
and then run `:PackerSync`  
*entirely untested, but you might not even need to run the installation, with how it's been set up now*

## Config Layout 
NeoVim is pretty respectful of the default vim configuration. 
However, the big thing is how you can instead use lua. 
Which sounds nice to me!

The entrypoint for setup is `XDG_CONFIG_HOME/nvim/init.lua` (or `init.vim`, but I refuse). 
Other files can be loaded in from inside the init file, which is exactly what happens. 
Breaking things out makes life a lot easier in terms of organization.

A little gotcha is that NeoVim will append `/lua` to your runtime path when searching for 
valid imported lua files. 
So by default, that means all files should live in a subdirectory in the config folder. 

```text
~/.config/nvim/
|- init.lua
|-lua/
| |- settings.lua
| |- keybinds.lua
| |- plugins/        
| | |- main.lua       -- Bootstrap Packer and set up all plugins
| | |- config/        -- All plugins that need configuration have entries in this folder.  
```

...And that's it! 
Anything below this point will be specific information about a plugin or 
justifications for particular settings. 
