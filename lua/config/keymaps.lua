-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- ------------normal模式-------------
-- 光标切换到到本行第一个字符
map('n', "<C-S-H>", '^')


-- 光标切换到到本行最后一个字符
map('n', "<C-S-L>", '$')

-- 翻半页变成9行
map("n", "<C-u>", "17k")
map("n", "<C-d>", "17j")

map("n", "<leader>j", "A;<ESC>", { desc = "自动在行尾添加分号" })

-------------------------------------------buffers-------------------------------------------------------------------
---------------Harpoon--------------------
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED
--
map("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add file" })

map("n", "<C-;>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)  -- show Harpoon toggle_quick_menu

map("n", "\\a", function() harpoon:list():select(1) end)  -- navigate to file 1
map("n", "\\s", function() harpoon:list():select(2) end)  -- navigate to file 2
map("n", "\\d", function() harpoon:list():select(3) end)  -- navigate to file 3
map("n", "\\f", function() harpoon:list():select(4) end)  -- navigate to file 4
map("n", "\\g", function() harpoon:list():select(5) end)  -- navigate to file 5
map("n", "\\c", function() harpoon:list():select(6) end)  -- navigate to file 6

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function() harpoon:list():prev() end)
map("n", "<C-S-N>", function() harpoon:list():next() end)

-----------------------------------------
-- 切换到上一个缓冲区-
-- map('n', '<C-]>', ':bnext<CR>', opt)
-- 切换到下一个缓冲区（如果需要）
-- map('n', '<C-[>', ':bprevious<CR>', opt)
-- ---------------------------------

-- ------------insert模式-------------
-- map.set()
-- ---------------------------------

-- ------------visual模式-------------
map("v", "L", "$")
map("v", "H", "^")
--------------------------------------

-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })

map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map("n", "<Leader>dd", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { desc = "Debugger set conditional breakpoint" })

map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
-- map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })





-------------------------------telescope-----------------------------------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fl', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })





















