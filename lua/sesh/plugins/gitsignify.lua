return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup
    {
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, desc, r, opts)
          opts = opts or {}
          opts.desc = desc
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', '0', "next hunk", function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gitsigns.nav_hunk('next')
          end
        end)

        map('n', '9', "prev hunk", function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gitsigns.nav_hunk('prev')
          end
        end)

        -- Actions
        map('n', '<leader>hs', "stage hunk", gitsigns.stage_hunk)
        map('n', '<leader>hr', "reset hunk", gitsigns.reset_hunk)
        map('v', '<leader>hs', "stage selection", function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('v', '<leader>hr', "reset selection", function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('n', '<leader>hS', "stage buffer", gitsigns.stage_buffer)
        map('n', '<leader>hu', "unstage hunk", gitsigns.undo_stage_hunk)
        map('n', '<leader>hR', "reset buffer", gitsigns.reset_buffer)
        map('n', '<leader>hp', "preview hunk", gitsigns.preview_hunk)
        map('n', '<leader>hb', "blame line", function() gitsigns.blame_line { full = true } end)
        map('n', '<leader>hB', "toggle line blame", gitsigns.toggle_current_line_blame)

        -- Text object
        map({ 'o', 'x' }, 'ih', "select hunk", ':<C-U>Gitsigns select_hunk<CR>')
      end
    }
  end
}
