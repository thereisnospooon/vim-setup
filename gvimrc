set nocompatible              " be iMproved, required
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim


" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Line numbering
set number relativenumber

" Keymaps
:inoremap ( ()<Esc>i
" :inoremap {<CR> {<CR><CR>}i<Up><Tab>
:inoremap {<CR> {<CR><CR>}<Up><Tab><Esc>a
:inoremap [ []<Esc>i


" Indentation
set tabstop=4
set autoindent
set copyindent


filetype on
syntax on 

" colorscheme
let g:gruvbox_contrast_dark = "soft"
set t_Co=256
set background=dark
colorscheme gruvbox

set guifont=Menlo\ Regular:h18
execute pathogen#infect()

map <C-v> :NERDTreeToggle<CR>

" Fixes esc lag using Nerdtree
set ttimeout ttimeoutlen=30

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
