" Install Vim Plug if not already here.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""" BEGIN Plug CONFIG """"""
call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-commentary'               " commenting
Plug 'altercation/vim-colors-solarized'   " solarized colorscheme
Plug 'scrooloose/nerdtree'                " file navigation
map <C-n> :NERDTreeToggle<CR>

" Plug 'tpope/vim-fugitive'                 " git support
Plug 'kien/ctrlp.vim'                     " fuzzy search
Plug 'bling/vim-airline'                  " bottom info bar
" Plug 'Valloric/YouCompleteMe'             " code completion
Plug 'airblade/vim-gitgutter'             " git diff in gutter
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'rust-lang/rust.vim'
Plug 'maverickg/stan.vim'
Plug 'highwaynoise/chuck.vim'
Plug 'JuliaEditorSupport/julia-vim'
" Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

" All of your Plugins must be added before the following line
call plug#end()
"""""" END Plug CONFIG """"""

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" Add comments on new line and other cases.
" Was working in some filetypes (like .vim) without this, but not others,
" like python.
set formatoptions+=rco

"""" 1. Vim Behaviour.

" Disable the default Vim startup message.
set shortmess+=I

" Use filetype-based syntax hilighting, ftplugins, and indentation.
syntax on
filetype plugin indent on
set encoding=utf-8

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Enables mouse support. Note that on Mac OS X this doesn't work well on the
" default terminal. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

"""" 2. Key Bindings.
" More convenient movement when lines are wrapped.
" 4/28/21: Removed binding, gj and gk correspond to *visual* lines,
"   which are not as nice when working with relative line numbers.
" nmap j gj
" nmap k gk

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

"""" 3. Vim Appearance.
" Search settings
set hlsearch " hilight
" Enable searching as you type, rather than waiting till you press enter.
set incsearch
" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase
" Turn off seach hilighting with <CR>.
nnoremap <CR> :nohlsearch<CR><CR>
" inoremap jk <ESC>

" Treat all numerals as decimals, regardless of whether they are padded with
" zeros. Otherwise <C-a> and <C-x> will increment and decrement the number as
" if it were octal.
set nrformats=

let mapleader = ","

" Tab settings
" https://stackoverflow.com/questions/18415492/autoindent-is-subset-of-smartindent-in-vim/18415867#18415867
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Column number shown
set ruler

" So I don't have to do :set paste and :set nopaste
set pastetoggle=

" COLORSCHEME
" If I ever have problems with Solarized:
" https://stackoverflow.com/questions/7278267/incorrect-colors-with-vim-in-iterm2-using-solarized
" Also, if I ever have to use a default colorscheme, `desert` is the one.
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" vim: set ft=vim foldmethod=marker ts=4 sw=4 tw=80 et :

" Tab completion visual menu
set wildmenu
"set wildmode=longest:full,full

" ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_extensions = ['line']

autocmd BufNewFile,BufRead *.flex set syntax=lex
autocmd BufNewFile,BufRead *.gs set filetype=javascript

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

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
