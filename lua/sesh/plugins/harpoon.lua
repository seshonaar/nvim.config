return {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  branch = "harpoon2",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup(
      {
        settings = {
          save_on_toggle = false,
          sync_on_ui_close = false
        }
      }
    )
    -- REQUIRED

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    vim.keymap.set("n", "<C-f>m", function() toggle_telescope(harpoon:list()) end,
      { desc = "Open harpoon window" })

    vim.keymap.set("n", "<leader>mm", function() 
      harpoon:list():add() 
      local index = harpoon:list():length();
      print("harpoon added to "..index)
    end)
    vim.keymap.set("n", "<leader>mv", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
    vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
    vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
    vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
    vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
    vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>mp", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<leader>mn", function() harpoon:list():next() end)
  end
}
