colorscheme jummidark

set tabstop=2
set shiftwidth=2
set expandtab
set number
set nuw=6

autocmd FileType rs setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType js setlocal shiftwidth=2 tabstop=2 expandtab

call plug#begin()
Plug 'ncm2/ncm2'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/NERDTree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" Keymappings
" Alt+q toggles NERDTree
map <A-q> :NERDTreeToggle<CR>

"Makes capital W and Q work the same as lowercase
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W') ?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q') ?('q'):('Q'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq') ?('wq'):('Wq'))

function! s:goyo_enter()    
    set number
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

autocmd VimEnter * Goyo | Limelight
