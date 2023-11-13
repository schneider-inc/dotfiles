return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        "neovim/nvim-lspconfig",

        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip"
    },
    config = function()
        local lsp_zero = require("lsp-zero")
        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({buffer = bufnr})
        end)

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {"rust_analyzer", "clangd", "tsserver", "jedi_language_server", "hls"},
            handlers = {
                lsp_zero.default_setup,
            }
        })
    end,
}
