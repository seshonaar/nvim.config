return {
  "NeogitOrg/neogit",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",        -- required
    "seshonaar/diffview.nvim",      -- optional - Diff integration
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

    -- Define the function to open DiffView from the selected commit to HEAD
    local function open_diffview_for_selected_commit()
      -- Get the current line under the cursor (this should be the commit hash line)
      local current_line = vim.api.nvim_get_current_line()

      -- Extract the commit hash from the line (this assumes the commit hash is the first word)
      local commit_hash = current_line:match("%w+")

      if commit_hash then
        -- Open DiffView comparing the selected commit with HEAD
        vim.cmd('DiffviewOpen ' .. commit_hash .. '..HEAD')
      else
        print("No commit hash found on the current line")
      end
    end

    -- Function to set the buffer-local key mapping for the Neogit log view
    local function set_neogit_log_mappings(bufnr)
      vim.keymap.set({ "n" }, "<leader>d",
        open_diffview_for_selected_commit,
        { silent = true, noremap = true, buffer = bufnr })
    end

    -- Auto-command to apply the mapping only in the Neogit log view
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "NeogitLogView", -- Neogit log buffer file type
      callback = function(args)
        set_neogit_log_mappings(args.buf)
      end
    })

    vim.keymap.set({ "n" }, "<leader>gg",
      function()
        vim.cmd("Neogit")
      end,
      { silent = true, noremap = true })

    vim.keymap.set({ "n" }, "<leader>gc",
      function()
        vim.cmd("Neogit commit")
      end,
      { silent = true, noremap = true })

    vim.keymap.set({ "n" }, "<leader>gp",
      function()
        vim.cmd("Neogit pull")
      end,
      { silent = true, noremap = true })

    vim.keymap.set({ "n" }, "<leader>gP",
      function()
        vim.cmd("Neogit push")
      end,
      { silent = true, noremap = true })

    vim.keymap.set({ "n" }, "<leader>gb",
      function()
        vim.cmd("Telescope git_branches")
      end,
      { silent = true, noremap = true })

    vim.keymap.set({ "n" }, "<leader>gl",
      function()
        neogit.open({'log'})
      end,
      { silent = true, noremap = true })
  end
}
