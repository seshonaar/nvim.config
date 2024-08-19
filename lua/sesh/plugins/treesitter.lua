return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = function()
        local ts_install = require('nvim-treesitter.install')
        ts_install.compilers = {"zig", "clang", "gcc"}
        local ts_update = ts_install.update({ with_sync = true })
        ts_update()
    end,
    dependencies = {
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/nvim-treesitter-textobjects"
    },
    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- configure treesitter
        treesitter.setup({ -- enable syntax highlighting
            highlight = {
                enable = true,
            },
            -- enable indentation
            indent = { enable = true },
            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = {
                enable = true,
            },
            -- ensure these language parsers are installed
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "dockerfile",
                "gitignore",
                "vimdoc",
                "rust",
                "toml"
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })

    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
    vim.opt.foldlevel = 99
    end,
}
