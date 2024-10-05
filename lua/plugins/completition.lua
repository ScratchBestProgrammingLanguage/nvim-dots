local function config()
    local cmp = require("cmp")

    local opts = {
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        mapping = {
            ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
            ["<C-b>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
            ["<Tab>"] = cmp.mapping.confirm({ select = true })
        },
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "path" }
        }, { { name = "buffer" } }),
        -- Auto select first item
        completion = {
            completeopt = "menu,menuone,noinsert",
        }
    }

    cmp.setup(opts)
end

local plugins = {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",

            -- Lua snip
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        event = "InsertEnter",
        config = config
    }
}

return plugins
