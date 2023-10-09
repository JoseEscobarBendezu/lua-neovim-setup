require("core") -- call global configurations

--empaquetador -> lazy ✅
--tema -> kanagawa ✅
--syntaxis --> treesitter ? ✅
--lsp --> lsp_zero ✅
--rettier --> conform
--linter --> lint
--statusbar --> lualine ✅
--git --> fugitive ? + diff + gitsigns ✅
--gestor de archivos --> telescope ✅
--
--
--
-- hay que gestionar los keymaps en los mismos files

local set_keymap_config = function(keymap)
  for mode, keys in pairs(keymap) do
    for key, command in pairs(keys) do
      if key == "<leader>up" or key == "`" or key == "<leader>fe" then
        vim.api.nvim_set_keymap(mode, key, command, { noremap = true, silent = false })
      else
        vim.api.nvim_set_keymap(mode, key, command, { noremap = true, silent = true })
      end
    end
  end
end

local git_diff = {
  ["n"] = {
    ["<leader>gs"] = ":G<CR>",
    ["<leader>up"] = ":Git push --set-upstream origin ",
    ["<leader>fe"] = ":Git fetch --all -p<CR>",
    ["<leader>pl"] = ":Git pull<CR>",
    ["<leader>ss"] = ":Git stash save<CR>",
    ["<leader>sp"] = ":Git stash pop<CR>",
    ["<leader>dh"] = ":DiffviewFileHistory<CR>",
    ["<leader>do"] = ":DiffviewOpen<CR>",
    ["<leader>dc"] = ":DiffviewClose<CR>",
  },
}

set_keymap_config(git_diff)
