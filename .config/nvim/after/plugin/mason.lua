local has_mason, mason = pcall(require, 'mason')
if not has_mason then return end

mason.setup({})


local has_masonconfig, masonconfig = pcall(require, 'mason-lspconfig')
if not has_masonconfig then return end

masonconfig.setup()

masonconfig.setup_handlers {
    -- default handler for anything that isnt explicitly defined.
    function(server_name)
        require('lspconfig')[server_name].setup {}
    end,

    ["lua_ls"] = function()
        require('lspconfig').lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }
    end,
}
