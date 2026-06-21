-- Ctrl+Backspace = delete the previous word, like in Windows apps / browsers / PowerShell.
--
-- Terminal caveat: terminals disagree on what Ctrl+Backspace sends. Most send either
-- <C-h> (0x08) or a dedicated <C-BS> code (modern terminals with the kitty/CSI-u protocol).
-- We bind BOTH in insert mode so it works whichever your terminal sends.
--
-- Insert mode (the main case — mid-typing): <C-w> is Vim's built-in "delete word before cursor".
-- Normal mode: only <C-BS> is bound — NOT <C-h>, because that's your "move focus left" window
--   keymap (init.lua). Deletes the whole word under the cursor into the black-hole register "_.
--
-- If Ctrl+Backspace does nothing, your terminal is sending plain <BS> (indistinguishable from
-- Backspace) — tell me and we'll enable the terminal's CSI-u keyboard protocol or pick another
-- key. Vim's <C-w> in insert mode always works as a manual fallback.
vim.keymap.set('i', '<C-BS>', '<C-w>', { desc = 'Delete previous word' })
vim.keymap.set('i', '<C-h>', '<C-w>', { desc = 'Delete previous word (Ctrl+Backspace fallback)' })
vim.keymap.set('n', '<C-BS>', '"_daw', { desc = 'Delete word under cursor' })
