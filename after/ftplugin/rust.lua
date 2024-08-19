local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set({ "n" }, "<leader>cc",
  function()
    print("running cargo check")
    vim.cmd("T cargo check")
  end,
  { silent = false, buffer = bufnr, desc = "cargo check" })

vim.keymap.set({ "n" }, "<leader>cr",
  function()
    print("running cargo run")
    vim.cmd("T cargo run")
  end,
  { silent = false, buffer = bufnr, desc = "cargo run" })
