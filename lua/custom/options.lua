-- Save on buffer switch, :make, :!, :next etc. Combined with the autocmd in
-- custom/autocmds.lua this auto-saves at sensible moments without thrashing the disk.
vim.opt.autowrite = true

-- 24-bit truecolor. Smooth color blending for the cursor smear (256-color looks banded/choppy).
-- The terminal emulator must also support truecolor for this to take full effect.
vim.opt.termguicolors = true

-- Disable unused language "providers" (the legacy remote-plugin hosts). None of our
-- pure-Lua plugins use them, so this silences the perl/ruby/node :checkhealth warnings
-- and skips their startup probes. (Python provider left enabled — harmless to keep.)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
