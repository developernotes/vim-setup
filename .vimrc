set nocompatible

" Assign function usage
set diffexpr=MyDiff()
inoremap <Tab> <C-R>=SmartTab()<cr>

" Assign leader
let mapleader = ","

" Turn off visual bell
set vb t_vb=

" Turn on line numbers
set nu

" Set tab spacing/tabs
set et sw=4 ts=4
set smartindent autoindent

" Enable the wildmenu buffer
set wildmenu

" Set visual mode indent
:vnoremap < <gv
:vnoremap > >gv

" Write swap files to the temp directory
if has("win32") || has("win64")
   set directory=$TMP
else
   set directory=/tmp
end

" Highlight current line
set cursorline

" Allow usage of hidden buffers
set hidden

" Set current working directory based on current file.
autocmd BufEnter * lcd %:p:h

" Map forward/backward buffer navigation.
map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>

" Set Syntax and FileType
syntax on
filetype on
filetype indent on
filetype plugin on

" Set search format
set incsearch
set ignorecase
set smartcase

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>

" Maps Alt-[s.v] to horizontal and vertical split respectively
map <silent> <A-s> :split<CR>
map <silent> <A-v> :vsplit<CR>

" Maps Alt-[n,p] for moving next and previous window respectively
map <silent> <A-n> <C-w><C-w>
map <silent> <A-p> <C-w><S-w>

" Set Omni completion filetype associations
autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

" === Plugin Configuration ===

"Disable Marks by default
let g:showmarks_enable=0

" Configure FuzzyFinder 
map <leader>f :FuzzyFinderFile <C-r>=fnamemodify(getcwd(), ':p')<CR><CR> 
map <leader>b :FuzzyFinderBuffer<CR>
map <leader>d :FuzzyFinderDir<CR>

" Configure NERDTree
map <leader>n :execute 'NERDTreeToggle ' . getcwd()<CR>

