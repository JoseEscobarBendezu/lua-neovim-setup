require("impatient")
require("keymaps.basic")

vim.cmd([[
fun! VM_Start()
  nmap <buffer> <C-q> <Esc><Esc>
  "imap <buffer> <C-q> <Esc>
endfun

fun! VM_Exit()
  nunmap <buffer> <C-q>
  "iunmap <buffer> <C-q>
endfun

autocmd BufNewFile,BufRead *.pcss setfiletype css
]])
