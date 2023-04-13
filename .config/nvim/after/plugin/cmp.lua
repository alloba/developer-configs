local has, cmp = pcall(require, 'cmp')
if not has then return end

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

cmp.setup({
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    }),
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete {}, -- seemingly this didnt work when calling as complete() ? weird.
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end
        ),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end
        )
    }),
})



local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- language server specific configs would go here.
-- require('lspconfig')['TARGET_LSP_SERVER'].setup{capabilities = capabilities}
