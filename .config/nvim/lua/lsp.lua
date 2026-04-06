local lsp_zero = require('lsp-zero')

-- lsp_attach runs every time an LSP connects to a buffer
local lsp_attach = function(client, bufnr)
  -- This provides the default keymaps (gd, K, etc.)
  lsp_zero.default_keymaps({buffer = bufnr})
end

lsp_zero.extend_lspconfig({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  lsp_attach = lsp_attach,
  float_border = 'rounded',
})

-- Now setup your servers manually or via mason-lspconfig
-- Example: require('lspconfig').pyright.setup({})

-- Setup Autocomplete (cmp)
local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = cmp.mapping.preset.insert({
    -- Your custom mappings
    ['<C-CR>'] = cmp.mapping.confirm({select = true}),
    ['<C-j>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
    ['<C-k>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
  }),
})
