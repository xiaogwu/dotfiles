" Set indent line character
let g:indentLine_char = '¦'

" NERDTress Ignores
let NERDTreeIgnore=['\.db$']

" Set font and size
:set guifont=Monaco:h12

" Toggle spell checking
nmap <silent> <leader>sc :setlocal spell! spelllang=en_us<CR>

" Toggle syntax highlighting
map <leader>st :if exists("g:syntax_on") <Bar>
    \   syntax off <Bar>
    \ else <Bar>
    \   syntax enable <Bar>
    \ endif <CR>
