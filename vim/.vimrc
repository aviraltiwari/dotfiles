set number
filetype plugin on
syntax on

set showcmd
execute pathogen#infect()
set splitright

set autoread  

color onehalfdark 
set laststatus=2

set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>
nmap <silent> <F9> :NERDTreeToggle<CR>

let NERDTreeDirArrows = 1

let NERDTreeMinimalUI = 1


set noswapfile
set nobackup
set nowb


" faster tab navigation
nnoremap <S-tab> :tabprevious<CR>
nnoremap <tab> :tabnext<CR>

" use system clipboard by default
set clipboard=unnamed 

"Faster mapping for split shifting
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Set scroll below 5 lines after the cursor
set scrolloff=5

set ruler
set ttyfast
set backspace=indent,eol,start
set laststatus=2

" always show tab line to avoid annoying resize
set showtabline=2

set cursorline   
hi CursorLine term=bold cterm=bold guibg=Grey20
highlight LineNr ctermfg=lightgreen cterm=bold ctermbg=black

"let g:pymode_python = 'python3'


let g:virtualenv_directory = '~/' 
let g:virtualenv_auto_activate=1


nmap <F8> :TagbarToggle<CR>


au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix


au BufNewFile,BufRead *.js,*.html,*.css
    set tabstop=2 |
    set softtabstop=2 |
    set shiftwidth=2 |



set encoding=utf-8

let &runtimepath.=',~/.vim/bundle/ale'


"let g:airline#extensions#ale#enabled = 1

let g:ale_emit_conflict_warnings = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:flake8_show_in_gutter=1  " show
let g:flake8_show_in_file=1  " show
autocmd BufWritePost *.py call Flake8()



au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

let python_highlight_all=1



map <Leader>n <plug>NERDTreeTabsToggle<CR>

