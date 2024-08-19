local function get_build_command()
  if vim.fn.has("win32") then
    return 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
  else
    return 'make'
  end
end

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = get_build_command() },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    'shatur/neovim-session-manager',
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.sources.telescope")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next,     -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.open,
          },
        },
      },
      extensions = {
        sessions_picker = {
          sessions_dir = vim.fn.stdpath('data') .. '/sessions/', -- same as '/home/user/.local/share/nvim/session'
        }
        -- other tele extensions configs
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension('sessions_picker')
    telescope.load_extension("live_grep_args")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set({ "n" }, "<C-f>s",
      function()
        vim.cmd("Telescope sessions_picker")
      end,
      { silent = true, noremap = false })

    keymap.set({ "n" }, "<C-b>",
      function()
        vim.cmd("Telescope buffers")
      end,
      { silent = true, noremap = false })

    keymap.set({ "n" }, "<C-t>",
      function()
        vim.cmd("Telescope resume")
      end,
      { silent = true, noremap = true })

    keymap.set({ "n" }, "<C-f>g",
      function()
        vim.cmd("Telescope git_files")
      end,
      { silent = true, noremap = true })

    keymap.set({ "n" }, "<C-f>f",
      function()
        vim.cmd("Telescope find_files")
      end,
      { silent = true, noremap = true })

    keymap.set({ "n" }, "<C-f>q",
      function()
        vim.cmd("Telescope quickfix")
      end,
      { silent = true, noremap = true })

    keymap.set({ "n" }, "<C-f>l",
      function()
        vim.cmd("Telescope loclist")
      end,
      { silent = true, noremap = true })

    keymap.set({ "n" }, "<C-f>h",
      function()
        vim.cmd("Telescope oldfiles")
      end,
      { silent = true, noremap = true })

    keymap.set({ "n" }, "<C-f>r",
      function()
        vim.cmd("Telescope live_grep")
      end,
      { silent = true, noremap = true })

    keymap.set({ "v" }, "<C-f>g",
      function()
        local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
        live_grep_args_shortcuts.grep_visual_selection();
      end,
      { silent = true, noremap = true })

    keymap.set({ "n", "v" }, "<C-f>w",
      function()
        vim.cmd("Telescope grep_string")
      end,
      { silent = true, noremap = true })

    keymap.set({ "n" }, "gr",
      function()
        vim.cmd("Telescope lsp_references")
      end,
      { silent = true, noremap = true })

    keymap.set({ "n" }, "gd",
      function()
        vim.cmd("Telescope lsp_definitions")
      end,
      { silent = true, noremap = true })

    keymap.set({ "n" }, "<leader>d",
      function()
        vim.cmd("Telescope diagnostics")
      end,
      { silent = true, noremap = true })

    -- session manager
    -- press ctrl-N in the session list to create a new one
    -- press delete in the session list to delete sessions
    local Path = require('plenary.path')
    local config = require('session_manager.config')
    require('session_manager').setup({
      sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
      session_filename_to_dir = session_filename_to_dir,           -- Function that replaces symbols into separators and colons to transform filename into a session directory.
      dir_to_session_filename = dir_to_session_filename,           -- Function that replaces separators and colons into special symbols to transform session directory into a filename. Should use `vim.uv.cwd()` if the passed `dir` is `nil`.
      autoload_mode = config.AutoloadMode.LastSession,             -- Define what to do when Neovim is started without arguments. See "Autoload mode" section below.
      autosave_last_session = true,                                -- Automatically save last session on exit and on session switch.
      autosave_ignore_not_normal = true,                           -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
      autosave_ignore_dirs = {},                                   -- A list of directories where the session will not be autosaved.
      autosave_ignore_filetypes = {                                -- All buffers of these file types will be closed before the session is saved.
        'gitcommit',
        'gitrebase',
      },
      autosave_ignore_buftypes = {},                                  -- All buffers of these bufer types will be closed before the session is saved.
      autosave_only_in_session = false,                               -- Always autosaves session. If true, only autosaves after a session is active.
      max_path_length = 80,                                           -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
    })
  end,
}
