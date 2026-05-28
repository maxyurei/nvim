-- flash.nvim — jump anywhere on screen with 2 keystrokes + label.
-- Press `s`, type 2 chars near where you want to go, then the label key shown next to the match.
-- Replaces tedious `wwwww` / counting lines for visible jumps.
--
-- Lazy-loaded on keys only — zero startup cost until you press one.
return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {},
  keys = {
    { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash jump' },
    { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash treesitter (select syntax node)' },
    { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote flash (operate on a distant region)' },
    { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter search' },
  },
}
