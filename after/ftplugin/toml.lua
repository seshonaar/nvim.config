local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set({ "n" }, "<leader>cf",
  function()
    require('crates').show_features_popup();
  end,
  { silent = false, buffer = bufnr, desc = "crate features" })

vim.keymap.set({ "n" }, "<leader>cv",
  function()
    require('crates').show_versions_popup();
  end,
  { silent = false, buffer = bufnr, desc = "crate versions" })

vim.keymap.set({ "n" }, "<leader>cd",
  function()
    require('crates').show_dependencies_popup();
  end,
  { silent = false, buffer = bufnr, desc = "crate dependencies" })

