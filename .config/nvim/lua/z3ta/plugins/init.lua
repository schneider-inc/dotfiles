return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "python", "cpp", "lua", "javascript", "typescript", "c", "vim", "haskell", "elm"},
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true,
                },
            })
        end
    },
    "nvim-treesitter/playground",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "mrcjkb/haskell-tools.nvim",
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = true,
                custom_highlights = function(colors)
                    return {
                        LineNr = { fg = colors.flamingo },
                    }
                end,
            })
            vim.cmd.colorscheme "catppuccin"
        end,
    },
    {
        "terrortylor/nvim-comment",
        config = function()
            require("nvim_comment").setup()
        end,
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    },
}
