local plugins = {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-treesitter' },
        ft = "markdown",

        keys = { "<leader>md", "<cmd>RenderMarkdown toggle<cr>", desc = "[M]ark [D]own" },
    }
}

return plugins
