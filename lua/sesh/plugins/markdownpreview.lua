return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  config = function()
    vim.g.mkdp_refresh_slow = 1
    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_echo_preview_url = 1

  end,
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
}
