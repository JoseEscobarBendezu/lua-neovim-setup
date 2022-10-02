vim.cmd[[
let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'
]]

require('gitsigns').setup {
  signs                             = {
    add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
  },
  signcolumn                        = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl                             = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl                            = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff                         = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir                      = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked               = true,
  current_line_blame                = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts           = {
    virt_text = false,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = true,
  },
  sign_priority                     = 6,
  update_debounce                   = 100,
  status_formatter                  = nil, -- Use default
  max_file_length                   = 40000,
  preview_config                    = {
    border = 'rounded',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm                              = {
    enable = false
  },
  keymaps                           = {
    noremap = true,
    ['n <leader>p'] = '<cmd> lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>i'] = '<cmd> lua require"gitsigns".blame_line()<CR>',
    ['n ]c'] = { expr = true, "&diff ? '[c' : '<cmd> lua require\"gitsigns\".prev_hunk()<CR>'" },
    ['n [c'] = { expr = true, "&diff ? ']c' : '<cmd> lua require\"gitsigns\".next_hunk()<CR>'" },
    -- ['n ghr'] = '<cmd> lua require"gitsigns".toggle_deleted()<CR>',
  }
}
