-- Set leader key to space
vim.g.mapleader = " "

-- Find and replace with S
vim.api.nvim_set_keymap('n', 'S', ':%s//g<Left><Left>', { noremap = true })

-- Toggle spell check with leader + o
vim.cmd([[map <leader>o :setlocal spell! spelllang=en_us<CR>]])

-- Save file leader + w
vim.cmd([[map <leader>w :w<CR>]])

-- Save file with sudo with :w!!
vim.cmd([[cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!]])

-- Toggle NERDTree with leader + n
vim.cmd([[map <leader>n :NERDTreeToggle<CR>]])

-- Telescope
local builtin = require('telescope.builtin')
-- Find files with leader + f
vim.keymap.set('n', '<leader>f', builtin.find_files, {})

-- Split navigation shortcuts
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- math
vim.keymap.set('n', 'Q', function()
  local cword = vim.fn.expand('<cWORD>')
  local num_str = cword:match('-?%d+%.?%d*')
  if not num_str then return end

  local operation = vim.fn.input('Operation: ')
  if operation == "" then return end

  local expr = num_str .. operation
  local fn, err = load("return " .. expr)
  if not fn then
    vim.notify('Invalid expression: ' .. expr, vim.log.levels.ERROR)
    return
  end

  local result = fn()
  -- Trim unnecessary trailing zeros from decimals (e.g. 10.0 -> 10)
  local result_str = tostring(result):gsub('%.0$', '')

  vim.cmd('normal! ciW' .. result_str)
end, { desc = "Perform on-the-fly math on number under cursor" })
