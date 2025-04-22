# NeoVim Setup 

Notes on the current NeoVim setup I'm using. 

## Plugin Manager 

Going with [lazy.nvim](https://lazy.folke.io) -- not to be confused with LazyVim, which uses lazy.nvim as a plugin manager as well. 

It just seems to be the way people are moving these days most often, 
and I previously was using a (mostly) preconfigured instance of LazyVim, 
so why not?


### Configuration 

Lazy.nvim is pretty into convention in terms of plugin and setting locations, but generally:

- `init.lua` is always run on startup (default neovim behavior - `help runtimepath`)
- inside `init.lua`, the manager config is called pulled in from `/lua/config/lazy.lua`
  - this is the recommended file and structure, there's nothing dictating this other than convention
  - setting global configs like leader keys is suggested to be done *before* running lazy.nvim, to ensure correct mappings. 
