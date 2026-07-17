--- lua/plugins/lsp.lua
return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            -- Ensure `servers` table exists
            opts.servers = opts.servers or {}

            -- Python: use pyright (or swap for pylsp, etc.)
            opts.servers.pyright = opts.servers.pyright or {}

            -- C++: use clangd
            opts.servers.clangd = opts.servers.clangd or {}

            -- YAML: use yamlls
            opts.servers.yamlls = opts.servers.yamlls
                or {
                    settings = {
                        yaml = {
                            keyOrdering = false,
                        },
                    },
                }

            return opts
        end,
    },
    -- Mason ensure_installed for these LSP servers
    {
        "mason-org/mason.nvim",
        opts = function(_, opts)
            local ensure = opts.ensure_installed or {}

            local function ensure_tool(tool)
                if not vim.tbl_contains(ensure, tool) then
                    table.insert(ensure, tool)
                end
            end

            -- tools for LSP
            ensure_tool("pyright") -- Python
            ensure_tool("clangd") -- C/C++
            ensure_tool("yaml-language-server")

            opts.ensure_installed = ensure
            return opts
        end,
    },
}
