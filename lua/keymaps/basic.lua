vim.cmd([[

let mapleader = " "

" local opts = { noremap = true, silent = true }
" local keymap = vim.api.nvim_set_keymap
"
" function buffer_name()
"   local buffer_number = vim.fn.bufnr("%")
"   local buffers = vim.fn.map(vim.fn.filter(vim.fn.copy(vim.fn.getbufinfo()), 'v:val.listed'), 'v:val.bufnr')
"   print(buffers)
"   local temp_buffer = 0
"   for _, buffernr in inpairs(buffers) do
"       if buffernr == buffer_number then
"         temp_buffer = 1
"       end
"   end
"   print(temp_buffer .. ' ' .. vim.fn.bufname("%"))
 " end
 "
 " keymap('n', "L", "<cmd>lua buffer_name()<CR>",opts)

function s:close_window()
  let buffers = map(filter(copy(getbufinfo()), 'v:val.listed'), 'v:val.bufnr')
  let size_buffers = len(buffers)

  let temp_buffer = 0
  let buffer_number = bufnr("%")

  for buffernr in buffers
      if buffernr == buffer_number
        let temp_buffer = 1
      endif
  endfor

  if temp_buffer == 0
    exec ':quit'
    return
  endif

  let last_window = winnr('$')
  let i = 0
  let is_open = 0

  while i < last_window
    let i += 1
    if winbufnr(i) == bufnr("%")
      let is_open += 1
    endif
  endwhile

  if is_open > 1
    exec ':quit'
    return
  endif

  if size_buffers == 1
    exec ':quitall'
    return
  endif


  exec ':NvimTreeClose'
  exec ':bdelete'
  return
endfunction


" function s:buffer_name()
"   let buffer_number = bufnr("%")
"   let buffers = map(filter(copy(getbufinfo()), 'v:val.listed'), 'v:val.bufnr')
"   let temp_buffer = 0
"   for buffernr in buffers
"       if buffernr == buffer_number
"         let temp_buffer = 1
"       endif
"   endfor
"   echo temp_buffer .. ' ' .. bufname("%")
" endfunction
"
" noremap L :call<SID>buffer_name()<CR>
noremap <silent> q :call <SID>close_window()<CR>
noremap <silent> Q :%bd\|e#\|bd#<cr>\|'" 
]])

local opts = { noremap = true, silent = true }
local opts_show = { noremap = true, silent = false }
local keymap = vim.api.nvim_set_keymap

keymap("n", "r", "<C-r>", opts)
keymap("n", "w", ":w<CR>", opts)
keymap("n", "m", ":q<CR>", opts)

keymap("i", "<C-q>", "<Esc>", opts)
keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-j>", "<Down>", opts)

keymap("n", "<leader>e", "<Plug>(easymotion-overwin-f2)", opts)
keymap("n", "<C-m>", "<Plug>MarkdownPreviewToggle<cr>", opts_show)
