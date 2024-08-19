return {
  'kassio/neoterm',
  config = function()
    vim.keymap.set("n", "<leader>`", "<cmd>Ttoggle<CR>", { desc = "Toggle neoterm" })

    if vim.fn.has("win32") == 1 then
      vim.g.neoterm_eof = "\r\n"
    end

    vim.g.neoterm_autoscroll=1
  end
}
