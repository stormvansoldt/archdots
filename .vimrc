"
"       (_)                   
" __   ___ _ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"
"                             


" Set compatibility to Vim only
set nocompatible

" Set tabstop and shiftwidth to 4 spaces, and replace tabs with spaces
set ts=4 sw=4

" Set line numbering
set number

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting
syntax on

"
" COLORS AND STUFF
"

let base16colorspace=256  " Access colors present in 256 colorspace

" Set overall color scheme
colorscheme wombat

"
" VUNDLE
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
""""""""""""""""""""""""""
" PLUGINS "

"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'itchyny/lightline.vim'
"Plugin 'edkolev/tmuxline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/vim-gitbranch'

""""""""""""""""""""""""""
call vundle#end()
filetype plugin indent on

"""""""""""""""""
""  LIGHTLINE  ""
"""""""""""""""""
" Configuration for the status line
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'LightlineGitbranch'
    \ },
    \ }

" Function for setting the git branch
function! LightlineGitbranch()
    if exists('*gitbranch#name')
        let branch = gitbranch#name()
    return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

set laststatus=2    " Required for lightline to show up

""""""""""""""""""
""   TMUXLINE   ""
""""""""""""""""""
" Set tmuxline theme to lightline
"let g:tmuxline_theme = 'lightline'

" Turn off powerline icons
"let g:tmuxline_powerline_separators = 0

" Set a custom tmuxline preset
"let g:tmuxline_preset = {
"   \'a'    : '#a',
"   \'b'    : '#W',
"   \'c'    : '#(pwd)',
"   \'win'  : '#I #W',
"   \'cwin' : '#I #W',
"   \'x'    : '%a',
"   \'z'    : '#H'}

" Turn off modelines because we don't need them
set modelines=0

" Automatically wrap text that extends beyond the screen length
set wrap

" Set status bar to PowerLine
"set rtp+=/usr/local/lib/python3.7/dist-packages/powerline/bindings/vim
set t_Co=256

" Display options
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between
set matchpairs+=<:>

" Encoding
set encoding=utf-8

"
" KEYBINDINGS
"

" Switch between splits with CTRL + H J K L
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map the <Space> key to toggle a selected fold opened/closed
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview"

"
" NETRW SETTINGS
"

" Remove the directory listing banner because we don't need it.
let g:netrw_banner = 0

" Change the list style
let g:netrw_liststyle = 3

" Always open a new file in the 'working file' window
let g:netrw_browse_split = 0

" Misc settings for netrw
let g:netrw_altv = 1
let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Lexplore
" augroup END

set noshowmode      " Prevents the extra mode from displaying

" Remember cursor's position in a file when re-opening it
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

