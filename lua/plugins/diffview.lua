return {
    'sindrets/diffview.nvim',
    keys = {
      { "<F1>" },
    },
    config = function ()
      local actions = require("diffview.actions")
      require('diffview').setup{
          view = {
            merge_tool = {
              layout = "diff3_mixed",
              disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
            },
          },
          keymaps = {
            view = {
              ["<leader>co"] = actions.conflict_choose("ours"), -- Choose the OURS version of a conflict
              ["<leader>ct"] = actions.conflict_choose("theirs"), -- Choose the THEIRS version of a conflict
              ["<leader>cb"] = actions.conflict_choose("base"), -- Choose the BASE version of a conflict
              ["<leader>ca"] = actions.conflict_choose("all"), -- Choose all the versions of a conflict
              ["<leader>dn"] = actions.conflict_choose("none"), -- Delete the conflict region
            },
          },
        }
    end
}
