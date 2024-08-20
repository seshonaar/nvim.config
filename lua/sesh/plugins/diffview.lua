return {
  "seshonaar/diffview.nvim", -- optional - Diff integration
  branch = "seshonaar/list_view_sort_by_impact",
  config = function()
    vim.opt.fillchars:append({ diff = ' ' })
    -- Key mappings for DiffView
    local actions = require("diffview.actions")

    require("diffview").setup({
      keymaps = {
        -- Override ESC key to toggle the file explorer instead of closing the diff session
        view = {
          ["<esc>"] = actions.toggle_files,
          ["q"] = "<cmd>DiffviewClose<CR>"
        },
        file_panel = {
          ["<esc>"] = actions.toggle_files,
          ["q"] = "<cmd>DiffviewClose<CR>"
        },
        file_history_panel = {
          ["<esc>"] = actions.toggle_files,
          ["q"] = "<cmd>DiffviewClose<CR>"
        }
      }
    })
  end
}
