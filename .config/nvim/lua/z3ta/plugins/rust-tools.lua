return {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = "neovim/nvim-lspconfig",
        config = function()
            local rt = require("rust-tools")
            rt.setup({})
        end,
}
