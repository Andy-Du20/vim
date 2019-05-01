set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')


" let Vundle manage Vundle, required
" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" All of your Plugins must be added before the following line
" 你的所有插件需要在下面这行之前
call vundle#end()            " required
filetype plugin indent on    " required

" 加载vim自带和插件相应的语法和文件类型相关脚本
" To ignore plugin indent changes, instead use:
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"  :PluginList       - 列出所有已配置的插件
" :PluginInstall  	 - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后







" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
"set shellslash

" OPTIONAL: This enables automatic indentation as you type.
"filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'





filetype on

set nu!                                    "显示行号
set encoding=utf-8 

set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1




set history=1000                  "记录历史的行数
set background=dark          "背景使用黑色
syntax on                               "语法高亮度显示
set autoindent                       "vim使用自动对齐，也就是把当前行的对齐格式应用到下一行(自动缩进）
set cindent                             "（cindent是特别针对 C语言语法自动缩进）
set smartindent                    "依据上面的对齐格式，智能的选择对齐方式，对于类似C语言编写上有用   
set shiftwidth =4                   "设置当行之间交错时使用4个空格     
set ai!                                      " 设置自动缩进 
set showmatch                     "设置匹配模式，类似当输入一个左括号时会匹配相应的右括号      
set showcmd
set guioptions-=T                 "去除vim的GUI版本中得toolbar   
set vb t_vb=                            "当vim进行编辑时，如果命令错误，会发出警报，该设置去掉警报       
set ruler                                  "在编辑过程中，在右下角显示光标位置的状态行     
set incsearch                        "在程序中查询一单词，自动匹配单词的位置；如查询desk单词，当输到/d时，会自动找到第一个d开头的单词，当输入到/de时，会自动找到第一个以ds开头的单词，以此类推，进行查找；当找到要匹配的单词时，别忘记回车 
set backspace=2           " 设置退格键可用"
set tabstop=4                        "设置tab键为4个空格，

autocmd FileType c,cpp set foldmethod=syntax 
autocmd FileType python set foldmethod=indent



    
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

inoremap jk <ESC>
inoremap Jk <ESC>
inoremap JK <ESC>
nnoremap <C-Y> <C-T>
inoremap <C-Y> <C-T>
map <C-T> <ESC> :call Compile_Run()<CR>
map! <C-T> <ESC> :call Compile_Run()<CR>
autocmd BufNewFile,BufRead *.R set filetype=R
autocmd BufNewFile,BufRead *.md set filetype=markdown
func Compile_Run()

    exec "w"
    if &filetype == 'c'
        exec '!g++ -g % -Wall -o %< && ./%<'
    elseif &filetype == 'cpp'
        exec '!make && lldb main'
"        exec '!make && lldb %:r'
    elseif &filetype == 'python'
        exec '!python %'
    elseif &filetype == 'sh'
        exec '!bash %'
    elseif &filetype == 'tex'
        exec '!xelatex %'
      "  exec '!open %:r.pdf'
    elseif &filetype == 'R'
        exec '!Rscript %'
    elseif &filetype == 'html'
        exec '!open %'
    elseif &filetype == 'markdown'
        exec '!macdown %'
    endif

    
endfunc
