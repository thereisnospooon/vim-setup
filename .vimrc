set nocompatible              " be iMproved, required
filetype off
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

""" Vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree' 
Plugin 'lervag/vimtex'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'honza/vim-snippets'
Plugin 'valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'Cocophotos/vim-ycm-latex-semantic-completer'
filetype plugin indent on
""" End if vundle setup

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Line numbering
set number relativenumber

" Keymaps
":inoremap ( ()<Esc>i
:inoremap {<CR> {<CR><CR>}<Up><Tab><Esc>a
":inoremap [ []<Esc>i


" Indentation
set tabstop=4
set autoindent
set copyindent
set shiftwidth=4


" colorscheme
let g:gruvbox_contrast_dark = "soft"
set t_Co=256
set background=dark
colorscheme gruvbox

set guifont=Menlo\ Regular:h18

"" NERDTree setting
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

" Disable mouse
set mouse=""

"Disable insert label because we have lightline
set noshowmode


" Lightline functionality
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

""" vimtex setting
let maplocalleader = '\'
let g:vimtex_fold_enabled = 1
let g:vimtex_view_method='zathura'
" show little symbols of parans and such.
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" folding
set foldmethod=expr
set foldexpr=vimtex#fold#level(v:lnum)
set foldtext=vimtex#fold#text()
autocmd InsertLeave * write " When leaving Insert mode this will save the file. Used to make vimtex update the PDF.

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['/home/guy/.vim/bundle/vim-snippets/UltiSnips/']

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-s>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
