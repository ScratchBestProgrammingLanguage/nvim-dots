local keymaps = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[F]ind [F]iles" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "[F]ind [G]rep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "[F]ind [B]uffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "[F]ind [H]elp" },
}

local plugins = {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,

    keys = keymaps
}

return plugins
