-- Auto-save on leaving insert mode, leaving the buffer, or losing window focus.
-- Why: covers the "I never want to lose work" intent without firing on every keystroke
-- (the old `TextChanged` trigger fired on every normal-mode edit, churning disk + git).
vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave", "FocusLost" }, {
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" and vim.api.nvim_buf_get_name(0) ~= "" then
      vim.cmd("silent write")
    end
  end,
})
