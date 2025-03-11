local function get_opts()
    local cmp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(),
        cmp.default_capabilities())

    local lspconfig = require("lspconfig")
    local handlers = {
        -- Generic lsp setup
        function(server)
            lspconfig[server].setup {
                capabilities = capabilities
            }
        end,

        -- lua specific
        ["lua_ls"] = function()
            local opts = {
                diagnostics = { globals = { "vim", "use", "require" } },
                workspace = { library = vim.api.nvim_get_runtime_file("", true) }
            }
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                settings = { Lua = opts }
            }
        end,

        -- Zig specific
        ["zls"] = function()
            local opts = {
                cmd = { "/usr/bin/zls" }
            }

            lspconfig.zls.setup {
                capabilities = capabilities,
                settings = opts
            }
        end

    }

    -- Enable inlay hints
    vim.lsp.inlay_hint.enable(true)
    return { handlers = handlers }
end

local keymaps = {
    { "<leader>lh", vim.lsp.buf.hover,          desc = "[L]sp [H]over" },

    -- Gotos
    { "<leader>gd", vim.lsp.buf.definition,     desc = "[G]oto [D]efinition" },
    { "<leader>gi", vim.lsp.buf.implementation, desc = "[G]oto [I]mplementation" },

    -- Code
    { "<leader>ca", vim.lsp.buf.code_action,    desc = "[C]ode [A]actions" },
    { "<leader>lr", vim.lsp.buf.rename,         desc = "[L]sp [R]ename" },
}

local plugins = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { { "williamboman/mason.nvim", config = true }, { "neovim/nvim-lspconfig" } },
    event = { "BufRead", "BufNewFile" },
    cmd = "Mason",
    opts = get_opts,

    keys = keymaps
}

return plugins
