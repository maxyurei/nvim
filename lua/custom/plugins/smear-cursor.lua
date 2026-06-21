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
    -- Frame interval in ms. 17 ≈ 60fps. WSL2's terminal pipeline can't sustain
    -- the old 7ms (~140fps) — it lagged AND flickered from flooding the pipe.
    -- 60fps still looks smooth and roughly halves the CPU cost of the effect.
    time_interval = 17,

    -- Higher = snappier (shorter smear that settles fast = fewer frames drawn).
    -- Tuned up from the old floaty values so the animation completes quickly.
    stiffness = 0.8,
    trailing_stiffness = 0.6,
    damping = 0.8,
    -- Anti-aliasing quality of the trail edges (lower = smoother, cleaner gradient).
    -- Dropped from 0.5 → 0.3 to recover some of the soft "shadow" look without the
    -- flickery legacy block glyphs — this draws more partial-intensity cells instead.
    matrix_pixel_threshold = 0.3,

    smear_between_buffers = true,
    smear_between_neighbor_lines = true,

    -- Don't smear while typing — keeps the cursor instant/solid in insert mode
    -- (fixes the typing lag/flicker) while still smearing on normal-mode jumps.
    smear_insert_mode = false,

    -- OFF: these sub-cell block glyphs (U+1FB00-1FBFF) must render pixel-perfect
    -- every frame; on WSL2 they repaint slightly off and cause the normal-mode
    -- flicker. Disabling makes the smear marginally coarser but flicker-free.
    legacy_computing_symbols_support = false,
  },
}
