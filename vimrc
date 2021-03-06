" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


" ============================= General Config ================================
set number								" Enable line numbers
set backspace=indent,eol,start			" Allow backspace in insert mode
set history=1000						" Number of history commands to save
set ruler								" Show the cursor position all the time
set showcmd								" Display incomplete commands
set incsearch							" Do incremental searching
set nobackup							" Do not create backup file
set noswapfile            " Do not create .swp files
set autoread							" Reload files changed outside vim
syntax on								" Enable syntax highlighting
set hlsearch							" Highlight last used search pattern
set hidden								" Enable buffer persistence in background

" Enable mouse navigation
if has("mouse")
    set mouse=a
endif

" Enable visual whitespace
set list listchars=tab:\ \ ,trail:·


" ============================== Indentation ==================================
filetype plugin on
filetype indent on
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab


" ================================= Folding ===================================
set foldmethod=indent					" Fold based on indent
set foldnestmax=3						" Deepest fold is 3 levels
set nofoldenable						" Don't fold by default


" =============================== Completion ==================================
set wildmode=list:longest
set wildmenu							" Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~				" Stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif


" ================================ Scrolling ==================================
set scrolloff=8							" Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" ========================= Line number coloring ==============================
highlight LineNr ctermfg=lightgrey		" Line number foreground
highlight LineNr ctermbg=black			" Line number background


" ===================== Useful customisation/functions ========================

" Command to show diff between loaded file and current
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" Tweak undo behaviour
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


" Jump to last edit position when opening file
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


" Allow :w!! to ask for sudo permission
cmap w!! %!sudo tee > /dev/null %


" =================== Load Powerline and required options =====================
if filereadable("/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim")
  source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
elseif filereadable("/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/plugin/powerline.vim")
  source /usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/plugin/powerline.vim
elseif filereadable("/home/orangen/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim")
  source /home/orangen/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
endif


set laststatus=2		" Always show two-line statusbar
set noshowmode			" Hide the default 'insert' text in the statusbar
