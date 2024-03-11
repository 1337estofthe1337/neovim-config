-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.guicursor = ''

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

vim.opt.smartindent = true
vim.opt.linebreak = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 6
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 50

vim.opt.colorcolumn = '80'

vim.opt.mouse = ''

vim.opt.clipboard = 'unnamedplus'

vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
