local keymaps = require("configurations.keymaps")
local utils = require("configurations.utils")

--delete default keymaps
local delete_default = keymaps.delete_default
utils.delete_keymap_config(delete_default)

--basic config managment keymaps
local basic = keymaps.basic
utils.set_keymap_config(basic)

--view panels managment keymaps
local view_panels_control = keymaps.view_panels_control
utils.set_keymap_config(view_panels_control)

--sidebars managment keymaps
local sidebars = keymaps.sidebars
utils.set_keymap_config(sidebars)

vim.cmd([[

let mapleader = " "

function s:minimize()
  let last_window = winnr('$')
  let i = 0
  let is_repeat = 0

  if last_window > 1
    exec 'quit'
    return
  end
  
endfunction

function s:close_window()

  " is dap session open
  if win_screenpos("%") == [2,40]
    echo 'is dap session'
    exec 'quit'
    return
  end

  let last_window = winnr('$')
  let i = 0
  let is_repeat = 0

  while i < last_window
    let i += 1
    if winbufnr(i) == bufnr("%")
      let is_repeat += 1
    endif
  endwhile

  if is_repeat > 1
    "se repite
    exec 'quit'
    return
  endif

  "es el ultimo?
  if win_screenpos("%") != [2,1] && win_screenpos("%") != [2,42]
    exec ':bdelete'
    return
  endif

  "hay buffers inactivos?
  let buffers = map(filter(copy(getbufinfo()), 'v:val.listed'), 'v:val.bufnr')
  let size_buffers = len(buffers)

  if bufname("%") == "NvimTree_1" && size_buffers == 0
    exec ':quitall'
    return
  endif

  if bufname("%") == "NvimTree_1" && size_buffers == 1
    exec ':NvimTreeClose'
    return
  endif

  if size_buffers == 1
    "no hay mas buffers
    exec ':quitall'
    return
  endif

  "hay mas buffers
  if win_screenpos("%") == [2,42]
    "nvimtree is open
    exec ':NvimTreeClose'
    exec ':bdelete'
    exec ':NvimTreeOpen'
    exec ':wincmd l'
    return
  endif
  
  exec ':bdelete'
  return
endfunction

noremap <silent> q :call <SID>close_window()<CR>
noremap <silent> m :call <SID>minimize()<CR>
]])

vim.cmd([[
function! ReplaceIt()
  let search = input('Search: ')
  call inputrestore()
  let replacement = input('Enter replacement: ')
  call inputrestore()
  echom ' ...'
  let match = inputlist(['1. first match', '2. all current line', '3. all match in file', '4. all match in file with confirmation'])
  if(match == 1)
    execute 's/'.search.'/'.replacement.'/'
  endif
  if(match == 2)
    execute 's/'.search.'/'.replacement.'/g'
  endif
  if(match == 3)
    execute '%s/'.search.'/'.replacement.'/g'
  endif
  if(match == 4)
    execute '%s/'.search.'/'.replacement.'/gc'
  endif
endfunction

nnoremap <A-r> :call ReplaceIt()<cr>
]])

vim.cmd([[
function! FindAll()
  let line=line('.')
  call inputsave()
  let find = input('Search: ')
  call inputrestore()
  execute 'g/'.find.'/#'
  let goTo = input('Go to: ')
  if(goTo == 'q' || goTo == '0')
    execute line
    return
  endif
  execute goTo
endfunction

nnoremap <A-f> :call FindAll()<cr>
]])

-- verife this code:
-- return vim.api.nvim_list_bufs()

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
