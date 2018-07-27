" 开启高亮
syntax on 
au BufRead,BufNewFile *.go set filetype=go
" colorscheme molokai
" 开启插件
filetype plugin on
colorscheme darkblue
" 去掉vi的一致性"
set nocompatible       
" 显示行号"
" set number
" set relativenumber
set number relativenumber
set tw=70
set wrap
" set nowrap    "设置不折行"

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" 隐藏滚动条"
set guioptions-=r
set guioptions-=L
set guioptions-=b
" 隐藏顶部标签栏"
set showtabline=0
set fileformat=unix    "设置以unix的格式保存文件"
set cindent        "设置C样式的缩进格式"
set showmatch    "显示匹配的括号"
set scrolloff=5        "距离顶部和底部5行"
set laststatus=2    "命令行为两行"
set fenc=utf-8      "文件编码"
set encoding=utf-8
set backspace=2
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" indent
set expandtab
set smarttab
set tabstop=4    "设置table长度"
set shiftwidth=4        "同上"
set smartindent

set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase        "忽略大小写"
set incsearch
set hlsearch        "高亮搜索项"
set whichwrap+=<,>,h,l
set autoread
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
set showcmd         " 输入的命令显示出来，看的清楚些
" set cursorline        "突出显示当前行"
" set cursorcolumn        "突出显示当前列"
set clipboard=unnamed

" 缩进定义
xnoremap < <gv
xnoremap > >gv

let mapleader=","

" set the runtime path to include Vundle and initialize
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
" 插件安装
call vundle#begin()
Plugin 'fatih/vim-go'
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
" Plugin 'Yggdroot/indentLine'
Plugin 'kien/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tell-k/vim-autopep8'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'dyng/ctrlsf.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()            " required
filetype plugin indent on    " required

"
command! JsonFormat :execute '%!python -m json.tool'
" command! JsonFormat1 :execute '%!python -m json.tool1'
"

" 当光标一段时间保持不动了，就禁用高亮
autocmd cursorhold * set nohlsearch
" 当输入查找命令时，再启用高亮
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>

Bundle 'scrooloose/nerdcommenter'
" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1

"" change to i-beam cursor when entering insert mode
let &t_SI = "\<Esc>[5 q"
"" change to block cursor when leaving insert mode
let &t_EI = "\<Esc>[2 q"

" 设置退格可用
set backspace=indent,eol,start

" 开启代码折叠功能
" 根据当前代码行的缩进来进行代码折叠
set foldmethod=indent
set foldlevel=99
" 将za快捷键映射到space空格键上
nnoremap <space> za
highlight Folded ctermfg=2 ctermbg=8
" au BufWinLeave * silent mkview
" au BufWinEnter * silent loadview
let g:go_fmt_experimental = 1

" *********************************************
" 分割布局相关
" *********************************************
set splitbelow
set splitright
"快捷键，ctrl+l切换到左边布局，ctrl+h切换到右边布局
"ctrl+k切换到上面布局，ctrl+j切换到下面布局
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" *********************************************
" NERD插件属性
" *********************************************
"开启vim的时候默认开启NERDTree
au vimenter * NERDTree    
"设置F2为开启NERDTree的快捷键
map <F2> :NERDTreeToggle<CR>  
let NERDTreeWinSize=20
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" 启动时自动focus
let g:tagbar_auto_faocus =1
" 启动指定文件时自动开启tagbar
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py,*.java call tagbar#autoopen()
let g:tagbar_width = 30
nmap <F3> :TagbarToggle<CR>
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

" *********************************************
" vim-airline
" *********************************************
" 开启powerline字体
let g:airline_powerline_fonts = 1
" 使用powerline包装过的字体
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

" *********************************************
" ctrlp
" *********************************************
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" 设置过滤不进行查找的后缀名
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

" *********************************************
" python代码风格PEP8
" *********************************************
" au BufNewFile,BufRead *.py set tabstop=4 |set softtabstop=4|set shiftwidth=4|set textwidth=79|set expandtab|set autoindent|set fileformat=unix
" au BufNewFile,BufRead *.html, *.css set tabstop=2|set softtabstop=2|set shiftwidth=2
" 突出空格
hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"autopep8设置"
let g:autopep8_disable_show_diff=1

let g:config_Beautifier='/Users/hzq/.vim/.editorconfig'

" python补全
" let g:jedi#completions_command = "<C-J>"
" let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
" let g:pydiction_location = '/Users/hzq/.vim/bundle/pydiction/complete-dict'
" let g:pydiction_menu_height = 3

" dict 代码补全
au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
" au FileType c setlocal dict+=~/.vim/dict/c.dict
" au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
" au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/local/bin/python3")
        call append(line("."),"#coding=utf-8")
        call append(line(".")+1, "")
        call append(line(".")+2, "#================================================================")
        call append(line(".")+3, "#   文件名称：".expand("%:t"))
        call append(line(".")+4, "#   创 建 者：huangzhengqiang")
        call append(line(".")+5, "#   创建日期：".strftime("%Y年%m月%d日"))
        call append(line(".")+6, "#   描    述：")
        call append(line(".")+7, "#===============================================================")
        call append(line(".")+8, "")

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "  > Author: ")
        call append(line(".")+2, "  > Mail: ")
        call append(line(".")+3, "  > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc
autocmd BufNewFile * normal G

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Sort_Type = "name"    " 按照名称排序
let Tlist_Use_Right_Window = 1  " 在右侧显示窗口
let Tlist_Compart_Format = 1    " 压缩方式
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer
""let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags
""let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树
"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"
"设置tags
set tags=tags;
set tags+=$HOME/.vim/tags/python.ctags;
" set autochdir

" C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -std=c++11 -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python3 %"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
	endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -std=c++11 -g -o %<"
	exec "!gdb ./%<"
endfunc

map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>


let g:ycm_server_python_interpreter='/usr/local/bin/python'
" let g:ycm_server_python_interpreter='/usr/local/Cellar/python/3.6.5/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'


" vim-go custom mappings
" au FileType go nmap <Leader>s <Plug>(go-implements)
" au FileType go nmap <Leader>i <Plug>(go-info)
" au FileType go nmap <Leader>gd <Plug>(go-doc)
" au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" au FileType go nmap <leader>r <Plug>(go-run)
" au FileType go nmap <leader>b <Plug>(go-build)
" au FileType go nmap <leader>t <Plug>(go-test)
" au FileType go nmap <leader>c <Plug>(go-coverage)
" au FileType go nmap <Leader>ds <Plug>(go-def-split)
" au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" au FileType go nmap <Leader>dt <Plug>(go-def-tab)
" au FileType go nmap <Leader>e <Plug>(go-rename)

" vim-go settings
let g:go_fmt_command = "goimports"
let g:gotests_bin='/usr/local/Cellar/go/1.10.2/libexec/bin/gotests'

" YCM settings
" let g:ycm_key_list_select_completion = ['', '']
" let g:ycm_key_list_previous_completion = ['']
" let g:ycm_key_invoke_completion = '<C-Space>'

" UltiSnips setting
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"define FormartSrc()
func FormartSrc()
exec "w"
if &filetype == 'py'||&filetype == 'python'
exec "r !autopep8 -i --aggressive %"
endif
exec "e! %"
endfunc
"end FormartSrc
"

if has("cscope") && filereadable("/usr/local/bin/cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

nmap <C-space>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-space>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-space>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-space>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-space>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-space>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-space>d :cs find d <C-R>=expand("<cword>")<CR><CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
