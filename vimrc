""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to autoread when a file is changed from the outside
set autoread

" Source the vimrc file after saving it
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif

"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler

"The commandbar height
set cmdheight=2

"Ignore case when searching
set ignorecase
set smartcase

"Highlight search things
set hlsearch

"Make search act like search in modern browsers
set incsearch

"Don't redraw while executing macros
set nolazyredraw

"Set magic on, for regular expressions
set magic

"Show matching bracets when text indicator is over them
set showmatch

"How many tenths of a second to blink
set mat=2

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"The working directory is always the same as the file we are editing.
"set autochdir


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable

if has("gui_running")
 "colorscheme desert
 colorscheme molokai
endif

"set gfn=Monospace\ 10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab

set lbr
set tw=500

"Auto indent
set ai

"Smart indet
set si

"Wrap lines
set nowrap

"	Splitting a window will put the new window right of the current one
set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Taglist Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"for Taglist plugin
let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer
let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)
let g:SrcExpl_isUpdateTags = 0
let g:MultipleSearchMaxColors = 8
let g:treeExplWinSize = 60
let NERDTreeIgnore=['\.vim$', '\~$', '\.doc$','\.docx$','\.xls$', '\.xlsx$']
let g:Tb_VSplit = 30
"set tags=$workSoftware/tags
set path=$workSoftware/**
set path+=$workAlgorithmsSw/release/inc
"cs add $workSoftware/cscope.out
"nnoremap <C-[> <Esc>:exe "ptjump " . expand("<cword>")<Esc>
inoremap ,. <Esc>
"reference nnoremap <C-]> <Esc>:exe "ptjump " . expand("<cword>")<Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Taglist plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:map <F2> :TlistToggle <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:map <F1> :NERDTreeToggle <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Window and Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:map <C-Tab> :tabnext <CR>
:map <C-S-Tab> :tabprev <CR>
:map <F12> :bd <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""                             
" => Remove trailing whitespaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F5> :call Preserve("%s/\s\+$//e")<CR>

