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
noremap <leader>t :call <SID>AskForConfirmation('push commit ',':Git push')<CR>

nmap <leader>m <plug>(MergetoolToggle)<CR>
nmap <leader>a :diffget<CR>
nmap <leader>l :e<CR>
]]

keymap("n", "<leader>g", ":G<CR>", opts)
keymap("n", "<leader>u", ":Git push --set-upstream origin ", opts)
keymap("n", "<leader>f", ":Git fetch --all -p<CR>", opts)

keymap("n", "<leader>p", ":Git pull<CR>", opts_show)

-- keymap("n", "<F9>", ":G<CR>", opts)
-- keymap("n", "<F10>", ":Git push<CR>", opts)
-- keymap("n", "<F12>", ":Git reset HEAD~1<CR>", opts)
-- keymap("n", "0", ":Git push --set-upstream origin ", opts)
-- keymap("n", "-", ":Git fetch --all -p<CR>", opts)
-- keymap("n", "=", ":Git pull<CR>", opts)
