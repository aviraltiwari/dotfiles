set nu
call plug#begin('~/.vim/plugged')
Plug 'wadackel/vim-dogrun'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'itchyny/lightline.vim'
Plug 'lambdalisue/fern.vim'
Plug 'maralla/completor.vim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'preservim/nerdtree'
Plug 'ayu-theme/ayu-vim'
Plug 'danishprakash/vim-yami'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'https://github.com/ryanoasis/vim-webdevicons'
"Plug 'https://github.com/adelarsq/vim-devicons-emoji'
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"  else
"     Plug 'Shougo/deoplete.nvim'
"     Plug 'roxma/nvim-yarp'
"     Plug 'roxma/vim-hug-neovim-rpc'
" endif
call plug#end()


let g:deoplete#enable_at_startup = 1


set termguicolors
"colorscheme yami
colorscheme dogrun
"colorscheme ayu
"let ayucolor="mirage" 

let g:lightline = {
  \ 'colorscheme': 'dogrun',
  \ }


let g:clap_theme = 'dogrun'

highlight Normal ctermfg=grey ctermbg=black 


set mouse=a


let g:completor_clang_binary = '/usr/bin/clang'


set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

"Doomfind
nnoremap <space>. <cmd>Clap filer<cr> 

"DoomBuffer
nnoremap <space>bb <cmd>Clap buffers<cr> 

"DoomFileManagerLike
nnoremap <space>op <cmd>CHADopen<cr> 

"DiredLike
nnoremap <space>od <cmd>Fern .<cr> 

"To open init file directly
nnoremap <space>fp <cmd>e! ~/.config/nvim/init.vim<cr>


let g:clap_layout = { 'relative': 'editor' }

autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp


let s:clip = '/mnt/c/Windows/System32/clip.exe' 
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    augroup END
end


" Commenting blocks of code.
augroup commenting_blocks_of_code
autocmd!
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>



command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0)
