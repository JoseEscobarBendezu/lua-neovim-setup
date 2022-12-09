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
  let match = inputlist(['1. first match', '2. all current line', '3. all match in file'])
  if(match == 1)
    execute 's/'.search.'/'.replacement.'/'
  endif
  if(match == 2)
    execute 's/'.search.'/'.replacement.'/g'
  endif
  if(match == 3)
    execute '%s/'.search.'/'.replacement.'/g'
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

local opts = { noremap = true, silent = true }
local opts_show = { noremap = true, silent = false }
local keymap = vim.api.nvim_set_keymap

-- keymap("n", "q", vim.api.nvim_call_function("close_window()"), opts)
keymap("n", "r", "<C-r>", opts)
keymap("n", "w", ":w<CR>", opts)
-- keymap("n", "m", ":q<CR>", opts)

keymap("i", "<C-q>", "<Esc>", opts)
keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-j>", "<Down>", opts)

keymap("n", "<leader>e", "<Plug>(easymotion-overwin-f2)", opts)
-- keymap("n", "<A-p>", ":wincmd p<CR>", opts)
-- keymap("n", "<C-m>", "<Plug>MarkdownPreviewToggle<cr>", opts_show)
keymap("n", "Q", ":%bd|e#|bd#<cr>|'\"", opts_show)
