return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require('rustaceanvim.neotest')
      },
    }

    vim.keymap.set("n", "<leader>tt",
      function()
        require("neotest").run.run()
      end,
      { desc = "Run nearest test" })

    vim.keymap.set("n", "<leader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      { desc = "Run  tests in file" })

    vim.keymap.set("n", "<leader>te",
      function()
        vim.cmd("Neotest summary")
      end,
      { desc = "view test explorer" })

    vim.keymap.set("n", "<leader>to",
      function()
        vim.cmd("Neotest output")
      end,
      { desc = "view test output" })

    vim.keymap.set("n", "<leader>tp",
      function()
        vim.cmd("Neotest output-panel")
      end,
      { desc = "view test output panel" })
  end
}
