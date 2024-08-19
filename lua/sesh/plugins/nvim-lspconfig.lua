return {
  "neovim/nvim-lspconfig",
  config = function()

    -- Set up nvim-cmp and integrate with LSP
    local cmp = require'cmp'

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vim-vsnip` users.
        end,
      },
      mapping = {
        ['<C-Space>'] = cmp.mapping.complete(), -- Trigger completion with Ctrl+Space
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm completion with Enter
        ['<C-j>'] = cmp.mapping.select_next_item(), -- Navigate through completions with Tab
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- Navigate backwards with Shift+Tab
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- LSP completion source
        { name = 'vsnip' },    -- For vsnip users
        { name = 'buffer' },   -- Buffer completion source
        { name = 'path' },     -- Path completion source
      })
    })

    -- Setup LSP capabilities for nvim-cmp
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Setup LSP with nvim-cmp capabilities
    local lspconfig = require('lspconfig')

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      -- Add other LSP settings here...
    })

    vim.keymap.set( {"n","v"} , "<leader>a",
    function()
        vim.lsp.buf.code_action() -- if you don't want grouping.
    end,
    { silent = false, desc = "code actions (lsp)"})

    vim.keymap.set( {"n","v"} , "<leader>rn",
    function()
        vim.lsp.buf.rename()
    end,
    { silent = false, desc = "rename (lsp)"})

    vim.keymap.set( {"n","v"} , "<leader>==",
    function()
        vim.lsp.buf.format()
    end,
    { silent = false, desc = "format document (lsp)"})
  end
}
