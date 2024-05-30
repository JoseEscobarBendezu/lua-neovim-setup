require("core") -- call global configurations

--empaquetador -> lazy ✅
--tema -> kanagawa ✅
--syntaxis --> treesitter ? ✅
--lsp --> lsp_zero ✅
--prettier --> conform
--linter --> lint
--statusbar --> lualine ✅
--git --> lazygit + diff + gitsigns ✅
--gestor de archivos --> telescope ✅

-- echo "export PATH=\"/home/jose-fedora-37/.local/bin:\$PATH\"" >> ~/.bashrc && source ~/.bashrc
vim.cmd([[
  if has('nvim') && executable('nvr')
    let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
  endif
]])
