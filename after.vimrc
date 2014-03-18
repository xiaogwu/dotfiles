" Set indent line character
"let g:indentLine_char = '┆'
"let g:indentLine_char = '▸'
let g:indentLine_char = '¦'

" NERDTress Ignores
let NERDTreeIgnore=['\.db$']

" Set colorscheme options
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" Set font and size
set guifont=Monaco:h11

" Toggle spell checking
nmap <silent> <leader>sp :setlocal spell! spelllang=en_us<CR>

" Syntax Toggle highlighting
map <leader>ts :if exists("g:syntax_on") <Bar>
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

" Paste content from OS's clipboard
nnoremap <leader>pi "*p

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

" Set start fold level
set foldlevelstart=1

" More natural splits
set splitbelow
set splitright

" Disable Autosave
set ei=FocusLost

" Syntastic Settings
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'], 'passive_filetypes': ['html', 'css', 'slim', 'js'] }
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_css_checkers=['csslint']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
nmap <silent> <leader>st :SyntasticToggleMode<CR>
nmap <silent> <leader>si :SyntasticInfo<CR>
nmap <silent> <leader>sc :SyntasticCheck<CR>

" Reload $MYVIMRC
nnoremap <leader>sv :so $MYVIMRC<CR>

" Create new file under cursor
map <leader>gf :e <cfile><cr>

" Show Current Line Number
set invnumber

" CTRLP
let g:ctrlp_cmd = 'CtrlPMixed'

" Easybuffer
nmap <leader><tab> :EasyBufferToggle<enter>

" Scratchpad
nnoremap <silent> <leader><leader>sp :ScratchToggle<cr>