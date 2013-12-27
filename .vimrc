"===============================================================================
"          Author: Zheng Xie(郑勰)
"           Email: zhengxiexie@126.com
"        Homepage: www.vimorz.cn
"         Created: 2013-05-22
"===============================================================================

if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:iswindows = 0
endif

if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

set nocompatible
if(g:iswindows==1) 
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin

	set diffexpr=MyDiff()
	function MyDiff()
	  let opt = '-a --binary '
	  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	  let arg1 = v:fname_in
	  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	  let arg2 = v:fname_new
	  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	  let arg3 = v:fname_out
	  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	  let eq = ''
	  if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
		  let cmd = '""' . $VIMRUNTIME . '\diff"'
		  let eq = '"'
		else
		  let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	  else
		let cmd = $VIMRUNTIME . '\diff'
	  endif
	  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
	endfunction
endif

behave mswin


filetype off  

if(g:iswindows==1) 
	set rtp+=$VIM/vimfiles/bundle/vundle/  
	call vundle#rc('$VIM/vimfiles/bundle/')  
endif

if(!g:iswindows) 
	set rtp+=~/.vim/bundle/vundle/  
	call vundle#rc('~/.vim/bundle/')  
endif

filetype plugin indent on  

Bundle 'gmarik/vundle'  
Bundle 'https://github.com/vim-scripts/The-NERD-Commenter.git'
Bundle 'https://github.com/vim-scripts/ctrlp.vim.git'
Bundle 'https://github.com/vim-scripts/a.vim.git'
Bundle 'https://github.com/vim-scripts/EasyGrep.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/majutsushi/tagbar.git'
Bundle 'https://github.com/Lokaltog/vim-powerline.git'
Bundle 'https://github.com/vim-scripts/OmniCppComplete.git'
Bundle 'https://github.com/ervandew/supertab.git'
Bundle 'https://github.com/nanotech/jellybeans.vim.git'
Bundle 'https://github.com/vim-scripts/AutoComplPop.git'
Bundle 'https://github.com/terryma/vim-multiple-cursors.git'
Bundle 'https://github.com/jlanzarotta/colorSchemeExplorer.git'
Bundle 'https://github.com/showliu/vbookmark.vim.git'
Bundle 'https://github.com/altercation/vim-colors-solarized.git'
Bundle 'https://github.com/jiangmiao/auto-pairs.git'
Bundle 'https://github.com/vim-scripts/ShowPairs.git'
Bundle 'https://github.com/tpope/vim-repeat.git'
Bundle 'https://github.com/tpope/vim-surround.git'
Bundle 'https://github.com/vim-scripts/CmdlineComplete.git'
Bundle 'https://github.com/plasticboy/vim-markdown.git'
"Bundle 'https://github.com/Valloric/YouCompleteMe.git'

filetype plugin indent on     " required!   

set nocompatible          "不要兼容vi
filetype off              "必须的设置：

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set scrolloff=3
set fenc=utf-8
set autoindent
set hidden
set encoding=utf-8


" 显示/隐藏菜单栏、工具栏、滚动条，可用 Ctrl + F11 切换
if g:isGUI
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    map <silent> <c-F11> :if &guioptions =~# 'm' <Bar>
        \set guioptions-=m <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=r <Bar>
        \set guioptions-=L <Bar>
    \else <Bar>
        \set guioptions+=m <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=r <Bar>
        \set guioptions+=L <Bar>
    \endif<CR>
endif

syntax enable
syntax on
"set background=dark
set background=light

"colorscheme torte
colorscheme jellybeans
"colorscheme	solarized

if(has("win32") || has("win95") || has("win64") || has("win16"))
	    let g:iswindows=1
else
		let g:iswindows=0
endif

autocmd BufEnter * lcd %:p:h "自动更改为当前文件所在目录

if(g:iswindows==1) "允许鼠标的使用
	    "防止linux终端下无法拷贝
		if has('mouse')
			set mouse=a
		endif
		au GUIEnter * simalt ~x
endif

set go="无菜单、工具栏"

"set guifont=Luxi/ Mono/ 9   设置字体，字体名称和字号
"set guifont=monaco
set tabstop=4       " 设置tab键的宽度
set softtabstop=4
autocmd FileType * set tabstop=4|set shiftwidth=4|set noexpandtab

set backspace=2     " 设置退格键可用
set nu!             " 显示行号
"set vbt_vb=        " vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
"set wrap           " 自动换行
set nowrap         " 不自动换行
set linebreak       " 整词换行
set whichwrap=b,s,<,>,[,]       " 光标从行首和行末时可以跳到另一行去
"set list                       " 显示制表符
"set listchars = tab:>-,trail:- " 将制表符显示为'>---',将行尾空格显示为'-'
"set listchars=tab:./ ,trail:.   " 将制表符显示为'.   '
"set autochdir                   " 自动设置目录为正在编辑的文件所在的目录
set hidden          " 没有保存的缓冲区可以自动被隐藏
set scrolloff=5

"--------------------------------------------------------------------------------
" 查找/替换相关的设置
"--------------------------------------------------------------------------------
set hlsearch        " 高亮显示搜索结果
set incsearch       " 查询时非常方便，如要查找book单词，当输入到/b时，会自动找到
					" 第一个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的
					" 单词，依次类推，进行查找时，使用此设置会快速找到答案，当你
					" 找要匹配的单词时，别忘记回车
set gdefault        " 替换时所有的行内匹配都被替换，而不是只有第一个

"--------------------------------------------------------------------------------
" 编程相关的设置
"--------------------------------------------------------------------------------
set completeopt=longest,menu    " 关掉智能补全时的预览窗口
filetype plugin indent on       " 加了这句才可以用智能补全
syntax on              " 打开语法高亮
set showmatch       " 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set smartindent     " 智能对齐方式
set shiftwidth=4    " 换行时行间交错使用4个空格
set autoindent      " 自动对齐
set ai!             " 设置自动缩进

"--------------------------------------------------------------------------------
" 快捷键设置
"--------------------------------------------------------------------------------
let mapleader=","  "leader
nmap <Space> <PageDown>
nmap <leader><Space> <PageUp>
nmap wv <C-w>v 
nmap wc <C-w>c
nmap ws <C-w>s
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nmap <F12> :A<CR>
nmap <F11> :tabc<CR>
nnoremap <leader>a :res +50<CR>
nnoremap <leader>b :res -50<CR>
nnoremap <leader>c :vertical res +80<CR>
nnoremap <leader>d :vertical res -80<CR>
if(g:iswindows==1) 
	nnoremap <leader>s :source $VIM/_vimrc<CR>
endif
if(!g:iswindows)
	nnoremap <leader>s :source ~/.vimrc<CR>
endif

"--------------------------------------------------------------------------------
" 代码折叠
"--------------------------------------------------------------------------------
"set foldmethod=marker
set foldmethod=indent
"set foldmethod=syntax
set foldlevel=100       " Don't autofold anything (but I can still fold manually)
"set foldopen-=search   " don't open folds when you search into them
"set foldopen-=undo     " don't open folds when you undo stuff
"set foldcolumn=4

"--------------------------------------------------------------------------------
" ctrlp文件查找
"--------------------------------------------------------------------------------
let g:ctrlp_map = ',,'
let g:ctrlp_regexp = 0 "非正则表达式查找
let g:ctrlp_by_filename = 0 "按照目录名查找
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$\|\.o$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*swo
let g:ctrlp_root_markers = ['tags']
let g:ctrlp_open_multiple_files = 'v' "多文件打开时，竖着分屏显示
let g:ctrlp_working_path_mode='rw'
let g:ctrlp_match_window_bottom=0
let g:ctrlp_max_height=50
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=50
let g:ctrlp_follow_symlinks=1
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
nnoremap <leader>e :CtrlP /home/zhengxie<cr>
nnoremap <leader>r :CtrlPMRU<CR>
nnoremap <leader>t :CtrlPBuffer<CR>
"let g:ctrlp_mruf_save_on_update = 1

"--------------------------------------------------------------------------------
" Tagbar 
"--------------------------------------------------------------------------------
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
nmap <F3> :TagbarOpen<CR>
nmap <F4> :NERDTree<CR>

"--------------------------------------------------------------------------------
"cscope快捷键自动生成cscope数据库
"--------------------------------------------------------------------------------
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --c-types=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.c' -o -name '*.idl' -o -name '*.cs' > ./cscope.files"
        else
			silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> ./cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            "execute "cs add cscope.out"
        endif
    endif
endfunction

"--------------------------------------------------------------------------------
" 自动加载tags,cscope数据库
"--------------------------------------------------------------------------------
function! AutoLoadCScope()
    let max = 5
    let dir = './'
    let i = 0
    let break = 0
    while isdirectory(dir) && i < max
        if filereadable(dir . 'cscope.out')
            execute 'cs add ' . dir . 'cscope.out'
            let break = 1
        endif
        if break == 1
            execute 'cd ' . dir
            break
        endif
        let dir = dir . '../'
        let i = i + 1
    endwhile
endfunction

function! AutoLoadCTags()
    let max = 5
    let dir = './'
    let i = 0
    let break = 0
    while isdirectory(dir) && i < max
        if filereadable(dir . 'tags')
            execute 'set tags=' . dir . 'tags'
            let break = 1
        endif
        if break == 1
            execute 'cd ' . dir
            break
        endif
        let dir = dir . '../'
        let i = i + 1
    endwhile
endfunction

autocmd BufEnter * call AutoLoadCTags()
autocmd BufEnter * call AutoLoadCScope()

"--------------------------------------------------------------------------------
"cscope快捷键映射
"--------------------------------------------------------------------------------
nmap <C-\>a :call Do_CsTag()<CR>
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"--------------------------------------------------------------------------------
"" powerline相关设置
"--------------------------------------------------------------------------------
set nocompatible 
set laststatus=2   " Always show the statusline
let g:Powerline_cache_enabled = 1 
let g:Powerline_dividers_override = ['>>', '>', '<<', '<']
let g:Powerline_stl_path_style = 'full'
let g:Powerline_symbols = 'fancy'
"set fillchars+=stl: ,stlnc:
set t_Co=256
"let g:Powerline_cache_file='~/.vim/bundle/vim-powerline/Powerline.cache'

"--------------------------------------------------------------------------------
" supertab相关设置
"--------------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "<c-n>"

"--------------------------------------------------------------------------------
" 直接打开colorscheme
"--------------------------------------------------------------------------------
nmap <F5> : ColorSchemeExplorer<CR>

"--------------------------------------------------------------------------------
" vbookmark.vim配置
"--------------------------------------------------------------------------------
let g:vbookmark_bookmarkSaveFile = $HOME . '/.vimbookmark'
nnoremap <silent> <F2> :VbookmarkNext<CR>
nnoremap <silent> <S-F2> :VbookmarkPrevious<CR>

"--------------------------------------------------------------------------------
" 自动补全配置
"--------------------------------------------------------------------------------
set completeopt=menu
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"--------------------------------------------------------------------------------
" EasyGrep 设置
"--------------------------------------------------------------------------------
let g:EasyGrepMode = 2
let g:EasyGrepCommand = 1
let g:EasyGrepAllOptionsInExplorer = 1
let g:EasyGrepWindow = 1
let g:EasyGrepFilesToExclude = "*.idl.h,*.idl.cpp,*.out,*.o"
