set encoding=utf-8

" oCaml
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')

filetype plugin indent on    " required
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'hashivim/vim-terraform'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'haya14busa/incsearch.vim'

Plug 'vim-syntastic/syntastic'

Plug 'gkjgh/cobalt'

call plug#end()

"code folding
set foldmethod=syntax   
set foldnestmax=10
set nofoldenable
set foldlevel=2

"python repl
"nnoremap <C-c><C-c> :QuickRun<CR>


filetype plugin on

"numbering
set number
set relativenumber
syntax enable
set t_Co=256
set autoindent
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=3
" when indenting with '>', use 4 spaces width
set shiftwidth=3
" on pressing tab, insert 4 spaces
set expandtab
set timeoutlen=0500 ttimeoutlen=0
" set so=999

" center everything
let &scrolloff=999-&scrolloff

set showcmd
set mouse =""

" LaTeX markup

" Airline configuration --------------------------------------
let g:airline_powerline_fonts=1
let g:Powerline_symbols='unicode'
let g:airline_theme='powerlineish'
set laststatus=2
" Tabline config--------------------------------------------
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
  let g:airline#extensions#tabline#buffer_idx_mode = 1


function! AirlineInit()
    let g:airline_section_a = airline#section#create_left(['mode'])
    let g:airline_section_b = airline#section#create(['%t'])
    let g:airline_section_c = airline#section#create(['%{airline#util#wrap(airline#parts#filetype(),0)}'])
    let g:airline_section_x = airline#section#create(['%{airline#util#wrap(airline#parts#ffenc(),0)}'])
    let g:airline_section_y = airline#section#create(['%3p%% %#__accent_bold#%{g:airline_symbols.linenr}%4l%#__restore__#:%3v'])
    let g:airline_section_z = airline#section#create(['p: %{@"}'])
    let g:airline_section_error = ''
    let g:airline_section_warning = ''
      let g:airline#extensions#default#section_truncate_width = {                         
          \ 'b': 79,                                                                      
          \ 'x': 60,                                                                      
          \ 'y': 88,                                                                      
          \ 'z': 5,
      \}
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" THEMING
    " MODALITY
        " Mode Background color changer-------------------------------
        function! InsertStatuslineColor(mode)
          if a:mode == 'i'
            hi Normal ctermbg=236 guibg=#000000
          elseif a:mode == 'r'
            hi Normal ctermbg=52 guibg=#000000
          else
            hi Normal ctermbg=3 guibg=#000000
          endif
        endfunction
        " set default color
        hi Normal ctermbg=232 guibg=#000000
    " CURSOR
        set cursorcolumn
        set cursorline
        hi CursorColumn cterm=NONE     ctermbg=235    ctermfg=NONE   guibg=darkred  guifg=black
        hi CursorLine   cterm=NONE     ctermbg=235    ctermfg=NONE   guibg=darkred  guifg=black
        " hi Cursor       cterm=NONE     ctermbg=232     ctermbg=0    guibg=NONE     guifg=NONE


" payload
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi Normal ctermbg=232 guibg=#000000

" syntastic
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch


colorscheme cobalt
:set rtp+=<SHARE_DIR>/merlin/vim
