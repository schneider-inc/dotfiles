local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

local cmp =  require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})



lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = {'tsserver', 'rust_analyzer', 'clangd', 'csharp_ls', 'cssls', 'cssmodules_ls', 'unocss', 'clojure_lsp', 'eslint', 'elixirls', 'elmls', 'emmet_ls', 'emmet_language_server', 'golangci_lint_ls', 'gopls', 'graphql', 'html', 'hls', 'jsonls', 'biome', 'jdtls', 'java_language_server', 'quick_lint_js', 'vtsls', 'julials', 'kotlin_language_server', 'ltex', 'texlab', 'lua_ls', 'marksman', 'prosemd_lsp', 'remark_ls', 'vale_ls', 'zk', 'nil_ls', 'rnix', 'ocamllsp', 'jedi_language_server', 'pyre', 'pyright', 'pylyzer', 'sourcery', 'pylsp', 'ruff_lsp', 'r_language_server', 'vimls', 'zls'}
})
