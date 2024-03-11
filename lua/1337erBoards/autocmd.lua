vim.api.nvim_command([[ highlight MatchParen guibg=#0030F0 ]])

-- Enables wrap text for Markdown and Text files
vim.cmd([[autocmd BufEnter *.md,*.txt set wrap]])

-- Enable spell checking for Markdown and Text files
vim.cmd([[autocmd BufEnter *.md,*.txt set spell]])
