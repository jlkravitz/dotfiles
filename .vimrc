"""""" BEGIN Plug CONFIG """"""
call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-commentary'               " commenting
Plug 'altercation/vim-colors-solarized'   " solarized colorscheme
Plug 'scrooloose/nerdtree'                " file navigation
map <C-n> :NERDTreeToggle<CR>

Plug 'tpope/vim-fugitive'                 " git support
Plug 'kien/ctrlp.vim'                     " fuzzy search
Plug 'bling/vim-airline'                  " bottom info bar
" Plug 'Valloric/YouCompleteMe'             " code completion
Plug 'airblade/vim-gitgutter'             " git diff in gutter
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'rust-lang/rust.vim'

" All of your Plugins must be added before the following line
call plug#end()
"""""" END Plug CONFIG """"""

" Backspace randomly stopped working in VIM.
" Probably some other source, but this fixes it.
set backspace=indent,eol,start


" So plugins can be extracted to `~/.vim/bundle`.
" execute pathogen#infect()

"""" 1. Vim Behaviour.
" Use filetype-based syntax hilighting, ftplugins, and indentation.
syntax on
filetype plugin indent on
set encoding=utf-8
"filetype plugin on
" Use numbering. Don't use relative numbering as this is slow (especially in
" .tex files).
set number
" Enables mouse support. Note that on Mac OS X this doesn't work well on the
" default terminal.
set mouse=a

"""" 2. Key Bindings.
" More convenient movement when lines are wrapped.
nmap j gj
nmap k gk

"""" 3. Vim Appearance.
" Search settings
set hlsearch " hilight
set incsearch " jump to best fit
" Turn off seach hilighting with <CR>.
nnoremap <CR> :nohlsearch<CR><CR>
" inoremap jk <ESC>

" Treat all numerals as decimals, regardless of whether they are padded with
" zeros. Otherwise <C-a> and <C-x> will increment and decrement the number as
" if it were octal.
set nrformats=

let mapleader = ","

" Tab settings
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
" Make statusline appear even with only single window.
set laststatus=2

" Relative line numbers
set number
set relativenumber

" Column number shown
set ruler

" COLORSCHEME
" If I ever have problems with Solarized:
" https://stackoverflow.com/questions/7278267/incorrect-colors-with-vim-in-iterm2-using-solarized
" Also, if I ever have to use a default colorscheme, `desert` is the one.
set background=dark
colorscheme solarized

" vim: set ft=vim foldmethod=marker ts=4 sw=4 tw=80 et :

" Tab completion visual menu
set wildmenu
"set wildmode=longest:full,full

" ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['line']

autocmd BufNewFile,BufRead *.flex set syntax=lex

" For setting the cursor to where it was before
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" function! ResCur()
"     if line("'\"") <= line("$")
"         normal! g`"
"         return 1
"     endif
" endfunction

" augroup resCur
"     autocmd!
"     autocmd BufWinEnter * call ResCur()
" augroup END


" PINTOS
set tw=79
