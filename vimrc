set nocompatible              "Use vim settings, must be first

" --------- Set space chars to be seen
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" set list

" filetype off                  " required
syntax enable
set showcmd     " Show partial commands in the last line of the screen

"" Whitespace
set nowrap                                      " Don't wrap lines
autocmd BufWritePre * :%s/\s\+$//e              " Remove trailing whitespace on write
set tabstop=2 shiftwidth=2 softtabstop=2        " A tab is 8 spaces
set expandtab                                   " Use spaces, not tabs
" set backspace=indent,eol,start                  " Backspace over these in insert mode

"" Searching
set hlsearch    " Highlight matches
set ic  " Case insentitive search
set smartcase   " ...unless there is a capital letter
set wildmenu    " Better command-line completion

"" Line numbers
set number              " Show line numbers
set numberwidth=5       " Minimum no. of columns for line number

"" Status
set ruler               " Show the cursor position all the time
set laststatus=2        " Always (=2) display the status line
set ai

"" Temp files
set backupdir=~/.vim/backup//   " Store backups here
set directory=~/.vim/swp//      " Store swaps here

"" Colour scheme
set background=dark
" colorscheme solarized

"" Mappings
nnoremap <C-L> :nohl<CR><C-L>   " Turn off search highlights

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
" Plugin 'vim-syntastic/syntastic'
Plugin 'leafgarland/typescript-vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'nfvs/vim-perforce'

call vundle#end()
set runtimepath^=~/.vim/bundle/ctrlp.vim

" -------- Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endi

" edge project key map
map <C-b> :!gulp build & gulp coverage<CR>

" -------- Plugin NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" -------- Plugin Typescrit vim
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
filetype plugin indent on
let g:syntastic_typescript_tsc_args = "--experimentalDecorators"

" -------- Plugin vim syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"
" autocmd FileType typescript :set makeprg=tsc

" ------- Plugin Easy motion keys
let mapleader = " "
map <Leader> <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
