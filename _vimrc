
" Start maximized
"au GUIEnter * simalt ~x

" File type mapping
autocmd BufRead,BufNewFile *.vb setlocal filetype=vbnet
autocmd FileType ruby,eruby call UseRubyIndent()

" Use CUA keystrokes for clipboard: CTRL-X, CTRL-C, CTRL-V and CTRL-z
source $VIMRUNTIME/mswin.vim

" Sets the current working directory based on the file being edited.
autocmd BufEnter * lcd %:p:h

" Map backward/forward buffer navigation with Ctrl + left/right.
map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>

" F5 mapping for executing scripts.
map <F5> <ESC>:!%<CR>

syntax on
set nocompatible
filetype on
filetype indent on
filetype plugin on

" General options.
set incsearch
set ignorecase smartcase 

" Use two space tabs.
set tabstop=2
set shiftwidth=2
set expandtab

" Setup 80 column word wrap.
set wrap 
set linebreak 
set textwidth=80


" Map Ctrl + F2 to add/remove GUI options.
map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>
                      \set guioptions-=T <Bar>
                      \set guioptions-=m <Bar>
                    \else <Bar>
                      \set guioptions+=T <Bar>
                      \set guioptions+=m <Bar>
                    \endif<CR>

" Consolas font.
set guifont=Consolas:h13:cANSI

highlight Normal guifg=White   guibg=Black
highlight Cursor guifg=Black   guibg=Yellow
highlight Keyword guifg=#FF6600
highlight Define guifg=#FF6600
highlight Comment guifg=#9933CC
highlight Type guifg=White gui=NONE
highlight rubySymbol guifg=#339999 gui=NONE
highlight Identifier guifg=White gui=NONE
highlight rubyStringDelimiter guifg=#66FF00
highlight rubyInterpolation guifg=White
highlight rubyPseudoVariable guifg=#339999
highlight Constant guifg=#FFEE98
highlight Function guifg=#FFCC00 gui=NONE
highlight Include guifg=#FFCC00 gui=NONE
highlight Statement guifg=#FF6600 gui=NONE
highlight String guifg=#66FF00
highlight Search guibg=White


" Ruby syntax token evaluator.
function RubyEndToken ()

  let current_line = getline( '.' )
  let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
  let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
  let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

  if match(current_line, braces_at_end) >= 0
    return "\<CR>}\<C-O>O" 
  elseif match(current_line, stuff_without_do) >= 0
    return "\<CR>end\<C-O>O" 
  elseif match(current_line, with_do) >= 0
    return "\<CR>end\<C-O>O" 
  else
    return "\<CR>" 
  endif

endfunction

function UseRubyIndent ()
  
  setlocal tabstop=8
  setlocal softtabstop=2
  setlocal shiftwidth=2
  setlocal expandtab
  imap <buffer> <CR> <C-R>=RubyEndToken()<CR>

endfunction

map ,# :s/^/#/<CR>
map <M-]> :tabnext<CR>
map <M-[> :tabprevious<CR>
map <M-t> :tabnew<CR>
imap <M-]> :tabnext<CR>
imap <M-[> :tabprevious<CR>
imap <M-t> :tabnew<CR>
