-- smear-cursor.nvim — Neovide-style smooth cursor smear effect inside the terminal.
-- Renders a fading trail between cursor positions using extmarks + truecolor blending.
-- Requires a terminal with truecolor support (most modern terminals: kitty, wezterm,
-- alacritty, windows terminal, modern gnome-terminal).
--
-- Lazy-loaded on first cursor movement — no startup cost.
return {
  'sphamba/smear-cursor.nvim',
  event = 'CursorMoved',
  opts = {
    -- Frame interval in ms. Lower = more frames = smoother motion (17 ≈ 60fps default).
    -- 7 ≈ ~140fps; the main fix for choppiness when the terminal can keep up.
    time_interval = 7,

    -- Higher = snappier (shorter smear); lower = longer, more gradual trail.
    stiffness = 0.6,
    trailing_stiffness = 0.4,
    damping = 0.65,
    -- Anti-aliasing quality of the trail edges (lower = smoother gradient).
    matrix_pixel_threshold = 0.5,

    smear_between_buffers = true,
    smear_between_neighbor_lines = true,

    -- Sub-cell block glyphs give fractional-character resolution = much smoother smear.
    -- Verified supported by this terminal+font (legacy computing symbols U+1FB00-1FBFF render).
    legacy_computing_symbols_support = true,
  },
}
