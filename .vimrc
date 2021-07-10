set autoindent
set tabstop=4
set ts=4
set nu!
set title
set encoding=utf-8 " Importante para o YCM
set nowrap
"set textwidth=79
set formatoptions=tcqrn1
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set showcmd
set encoding=utf-8
set ruler

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * wincmd p

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinPos = "right"
let NERDTreeQuitOnOpen = 1

map <C-n> :NERDTreeToggle<CR>

noremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>i
vnoremap <C-s> <Esc>:w<CR>v

inoremap { {} 
inoremap [ []
inoremap ( ()
inoremap ' ''
inoremap " ""
inoremap ` ``

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'

Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'fatih/vim-go', { 'tag': '*' }

Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug '~/my-prototype-plugin'

Plug 'arcticicestudio/nord-vim'

Plug 'bluz71/vim-nightfly-guicolors'

Plug 'valloric/youcompleteme'

Plug 'valloric/youcompleteme'

Plug 'pangloss/vim-javascript'

Plug 'scrooloose/nerdtree'

Plug 'tomlion/vim-solidity'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'dracula/vim'

call plug#end()

let g:nord_italic = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
"let g:javascript_conceal_noarg_arrow_function = "🞅"
"let g:javascript_conceal_underscore_arrow_function = "🞅"

		
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''



set conceallevel=1
syntax on
set termguicolors
"colorscheme nord
colorscheme dracula

function! InsertUm()
endfunction

function! GenerateHTML()
    call append(0, '≲!DOCTYPE html>')
    call append(1, '<html lang="en">')
    call append(2, '<head>')
    call append(3, '    <meta charset="UTF-8">')
    call append(4, '    <meta http-equiv="X-UA-Compatible" content="IE=edge">')
    call append(5, '    <meta name="viewport" content="width=device-width, initial-scale=1.0">')
    call append(6, '    <title>Document</title>')
    call append(7, '</head>')
    call append(8, '<body>')
    call append(9, ' ')
    call append(10, '</body>')
    call append(11, '</html>') 

endfunction

function! GenarateCMain() 
    call append(0, '#include<stdio.h>')
    call append(1, ' ')
    call append(2, '')
    call append(3, 'int main() {')
    call append(4, ' ')
    call append(5, '    return 0;')
    call append(6, '}')

endfunction

function! InsertJavaPackage()
  let filename = expand("%")
  let filename = substitute(filename, "\.java$", "", "")
  let dir = getcwd() . "/" . filename
  let dir = substitute(dir, "^.*\/src\/", "", "")
  let dir = substitute(dir, "\/[^\/]*$", "", "")
  let dir = substitute(dir, "\/", ".", "g")
  let filename = substitute(filename, "^.*\/", "", "")
  let dir = "package " . dir . ";"
  let result = append(0, dir)
  let result = append(1, "")
  let result = append(2, "class " . filename . " {")
  let result = append(4, "}")
endfunction

function! GenerateClassJava() 
    let s = call norm@%
    call append(0, s) 
endfunction

autocmd BufNewFile *.html call GenerateHTML()
autocmd BufNewFile *.c call GenarateCMain()
autocmd BufNewFile *.java call InsertJavaPackage()
