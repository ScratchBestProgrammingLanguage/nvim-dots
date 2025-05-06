local obsidian = {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    opts = {
        workspaces = {
            {
                name = "uni",
                path = "~/uni/notes",
            },
        },
        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },
    }
}

local typst = {
    'chomosuke/typst-preview.nvim',
    ft = "typst",
    version = '1.*',
    opts = {
        dependencies_bin = { ['tinymist'] = 'tinymist' }
    },
}


return { obsidian, typst }
