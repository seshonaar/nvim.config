-- Package manager: lazy.nvim
require("sesh.core")
require("sesh.lazy")

local legacy_init = vim.fn.stdpath("config") .. "/legacy_init.vim"
vim.cmd.source(legacy_init)
