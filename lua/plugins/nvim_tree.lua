local nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌"
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
}

local list = {
  { key = "u",                            action = "dir_up" },
  { key = "<Tab>",                        action = "cd" },
  { key = "<C-v>",                        action = "vsplit" },
  { key = "<C-x>",                        action = "split" },
  { key = "<C-t>",                        action = "tabnew" },
  { key = "P",                            action = "parent_node" },
  { key = "<CR>",                         action = "edit" },
  { key = "<BS>",                         action = "close_node" },
  { key = "K",                            action = "first_sibling" },
  { key = "J",                            action = "last_sibling" },
  { key = "I",                            action = "toggle_ignored" },
  { key = "H",                            action = "toggle_dotfiles" },
  { key = "R",                            action = "refresh" },
  { key = "a",                            action = "create" },
  { key = "d",                            action = "remove" },
  { key = "r",                            action = "rename" },
  { key = "<C-r>",                        action = "full_rename" },
  { key = "x",                            action = "cut" },
  { key = "c",                            action = "copy" },
  { key = "p",                            action = "paste" },
  { key = "y",                            action = "copy_name" },
  { key = "Y",                            action = "copy_path" },
  { key = "gy",                           action = "copy_absolute_path" },
  { key = "s",                            action = "system_open" },
  { key = "S",                            action = "search_node" },
  { key = "q",                            action = "close" },
  { key = "W",                            action = "collapse_all" },
  { key = "i",                        action = "toggle_file_info" },
}

require'nvim-tree'.setup({
  disable_netrw        = true,
  hijack_netrw         = true,
  open_on_setup        = true,
  ignore_ft_on_setup   = {
    "startify",
  },
  auto_reload_on_write = true,
  open_on_tab          = false,
  hijack_cursor        = false,
  update_cwd           = true,
  hijack_directories   = {
    enable = true,
    auto_open = false,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {'.git', 'node_modules', '.cache'}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    add_trailing = true,
    highlight_opened_files = "icon",
    root_folder_modifier = " =~",
    special_files = { 'Makefile', 'MAKEFILE', '.env.dev', '.env.prod', '.dev.env', '.prod.env' },
    icons = {
      padding = ' ',
      symlink_arrow = '->',
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = false,
      },
      glyphs = nvim_tree_icons,
    },
    group_empty = false,
    highlight_git = true,
  },
  respect_buf_cwd = true,
  create_in_closed_folder = false,
  view = {
    width = 40,
    hide_root_folder = false,
    preserve_window_proportions = true,
    side = 'left',
    mappings = {
      custom_only = true,
      list = list,
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    change_dir = {
      global = true,
    },
    open_file = {
      quit_on_open = false,
      window_picker = {
        enable = false,
        -- exclude = {
        --   filetype = [ 'notify', 'packer', 'qf' ],
        --   buftype = [ 'terminal' ],
        -- },
      }
    }
  }
})
