call plug#begin('~/.vim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'chriskempson/base16-vim'
Plug 'terryma/vim-multiple-cursors'

call plug#end()

set number
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set belloff=all
set noswapfile
set scrolloff=5
set autoindent
set paste
set cursorline
set termguicolors
set nocompatible
syntax on
filetype indent on

colorscheme gruvbox

inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

inoremap <expr> <bs> <sid>remove_pair()
imap <c-h> <bs>

function s:remove_pair() abort
	let pair = getline('.')[ col('.')-2 : col('.')-1 ]
	return stridx('""''''()[]<>{}', pair) % 2 == 0 ? "\<del>\<c-h>" : "\<bs>"
endfunction

inoremap " ""<c-g>U<left>
highlight link LspErrorText GruvboxRedSign " requires gruvbox
highlight clear LspWarningLine
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

let g:lsp_highlight_references_enabled = 1
