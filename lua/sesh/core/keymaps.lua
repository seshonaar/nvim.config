vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<C-w>x", "<cmd>close<CR>", { desc = "Close current split" })                   -- close current split window

keymap.set("n", "<leader>qo", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader>qx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader>qn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap.set("n", "<leader>qp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap.set("n", "<leader>qf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<leader>1", "<cmd>tabn 1<CR>", { desc = "Go to tab 1" })
keymap.set("n", "<leader>2", "<cmd>tabn 2<CR>", { desc = "Go to tab 2" })
keymap.set("n", "<leader>3", "<cmd>tabn 3<CR>", { desc = "Go to tab 3" })
keymap.set("n", "<leader>4", "<cmd>tabn 4<CR>", { desc = "Go to tab 4" })

keymap.set({ "n", "i" }, "<C-s>", "<cmd>:w<CR>", { desc = "Save file" })
keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })
keymap.set("i", "<C-l>", "<C-o>A", { desc = "Go to end of line in insert mode." })
keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit insert mode in terminal." })

if vim.fn.has('win32') == 1 then
  keymap.set("t", "<C-1>", '%comspec% /k \"%VS_DIR%\\Common7\\Tools\\VsDevCmd.bat\"<CR>',
    { desc = "init dotnet env" })
  keymap.set("n", "<leader>et", '<cmd>:call jobstart(\'TOTALCMD64\') <CR>', { desc = "start total commander" })
else
  keymap.set("n", "<leader>et", '<cmd>:call jobstart(\'krusader\') <CR>', { desc = "start krusader" })
end

keymap.set("n", "-", "[c", { desc = "prev change" })
keymap.set("n", "=", "]c", { desc = "next change" })
