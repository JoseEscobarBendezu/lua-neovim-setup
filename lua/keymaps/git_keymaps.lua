local opts = { noremap = true, silent = true }
local opts_show = { noremap = true }
local keymap = vim.api.nvim_set_keymap

vim.cmd[[
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

noremap <leader>r :call <SID>AskForConfirmation('reset HEAD for this branch ',':Git reset HEAD~1')<CR>
noremap <leader>ps :call <SID>AskForConfirmation('push commit ',':Git push')<CR>

" nmap <leader>m <plug>(MergetoolToggle)<CR>
" nmap <leader>a :diffget<CR>
" nmap <leader>l :e<CR>
]]

keymap("n", "<leader>g", ":G<CR>", opts_show)
--keymap("n", "<leader>up", ":Git push --set-upstream origin ", opts)
keymap("n", "<leader>fe", ":Git fetch --all -p<CR>", opts_show)
keymap("n", "<leader>pl", ":Git pull<CR>", opts_show)

keymap("n", "<leader>dc", ":DiffviewClose<CR>", opts)
keymap("n", "<leader>dh", ":DiffviewFileHistory<CR>", opts)
