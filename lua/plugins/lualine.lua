return{
   'nvim-lualine/lualine.nvim',
   dependencies = { 'nvim-tree/nvim-web-devicons' },
   config = function ()
      local lualine = require("lualine")
      lualine.setup({
        options = {
          icons_enabled = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "%=", "%f" },
          lualine_x = { "diagnostics" },
          lualine_y = { "diff", "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {
          lualine_a = {
            {
              "buffers",
              show_filename_only = true, -- Shows shortened relative path when set to false.
              hide_filename_extension = true, -- Hide filename extension when set to true.
              show_modified_status = true, -- Shows indicator when the buffer is modified.
              mode = 2,
              -- 1: Shows buffer index
              -- 2: Shows buffer name + buffer index
              -- max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
              -- it can also be a function that returns
              -- the value of `max_length` dynamically.
              filetype_names = {
                TelescopePrompt = "Telescope",
                dashboard = "",
                packer = "Packer",
                fzf = "FZF",
                alpha = "Alpha",
                NvimTree = "NvimTree",
              }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
              icons_enabled = true,
              separator = nil,
              symbols = {
                modified = " 💬", -- Text to show when the buffer is modified
                alternate_file = "", -- Text to show to identify the alternate file
                directory = "", -- Text to show when the buffer is a directory
              },
            },
          },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        }})
   end,
}
