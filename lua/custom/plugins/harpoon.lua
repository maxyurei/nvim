-- harpoon (v2) — pin a small list of files you're actively working on, jump between them
-- with one keystroke. Fixes the "I keep re-searching the same 4 files in Telescope" problem.
--
-- Workflow:
--   <leader>a   add current file to the harpoon list
--   <C-e>       open the harpoon quick menu (edit/reorder/delete entries)
--   <leader>1..4 jump straight to harpoon slot 1..4
--
-- Lazy-loaded on its keymaps — no startup cost.
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>a', function() require('harpoon'):list():add() end, desc = 'Harpoon: [A]dd file' },
    { '<C-e>', function() local h = require('harpoon'); h.ui:toggle_quick_menu(h:list()) end, desc = 'Harpoon: toggle menu' },
    { '<leader>1', function() require('harpoon'):list():select(1) end, desc = 'Harpoon: file 1' },
    { '<leader>2', function() require('harpoon'):list():select(2) end, desc = 'Harpoon: file 2' },
    { '<leader>3', function() require('harpoon'):list():select(3) end, desc = 'Harpoon: file 3' },
    { '<leader>4', function() require('harpoon'):list():select(4) end, desc = 'Harpoon: file 4' },
  },
  config = function() require('harpoon'):setup() end,
}
