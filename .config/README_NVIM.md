# NeoVim Configuration Information 

I always forget what was going on with this config folder within a few days of touching it, 
so having a readme seems like a good idea. 

## Loading User Configs
NeoVim follows the [XDG Directory specification](https://specifications.freedesktop.org/basedir-spec), 
with sane defaults set in the case that the current terminal session is missing the defined variables.
I tend to just explicitly define my config folder path to be the default as a sanity thing. 

This applies to Windows as well as Linux and MacOS, 
but generally keep an eye out on any windows configuration that you ever do. 
Setting `XDG_CONFIG` globally can have weird consequences, like messing up game save locations
(I'll never forget).

**Default XDG Directories for Reference** 

None of these deeply matter except the config home, honestly. 

| XDG Label         | Windows                | Unix-Flavors         |
|-------------------|------------------------|----------------------|
| `XDG_CONFIG_HOME` | `~/AppData/Local`      | `~/.config`          | 
| `XDG_DATA_HOME`   | `~/AppData/Local`      | `~/.local/share`     |
| `XDG_RUNTIME_DIR` | `~/$TMP/nvim.user/xxx` | `/tmp/nvim.user/xxx` |
| `XDG_STATE_HOME`  | `~/AppData/Local`      | `~/.local/state`     |


## NeoVim Configuration

Every time I update this section it tends to be obsoleted before I need to reference it again, 
so now I'm just not writing anything down. 

Just read through the `nvim` folder and piece together how things currently are. 