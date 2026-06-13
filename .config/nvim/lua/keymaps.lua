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

-- Open terminal
vim.keymap.set('n', '<leader>t', ':split | resize 10 | terminal<CR>', {})

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
