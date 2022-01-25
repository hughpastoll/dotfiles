" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

" Declare the list of plugins.
Plug 'rust-lang/rust.vim' " Rust syntax
Plug 'dense-analysis/ale' " Multi language linting/analysis.
Plug 'cespare/vim-toml' " Should be useful for rust .toml syntax
Plug 'morhetz/gruvbox' " Colour scheme
Plug 'junegunn/fzf' " Fuzzy search utility
Plug 'junegunn/fzf.vim' " Vim specific fzf
Plug 'tpope/vim-surround' " Delete/change surrounding characters
Plug 'tpope/vim-commentary' " Enable toggle comments
Plug 'vim-airline/vim-airline' " Adds configurable status bar
Plug 'scrooloose/nerdtree' " Adds file navigator
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set number " Turns on line numbering
set relativenumber " Turns on relative line numbering
set splitbelow " To open completion previews below

syntax enable
filetype plugin indent on

set tabstop=4 " show existing tabs as 4 spaces
set shiftwidth=4 " using '>' indents 4 spaces
set expandtab " pressing 'tab' inserts n=*tabstop* spaces

set textwidth=0 " Prevent new lines being triggered at character limit
set colorcolumn=80 " Add visual cue for ideal character limit

let g:ale_linters = {'rust': ['analyzer']}
let g:ale_sign_column_always = 1
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_completion_enabled = 1

let mapleader = " " " map leader key to Space (default is '/')

nnoremap <leader>n :NERDTreeFocus<CR> " Focus on Nerdtree
nnoremap <leader>t :NERDTreeToggle<CR> " For hiding 

" Activate the colorscheme (note the US spelling) after specifying colorscheme
" configs
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox

" Printing options: (:hardcopy (:ha) > 'fileout.ps' to print to file)
set printoptions=number:y " Add line numbers to output
