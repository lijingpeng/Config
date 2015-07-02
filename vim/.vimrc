" .vimrc: with vundle
" Chinese support
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=prc
set nocompatible
set clipboard=unnamed

filetype plugin indent on     " required!
filetype on
syntax enable
"set term=xterm-256color
set t_Co=256
if has('gui_runnig')
    set background=light
else
    set background=dark
endif
"let g:solarized_termcolors=256
":colorscheme desert
"colorscheme solarized
"colorscheme herald
"colorscheme moria
"colorscheme symfony
"colorscheme torte
colorscheme gruvbox
syntax on

if has("win16") || has("win32") || has("win64")
  set rtp+=$VIM\vimfiles\bundle\vundle
  call vundle#rc('$VIM\vimfiles\bundle')
else
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
endif

" vundle
Bundle 'gmarik/vundle'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'https://github.com/Lokaltog/vim-powerline.git'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'plasticboy/vim-markdown'

set hlsearch
" Config vim power-line
set laststatus=2

let g:Powerline_symble = 'unicode'
set encoding=utf8

" Basic config
""""""""""""""""""""""""""""""""""""""""
" Show line number
set nu
" Ignore case when search
set ignorecase
" Hilight keywords when search
set incsearch
" No backup file
set nobackup
" Share clipborad with windows
set clipboard+=unnamed
" 在状态行上显示光标所在位置的行号和列号 
set ruler 
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
" Empty startup
set shortmess=atI
" Show match ()
set showmatch
" 自动格式化 
set formatoptions=tcrqn
" 为C程序提供自动缩进 
set smartindent 

set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Python
" set filetype=python
au BufNewFile,BufRead *.py,*pyw setf python
" open python autocomplete
filetype plugin on
" let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'

"开启光亮光标行
set cursorline
hi CursorLine   cterm=NONE ctermbg=black ctermfg=white guibg=darkred guifg=white

"开启高亮光标列
"set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi Visual cterm=NONE ctermbg=blue ctermfg=white guibg=darkred guifg=white

" ------------------------- plugin settings ---------------------------------
" the nerd tree config
nnoremap :NT :NERDTreeToggle<CR>
" the Youcompleteme config
" .ycm_extra_conf.py文件可以是针对工程而言，也可以设置全局的。对工程而言，放在工程的根目录即可。不过每次打开文件都会询问是否加载
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_min_num_of_chars_for_completion = 1

" 自动补全单引号、双引号、括号等
Bundle 'Raimondi/delimitMate'

" === markdown编辑插件 ===
Bundle 'plasticboy/vim-markdown'

" 提供命令模式下的补全
Bundle 'CmdlineComplete'

" Python代码检查
Bundle 'pyflakes.vim'

" 提供日历的功能，可以写日记
Bundle 'calendar.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'vim-scripts/UltiSnips'

" syntastic
let g:syntastic_error_symbol = '*'
let g:syntastic_warning_symbol = '!'
let g:syntastic_enable_balloons = 1

" MiniBufExpl Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
 
" rainbow 
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['yellow',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['white',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['yellow',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

hi Pmenu     ctermfg=white ctermbg=darkgrey     guifg=grey60   guibg=brown
hi PmenuSel  ctermfg=yellow     ctermbg=red  guifg=white    guibg=grey40 

nnoremap <leader>gt :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 键盘映射
:nmap <C-d> :w <CR> :sh<CR>
nmap <F2> :w<CR>
imap <F2> <esc>:w<CR>a
map <C-A> <Esc>ggVG
map <C-c> "+y
map <C-v> "+p
imap <F3> <esc>ddO
nmap <F3> <esc>ddO
" 注释
map ,, \cc
map .. \cu

"By default the command to involke the Color Scheme Explorer is
"':ColorSchemeExplorer''

"session
:set sessionoptions-=curdir        "在session option中去掉curdir
:set sessionoptions+=sesdir        "在session option中加入sesdir

"taglist
map <C-t> :TlistOpen<CR>
"let Tlist_Show_One_File = 1         "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1        "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Auto_Open = 0              "如果你想在启动VIM后，自动打开taglist窗口，设置Tlist_Auto_Open为1；
let Tlist_Close_On_Select = 1        " 如果你希望在选择了tag后自动关闭taglist窗口，设置Tlist_Close_On_Select为1；
let Tlist_File_Fold_Auto_Close = 1   " 当同时显示多个文件中的tag时，设置Tlist_File_Fold_Auto_Close为１，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。

" vim markdown plugin
let g:vim_markdown_folding_disabled=1
