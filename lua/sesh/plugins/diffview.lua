return {
  "seshonaar/diffview.nvim",        -- optional - Diff integration
  branch = "seshonaar/list_view_sort_by_impact",
  config = function()
    vim.opt.fillchars:append({diff = ' '})
  end
}
