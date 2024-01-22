-------------------------------------------------------------------------------
-- Personal settings
-------------------------------------------------------------------------------
-- From ThePrimeagen: performs actions while deleting the text into the
-- 'blackhole' register "_d. This preserves text instead of replacing
-- the register with the deleted text.
vim.keymap.set('v', '<leader>kp', [["_dP]], { desc = '[k]eep current, [p]aste' })
vim.keymap.set({ 'n', 'v' }, '<leader>kd', [["_d]], { desc = '[k]eep current, [d]elete' })

-- keymaps to easily navigate down and up wrapped text.
vim.keymap.set('n', 'j', 'gj', { desc = 'Navigate down' })
vim.keymap.set('n', 'k', 'gk', { desc = 'Navigate up' })

-- remap to enter newline in normal mode
vim.keymap.set('n', '<leader>o', [[o<Esc>"_D]], { desc = 'insert new line bottom' })
vim.keymap.set('n', '<leader>O', [[O<Esc>"_D]], { desc = 'insert new line top' })

-- nvim-tree toggle
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })


-------------------------------------------------------------------------------
-- from fugitive.lua
-------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>Gs', vim.cmd.Git, { desc = '[G]it [s]tatus' })

-------------------------------------------------------------------------------
-- Toggles undotree
-------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>tu', vim.cmd.UndotreeToggle, { desc = '[T]oggle [u]ndotree' })

-------------------------------------------------------------------------------
-- Telescope keymaps
-------------------------------------------------------------------------------
local telescope = require('telescope.builtin')
-- search for files
vim.keymap.set('n', '<leader>sf', telescope.find_files, { desc = '[S]earch for [f]iles' })
-- search for git files
vim.keymap.set('n', '<leader>sgf', telescope.git_files, { desc = '[S]earch for [g]it [f]iles' })
-- search for string
vim.keymap.set('n', '<leader>ss', function()
    telescope.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = '[S]earch for [s]tring' })

-------------------------------------------------------------------------------
-- Config for harpoon
-- URL: https://github.com/ThePrimeagen/harpoon/tree/harpoon2
-------------------------------------------------------------------------------
local harpoon = require('harpoon')

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- add file to the harpoon list
vim.keymap.set('n', '<leader>na', function() harpoon:list():append() end, { desc = 'Quick [a]dd' })
-- open harpoon menu
vim.keymap.set('n', '<leader>nm', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Quick [m]enu' })

-- sets quick keymapping for quick file access using qwerty
vim.keymap.set('n', '<leader>nq', function() harpoon:list():select(1) end, { desc = 'Quick 1' })
vim.keymap.set('n', '<leader>nw', function() harpoon:list():select(2) end, { desc = 'Quick 2' })
vim.keymap.set('n', '<leader>ne', function() harpoon:list():select(3) end, { desc = 'Quick 3' })
vim.keymap.set('n', '<leader>nr', function() harpoon:list():select(4) end, { desc = 'Quick 4' })

-------------------------------------------------------------------------------
-- which-key registration
-------------------------------------------------------------------------------
