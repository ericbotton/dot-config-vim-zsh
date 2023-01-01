" .vimrc
source $VIMRUNTIME/vimrc_example.vim
" URL: https://vim.wikia.com/wiki/Example_vimrc
" Authors: https://vim.wikia.com/wiki/Vim_on_Libera_Chat
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif
" Enable syntax highlighting
if has('syntax')
  syntax on
endif
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
" Better command-line completion
set wildmenu
" Show partial commands in the last line of the screen
set showcmd
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
" Always display the status line, even if only one window is displayed
set laststatus=2
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
" Use visual bell instead of beeping when doing something wrong
set visualbell
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
" Enable use of the mouse for all modes
if has('mouse')
  set mouse=a
endif
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
" Display line numbers on the left
set number
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
"------------------------------------------------------------
" BEGIN edb vimrc
" Plug plugins
call plug#begin()
  Plug 'altercation/vim-colors-solarized'
  Plug 'easymotion/vim-easymotion'
  Plug 'haishanh/night-owl.vim'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'junegunn/vim-easy-align'
  Plug 'kien/ctrlp.vim'
  Plug 'mattn/emmet-vim'
  Plug 'PhilRunninger/nerdtree-visual-selection'
  Plug 'scrooloose/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'tpope/vim-commentary'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'w0rp/ale'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
" let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
" set vim-airline theme
let g:airline_theme='simple'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => set solarized color scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"syntax enable
"set background=light
"colorscheme solarized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => night-owl color scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set termguicolors
" syntax enable
" colorscheme night-owl
" let g:lightline = { 'colorscheme' : 'nightowl' }
" list plugins on startup
fun! Start()
    " Don't run if: we have commandline arguments, we don't have an empty
    " buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
    if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        return
    endif
    " Start a new buffer ...
    enew
    " ... and set some options for it
    setlocal
        \ bufhidden=wipe
        \ buftype=nofile
        \ nobuflisted
        \ nocursorcolumn
        \ nocursorline
        \ nolist
        \ nonumber
        \ noswapfile
        \ norelativenumber
    " Now we can just write to the buffer, whatever you want.
    call append('$', "Plugins:")
    call append('$', "----")
    call append('$', "Plug 'altercation/vim-colors-solarized'")
    call append('$', "Plug 'easymotion/vim-easymotion'")
    call append('$', "Plug 'haishanh/night-owl.vim'")
    call append('$', "Plug 'jistr/vim-nerdtree-tabs'")
    call append('$', "Plug 'junegunn/vim-easy-align'")
    call append('$', "Plug 'kien/ctrlp.vim'")
    call append('$', "Plug 'mattn/emmet-vim'")
    call append('$', "Plug 'PhilRunninger/nerdtree-visual-selection'")
    call append('$', "Plug 'scrooloose/nerdtree'")
    call append('$', "Plug 'tiagofumo/vim-nerdtree-syntax-highlight'")
    call append('$', "Plug 'tpope/vim-commentary'")
    call append('$', "Plug 'vim-airline/vim-airline'")
    call append('$', "Plug 'vim-airline/vim-airline-themes'")
    call append('$', "Plug 'w0rp/ale'")
    call append('$', "=================")
    call append('$', "NERDTree keybinds")
    call append('$', "=================")
    call append('$', "\\nn :NERDTreeToggle<cr> ")
    call append('$', "\\nb :NERDTreeFromBookmark<Space> ")
    call append('$', "\\nf :NERDTreeFind<cr> ")
    " No modifications to this buffer
    setlocal nomodifiable nomodified
    " When we go to insert mode start a new buffer, and start insert
    nnoremap <buffer><silent> e :enew<CR>
    nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
endfun
" Run after "doing all the startup stuff"
autocmd VimEnter * call Start()
" Vundle installs youcompleteme
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " Plugin 'valloric/youcompleteme' " <= 2GB required
cal vundle#end()
" BEGIN settings
scriptencoding utf-8
set encoding=utf-8
set incsearch
set display+=lastline
set scrolloff=4
set sidescrolloff=4
set listchars=eol:$,tab:>-,trail:>,precedes:<,trail:-
set linebreak
set nobackup
set wildmenu
set nowritebackup
set noundofile
set linebreak
"set lines=43 columns=83 <-- gvim only
