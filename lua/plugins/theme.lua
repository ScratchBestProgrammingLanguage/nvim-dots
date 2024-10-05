local plugins = {
    "folke/tokyonight.nvim",
    opts = {
        style = "night",
    },
    init = function() vim.cmd [[colorscheme tokyonight]] end
}

return plugins
