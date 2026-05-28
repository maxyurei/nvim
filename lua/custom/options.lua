-- Save on buffer switch, :make, :!, :next etc. Combined with the autocmd in
-- custom/autocmds.lua this auto-saves at sensible moments without thrashing the disk.
vim.opt.autowrite = true

-- 24-bit truecolor. Smooth color blending for the cursor smear (256-color looks banded/choppy).
-- The terminal emulator must also support truecolor for this to take full effect.
vim.opt.termguicolors = true
