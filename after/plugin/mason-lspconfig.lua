require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'html', 'cssls', 'clangd', 'cmake', 'pyright', 'rust_analyzer', 'lua_ls', 'gopls' },
})

local lspconfig = require('lspconfig')
lspconfig.tsserver.setup{}
lspconfig.html.setup{}
lspconfig.cssls.setup{}
lspconfig.clangd.setup{}
lspconfig.cmake.setup{}
lspconfig.pyright.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.lua_ls.setup{}
lspconfig.gopls.setup{}
