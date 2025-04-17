-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- ------------normal模式-------------
map("n", "U", "<C-r>")

-- map("n", "<C-i>", "^")
-- map("n", "<C-o>", "$")

map('n', "mk", '^')
map('n', "ml", '$')

-- 翻半页变成9行
map("n", "<C-u>", "17k")
map("n", "<C-d>", "17j")

map("n", "<leader>j", "A;<ESC>", { desc = "自动在行尾添加分号" })

--------------insert模式-------------
--map.set()
map("i", "jk", "<ESC>")
-- ---------------------------------

-- ------------visual模式-------------
map("v", "L", "$")
map("v", "H", "^")
--------------------------------------

-------------------------------------------buffers-------------------------------------------------------------------
---------------Harpoon--------------------
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({}) -- 修改为你的配置对象
-- REQUIRED

map("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add file" })
map("n", "gh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "show Harpoon toggle_quick_menu"})

map("n", "\\a", function() harpoon:list():select(1) end, { desc = "navigate to file 1" })
map("n", "\\s", function() harpoon:list():select(2) end, { desc = "navigate to file 2" })
map("n", "\\d", function() harpoon:list():select(3) end, { desc = "navigate to file 3" })
map("n", "\\f", function() harpoon:list():select(4) end, { desc = "navigate to file 4" })
map("n", "\\g", function() harpoon:list():select(5) end, { desc = "navigate to file 5" })
map("n", "\\c", function() harpoon:list():select(6) end, { desc = "navigate to file 6" })

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

map("n", "gi", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

----------------------------------------- Augment ---------------------------------
map("n", "<Leader>rh", "<cmd>Augment chat-toggle<CR>", { desc = "Toggle Augment Chat History" })
map("n", "<Leader>rc", "<cmd>Augment chat<CR>", { desc = "Send a chat msg in current conversation" })
map("n", "<Leader>rn", "<cmd>Augment chat-new<CR>", { desc = "Start a new conversation" })

map("n", "<Leader>rs", "<cmd>Augment status<CR>", { desc = "View the current status of the plugin" })
map("n", "<Leader>rl", "<cmd>Augment log<CR>", { desc = "View the plugin log"})


-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })

map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map( "n", "<Leader>dd", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { desc = "Debugger set conditional breakpoint" })

map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
-- map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-------------------------------telescope-----------------------------------------------
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fl", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
