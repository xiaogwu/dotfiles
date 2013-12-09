" Set indent line character
let g:indentLine_char = '¦'

" NERDTress Ignores
let NERDTreeIgnore=['\.db$']

" Set font and size
set guifont=Monaco:h12

" Toggle spell checking
nmap <silent> <leader>sc :setlocal spell! spelllang=en_us<CR>

" Toggle syntax highlighting
map <leader>st :if exists("g:syntax_on") <Bar>
    \   syntax off <Bar>
    \ else <Bar>
    \   syntax enable <Bar>
    \ endif <CR>

" Enable mouse support for NERDTree in CLI vim
set mouse=a

" Tell vim to remember certain things when we exit
"   '10  :  marks will be remembered for up to 10 previously edited files
"   "100 :  will save up to 100 lines for each register
"   :20  :  up to 20 lines of command-line history will be remembered
"   %    :  saves and restores the buffer list
"   n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo'"

" Restore cursor to where you left off
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Custom mapping
imap <c-d> <esc>ddi

" Lint.vim
let lint_default = 0
nmap <silent> <leader>lt :LintVimToggle

" Quick editing
nnoremap <leader>mev <C-w>s<C-w>j:e ~/.vim/after.vimrc<cr>

" Searching with vimgrep
nnoremap <leader>fd :execute "noautocmd vimgrep /" . expand("<cword>") .  "/j **" <Bar> clast<CR>
" Include dash as word
set iskeyword+=-

" Emmet modes
let g:user_emmet_mode='inv'

" Emmet filetypes
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss EmmetInstall

" Emmet expand with tab key in inset mode
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
