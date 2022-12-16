local opts = { noremap = true, silent = true }
local opts_show = { noremap = true }
local keymap = vim.api.nvim_set_keymap

vim.cmd([[
let mapleader = " "
function! s:AskForConfirmation(message, command) abort
  echohl WarningMsg
  echom 'Are you sure '.. a:message ..'?'
  while 1
    let choice = inputlist(['1. yes', '2. no'])
    if choice == 'q' || choice == ''
      return
    endif
    if choice == 0 || choice > 2
      redraw!
      echohl WarningMsg
      echo 'Please enter a number between 1 and 3'
      echohl None
      continue
    elseif choice == 1
      echom ' ...'
      exec a:command
      return
    endif
    return
  endwhile
endfunction

noremap <leader>re :call <SID>AskForConfirmation('reset HEAD for this branch ',':Git reset HEAD~1')<CR>

noremap <leader>ps :call <SID>AskForConfirmation('push commit ',':Git push')<CR>
]])

function DiffviewToggle()
	local lib = require("diffview.lib")
	local view = lib.get_current_view()
	if view then
		-- Current tabpage is a Diffview; close it
		vim.cmd(":DiffviewClose")
		require("indent_blankline.commands").enable()
	else
		-- No open Diffview exists: open a new one
		vim.cmd(":DiffviewOpen")
	end
end

keymap("n", "<leader>gs", ":G<CR>", opts)
keymap("n", "<leader>up", ":Git push --set-upstream origin ", opts_show)

keymap("n", "<leader>fe", ":Git fetch --all -p<CR>", opts_show)
keymap("n", "<leader>pl", ":Git pull<CR>", opts_show)

keymap("n", "<leader>ss", ":Git stash save<CR>", opts_show)
keymap("n", "<leader>sp", ":Git stash pop<CR>", opts_show)

-- keymap("n", "<leader>m", "<cmd> lua DiffviewToggle()<CR>", opts)
keymap("n", "<leader>dh", ":DiffviewFileHistory<CR>", opts)
keymap("n", "<leader>do", ":DiffviewOpen<CR>", opts)
keymap("n", "<leader>dc", ":DiffviewClose<CR>", opts)
