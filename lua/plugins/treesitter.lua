local plugins = {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        }
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}

return plugins
