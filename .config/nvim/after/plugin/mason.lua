local has, mason = pcall(require, 'mason')
if has then
    mason.setup({

    })
end


local has, masonconfig = pcall(require, 'mason-lspconfig')
if has then
    masonconfig.setup()
    masonconfig.setup_handlers {
        function(server_name)
            require('lspconfig')[server_name].setup {}
        end
    }
end
