" 定义快捷键前缀
let mapleader=";"

" 开启文件类型侦测
filetype on
" 根据侦测到不同类型加载不同插件
filetype plugin on

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" Backspace 退到上一行
set backspace=2

" vundle 环境设置
filetype off
" you must download vundle first!!! Then use :PluginInstall
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" 主题
Plugin 'altercation/vim-colors-solarized'
" 主题
Plugin 'tomasr/molokai'
" 主题
Plugin 'vim-scripts/phd'
" 状态栏增强
Plugin 'Lokaltog/vim-powerline'
" STL 语法高亮, 如果没有可以自己去.vim/bundle/vim-cpp-enhanced-highlight/after/syntax/cpp.vim添加syntax keyword cppSTLtype initializer_list
Plugin 'octol/vim-cpp-enhanced-highlight'
" 代码缩进可视化 
Plugin 'nathanaelkane/vim-indent-guides'
" 接口和实现快速切换
Plugin 'derekwyatt/vim-fswitch'
" 书签增强（显示） '' 跳回来的地方(最近两个位置跳转)   m<space> 删除所有标签
Plugin 'kshenoy/vim-signature'
" Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
" 超级搜索功能 Ctrl-P
Plugin 'kien/ctrlp.vim'
" Plugin 'vim-scripts/indexer.tar.gz'
" Plugin 'vim-scripts/DfrankUtil'
" Plugin 'vim-scripts/vimprj'
" Plugin 'terryma/vim-multiple-cursors'
" 快速注释
Plugin 'scrooloose/nerdcommenter'
" Plugin 'vim-scripts/DrawIt'
" Plugin 'SirVer/ultisnips'
" 神器，自动补全
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'derekwyatt/vim-protodef'
" 目录树
Plugin 'scrooloose/nerdtree'
" 所有窗口共用一个目录树
Plugin 'jistr/vim-nerdtree-tabs.git'
" Buff查看管理，移动到窗口选择，回车选中，d删除
Plugin 'fholgado/minibufexpl.vim'
" 选择结对符中文本 快捷键设置为空格
Plugin 'gcmt/wildfire.vim'
" Plugin 'sjl/gundo.vim'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'suan/vim-instant-markdown'
" Plugin 'lilydjwg/fcitx.vim'
" 插件列表结束
call vundle#end()
filetype plugin indent on

set t_Co=256
" set background=light
set background=dark
" colorscheme solarized
colorscheme molokai
" colorscheme phd

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
" set cursorcolumn

" 高亮显示搜索结果
set hlsearch

let g:Powerline_colorscheme='solarized256'

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4

" 随 vim 自启动
" let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" 基于缩进或语法进行代码折叠。操作：za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>

" NERDTree config
map <F2> :NERDTreeToggle<CR>
" 如果打开的文件除了NERDTree没有其他文件时，它自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")&&b:NERDTreeType == "primary") | q | endif
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
" let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
" noremap <C-K> <Esc>:tabnext<CR>
" noremap <C-J> <Esc>:tabprevious<CR>
noremap <C-K> <Esc>:bn<CR>
noremap <C-J> <Esc>:bp<CR>
" NERDTree-Tabs
" 设置打开vim的时候默认打开目录树
let g:nerdtree_tabs_open_on_console_startup=0 

set encoding=utf-8
set fileencodings=utf-8,gb18030,utf-16,big5

"C，C++ 按F5编译运行 
map <F5> :call CompileRunGcc()<CR> 
func! CompileRunGcc() 
    exec "w" 
    exec "!scons" 
endfunc 

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Tagbar
let g:tagbar_width=30
let g:tagbar_autofocus=1
nmap <F3> :TagbarToggle<CR>

" let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2 
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 
" 回车即选中当前项
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"    
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_semantic_triggers = {
  \   'c' : ['->', '    ', '.', ' ', '(', '[', '&'],
  \     'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
  \     'perl' : ['->', '::', ' '],
  \     'php' : ['->', '::', '.'],
  \     'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
  \     'ruby' : ['.', '::'],
  \     'lua' : ['.', ':']
  \ }

" wildfire
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

" miniBufExpl
let g:miniBufExplMapCTabSwitchBufs = 1

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

autocmd BufNewFile *.h,*.cpp exec ":call SetTitle()"
func SetComment()
    call setline(1, "/*============================================================================")
    call append(line("."),   "* Copyright (C) ".strftime("%Y")." Ltd. All rights reserved.")
    call append(line(".")+1, "* Author  : SteveNo10")
    call append(line(".")+2, "* Time    : ".strftime("%Y-%m-%d"))
    call append(line(".")+3, "* Descript: ")
    call append(line(".")+4, "*")
    call append(line(".")+5, "============================================================================*/")
    call append(line(".")+6, "")
endfunc

func SetTitle()
    call SetComment()
    if expand("%:e") == 'h'
        call append(line(".")+7, "#ifndef __".toupper(expand("%:t:r"))."_H__")
        call append(line(".")+8, "#define __".toupper(expand("%:t:r"))."_H__")
        call append(line(".")+9, "")
        call append(line(".")+10, "")
        call append(line(".")+11, "")
        call append(line(".")+12, "#endif")
    elseif expand("%:e") == 'cpp'
        call append(line(".")+7, "#include \"".expand("%:t:r").".h\"")
    endif
endfunc
