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
                ensure_installed = { "python", "cpp", "lua", "javascript", "typescript", "c", "vim", "haskell", "elm"}
            })
        end
    },
    "nvim-treesitter/playground",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "mrcjkb/haskell-tools.nvim",
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
	config = function()
		require("tokyonight").setup {
			style = "night"
		}
		vim.cmd([[colorscheme tokyonight]])
--        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end
    },
    {
        "terrortylor/nvim-comment",
        config = function()
            require("nvim_comment").setup()
        end,
    }
}
