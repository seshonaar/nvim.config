return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "seshonaar/diffview.nvim",        -- optional - Diff integration
    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim" -- optional
  },
  config = function()
    local neogit = require('neogit')
    neogit.setup {
      disable_line_numbers = false,
      mappings = {
        status = {
          ["1"] = false,
          ["2"] = false,
          ["3"] = false,
          ["4"] = false,
        }
      },
      graph_style = "unicode",
    }

    vim.keymap.set( {"n"} , "<leader>gg",
      function()
        vim.cmd("Neogit")
      end,
      { silent = true, noremap = true})

    vim.keymap.set( {"n"} , "<leader>gc",
      function()
        vim.cmd("Neogit commit")
      end,
      { silent = true, noremap = true})

    vim.keymap.set( {"n"} , "<leader>gp",
      function()
        vim.cmd("Neogit pull")
      end,
      { silent = true, noremap = true})

    vim.keymap.set( {"n"} , "<leader>gP",
      function()
        vim.cmd("Neogit push")
      end,
      { silent = true, noremap = true})

    vim.keymap.set( {"n"} , "<leader>gb",
      function()
        vim.cmd("Telescope git_branches")
      end,
      { silent = true, noremap = true})

    vim.keymap.set( {"n"} , "<leader>gB",
      function()
        vim.cmd("G blame")
      end,
      { silent = true, noremap = true})
  end
}
