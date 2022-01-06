filetype plugin indent on
set backspace=indent,eol,start                          " Allow backspacing over everything in insert mode
syntax on                                               " Syntax highlighting
set t_Co=256                                            " Number of colors the terminal supports
set expandtab                                           " Make a tab to spaces, num of spaces set in tabstop
set shiftwidth=4                                        " Number of spaces to use for autoindenting
set tabstop=4                                           " A tab is four spaces
set smarttab                                            " Insert tabs at the start of a line according
set list                                                " Show invisible characters
set listchars=tab:>·,trail:·                            " ..But only show tabs and trailing whitespace
set numberwidth=3                                       " Line number width
set laststatus=2                                        " Always show the statusline
au FileType ruby set softtabstop=2 sw=2 ts=2            " 2 soft tabs for ruby scripts

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight NonText ctermfg=8 guifg=gray

nmap <f2> :set number! number?<cr>                      " F2 to toggle line numbers

" Plugins
call plug#begin()

Plug 'http://github.com/tpope/vim-surround'             " Surrounding
Plug 'https://github.com/preservim/nerdtree'            " NerdTree
Plug 'https://github.com/tpope/vim-commentary'          " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline'       " Status bar
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " Fuzzy finder
Plug 'junegunn/fzf.vim'                                 " Yes, 2 times

Plug 'mhinz/vim-startify'                               " Statup screen

Plug 'Yggdroot/indentLine'                              " Shows line indentation
Plug 'rodjek/vim-puppet'                                " For Puppet code

" End Plugins
call plug#end()

map <C-n> :NERDTreeToggle<CR>                          " Toggle NerdTree with ctrl+n

nnoremap <F5> :!%:p                                    " Execute current file

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction
autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()
" End Removes trailing spaces

" vim indent plugin https://github.com/Yggdroot/indentLine (disabled by default)
let g:indentLine_char = '┆'
let g:indentLine_enabled = 0
nmap <f3> :IndentLinesToggle<cr>

" https://github.com/dracula/vim/issues/96
let g:dracula_colorterm = 0
:colorscheme dracula

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

