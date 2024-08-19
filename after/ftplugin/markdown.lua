local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set({ "n" }, "<leader>vp",
  function()
    vim.cmd("MarkdownPreviewToggle")
  end,
  { silent = false, buffer = bufnr, desc = "markdown preview (toggle)" })
