call plug#begin()
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/tagbar'
Plug 'luochen1990/rainbow'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'tommcdo/vim-lion'
Plug 'Shirk/vim-gas'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
call plug#end()

" Get syntax files from config folder
set runtimepath+=~/.config/nvim/syntax

let mapleader = ' '
" Theme
colorscheme gruvbox

" Disable C-z from job-controlling neovim
nnoremap <c-z> <nop>

" Remap C-c to <esc>
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>

" Syntax highlighting
syntax on

" Position in code
set number
set ruler

" Don't make noise
set visualbell

" default file encoding
set encoding=utf-8
set number relativenumber
" Line wrap
set wrap

" Function to set tab width to n spaces
function! SetTab(n)
    let &l:tabstop=a:n
    let &l:softtabstop=a:n
    let &l:shiftwidth=a:n
    set expandtab
endfunction

command! -nargs=1 SetTab call SetTab(<f-args>)

" Function to trim extra whitespace in whole file
function! Trim()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command! -nargs=0 Trim call Trim()

set laststatus=2

" Highlight search results
set hlsearch
set incsearch

" auto + smart indent for code
set autoindent
set smartindent

set t_Co=256
syntax enable
set noswapfile

" ASM == JDH8
augroup jdh8_ft
  au!
  autocmd BufNewFile,BufRead *.asm    set filetype=jdh8
augroup END

" SQL++ == SQL
augroup sqlpp_ft
  au!
  autocmd BufNewFile,BufRead *.sqlp   set syntax=sql
augroup END

" .S == gas
augroup gas_ft
  au!
  autocmd BufNewFile,BufRead *.S      set syntax=gas
augroup END

" JFlex syntax highlighting
 augroup jfft
   au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
 augroup END
 au Syntax jflex    so ~/.vim/syntax/jflex.vim

 " Mouse support
 set mouse=a

 " Map F8 to Tagbar
 nmap <F8> :TagbarToggle<CR>

 " disable backup files
 set nobackup
 set nowritebackup

 " no delays!
 set updatetime=300

 set cmdheight=1
 set shortmess+=c

 set signcolumn=yes

 set scrolloff=7
 set backspace=indent,eol,start
 set fileformat=unix

 let g:airline_theme='gruvbox'
 if (has("termguicolors"))
   set termguicolors
 endif

 lua require 'colorizer'.setup()
 nmap ÷ <Plug>NERDCommenterToggle
 vmap ÷ <Plug>NERDCommenterToggle<CR>gv
 let NERTTreeQuitOnOpen=1
 let g:NERTTreeMinimalUI=1
 nmap <F2> :NERDTreeToggle<CR>
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
 nmap <leader>1 :bp<CR>
 nmap <leader>2 :bn<CR>
 nmap <C-w> :bd<CR>

 let g:jedi#environment_path = "/usr/bin/python3"
let g:jedi#completions_enabled = 0
let g:deoplete#sources#jedi#python_path = "/usr/bin/python3"
let g:deoplete#enable_at_startup = 1
