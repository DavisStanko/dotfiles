local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = true}),

    -- Select next and previous item
    ['<C-j>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
    ['<C-k>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
  }
})
