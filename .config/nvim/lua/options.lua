-- Quality of life
vim.o.go = 'a'                    -- enable mouse
vim.o.mouse = 'a'                 -- enable mouse
vim.o.clipboard = 'unnamedplus'   -- use system clipboard

-- Formatting
vim.opt.tabstop = 4               -- number of visual spaces per TAB
vim.opt.softtabstop = 4           -- number of spaces in tab when editing
vim.opt.shiftwidth = 4            -- insert 4 spaces on a tab
vim.opt.expandtab = true          -- tabs are spaces
vim.o.linebreak = true            -- wrap lines at convenient points
vim.cmd("autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")
-- don't continue comments on newline
vim.cmd([[
  autocmd BufWritePre * let currPos = getpos(".")
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufWritePre * %s/\n\+\%$//e
  autocmd BufWritePre *.[ch] %s/\%$/\r/e
  autocmd BufWritePre * call cursor(currPos[1], currPos[2])
]])

-- UI config
vim.o.title = true                -- set title of window to name of file
vim.opt.number = true             -- show the current line number absolutely
vim.opt.relativenumber = true     -- show other line numbers relative to the current line
vim.opt.cursorline = true         -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true         -- open new vertical split bottom
vim.opt.splitright = true         -- open new horizontal splits right

-- Searching
vim.opt.incsearch = true          -- search as characters are entered
vim.opt.hlsearch = false          -- do not highlight matches
vim.opt.ignorecase = true         -- ignore case in searches by default
vim.opt.smartcase = true          -- but make it case sensitive if an uppercase is entered

-- Completion
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }  -- completion options
vim.o.wildmode = 'longest,list,full'                     -- command-line completion mode

-- Open terminal in insert mode
vim.cmd([[
  autocmd TermOpen * startinsert
]])

-- NERDTree
vim.cmd([[
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
    \| q
    \| endif
]])
if vim.fn.has('nvim') == 1 then
  vim.g.NERDTreeBookmarksFile = vim.fn.stdpath('data') .. '/NERDTreeBookmarks'
else
  vim.g.NERDTreeBookmarksFile = '~/.vim' .. '/NERDTreeBookmarks'
end

-- set autochdir
vim.cmd([[
  autocmd BufEnter * silent! lcd %:p:h
]])

-- live-server
require('live-server').setup(opts)

-- VimTex
vim.g.vimtex_view_method = 'zathura'