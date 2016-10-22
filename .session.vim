let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <C-Space> 
imap <Nul> <C-Space>
inoremap <expr> <Up> pumvisible() ? "\" : "\<Up>"
inoremap <expr> <Down> pumvisible() ? "\" : "\<Down>"
inoremap <silent> <C-ScrollWheelDown> <C-ScrollWheelDown>:call color_coded#moved()<Insert>
inoremap <silent> <C-ScrollWheelUp> <C-ScrollWheelUp>:call color_coded#moved()<Insert>
inoremap <silent> <S-ScrollWheelDown> <S-ScrollWheelDown>:call color_coded#moved()<Insert>
inoremap <silent> <S-ScrollWheelUp> <S-ScrollWheelUp>:call color_coded#moved()<Insert>
inoremap <silent> <ScrollWheelDown> <ScrollWheelDown>:call color_coded#moved()<Insert>
inoremap <silent> <ScrollWheelUp> <ScrollWheelUp>:call color_coded#moved()<Insert>
inoremap <silent> <expr> <Plug>delimitMateS-BS delimitMate#WithinEmptyPair() ? "\<Del>" : "\<S-BS>"
inoremap <silent> <Plug>delimitMateBS =delimitMate#BS()
inoremap <silent> <Plug>NERDCommenterInInsert  <BS>:call NERDComment(0, "insert")
inoremap <silent> <C-Tab> =UltiSnips#ListSnippets()
snoremap <silent>  c
xnoremap <silent> 	 :call UltiSnips#SaveLastVisualSelection()gvs
snoremap <silent> 	 :call UltiSnips#ExpandSnippetOrJump()
xnoremap <silent>  :call multiple_cursors#new("v", 0)
nnoremap <silent>  :call multiple_cursors#new("n", 1)
nnoremap <silent>  :CtrlP
snoremap  "_c
noremap  
noremap  :YcmCompleter GoToDefinition
nmap   <Plug>(wildfire-fuel)
noremap ;g :YcmCompleter GoToDeclaration
noremap ;j :YcmCompleter GoToDeclaration
nnoremap ;d :YcmShowDetailedDiagnostic
nmap ;ihn :IHN
nmap ;is :IHS:A
nmap ;ih :IHS
nmap <silent> ;slr :DBListVar
xmap <silent> ;sa :DBVarRangeAssign
nmap <silent> ;sap :'<,'>DBVarRangeAssign
nmap <silent> ;sal :.,.DBVarRangeAssign
nmap <silent> ;sas :1,$DBVarRangeAssign
nmap ;so <Plug>DBOrientationToggle
nmap ;sh <Plug>DBHistory
xmap <silent> ;stcl :exec "DBListColumn '".DB_getVisualBlock()."'"
nmap ;stcl <Plug>DBListColumn
nmap ;slv <Plug>DBListView
nmap ;slp <Plug>DBListProcedure
nmap ;slt <Plug>DBListTable
xmap <silent> ;slc :exec "DBListColumn '".DB_getVisualBlock()."'"
nmap ;slc <Plug>DBListColumn
nmap ;sbp <Plug>DBPromptForBufferParameters
nmap ;sdpa <Plug>DBDescribeProcedureAskName
xmap <silent> ;sdp :exec "DBDescribeProcedure '".DB_getVisualBlock()."'"
nmap ;sdp <Plug>DBDescribeProcedure
nmap ;sdta <Plug>DBDescribeTableAskName
xmap <silent> ;sdt :exec "DBDescribeTable '".DB_getVisualBlock()."'"
nmap ;sdt <Plug>DBDescribeTable
xmap <silent> ;sT :exec "DBSelectFromTableTopX '".DB_getVisualBlock()."'"
nmap ;sT <Plug>DBSelectFromTopXTable
nmap ;sta <Plug>DBSelectFromTableAskName
nmap ;stw <Plug>DBSelectFromTableWithWhere
xmap <silent> ;st :exec "DBSelectFromTable '".DB_getVisualBlock()."'"
nmap ;st <Plug>DBSelectFromTable
nmap <silent> ;sep :'<,'>DBExecRangeSQL
nmap <silent> ;sel :.,.DBExecRangeSQL
nmap <silent> ;sea :1,$DBExecRangeSQL
nmap ;sq <Plug>DBExecSQL
nmap ;sE <Plug>DBExecSQLUnderTopXCursor
nmap ;se <Plug>DBExecSQLUnderCursor
xmap ;sE <Plug>DBExecVisualTopXSQL
xmap ;se <Plug>DBExecVisualSQL
xmap ;p?=s <Plug>PyCalcAppendWithEqAndSum
xmap ;p?s <Plug>PyCalcAppendWithSum
xmap ;p?= <Plug>PyCalcAppendWithEq
xmap ;p? <Plug>PyCalcAppend
xmap ;;p?s <Plug>PyCalcReplaceWithSum
xmap ;;p? <Plug>PyCalcReplace
xmap ;v?=s <Plug>VimCalcAppendWithEqAndSum
xmap ;v?s <Plug>VimCalcAppendWithSum
xmap ;v?= <Plug>VimCalcAppendWithEq
xmap ;v? <Plug>VimCalcAppend
xmap ;;v?s <Plug>VimCalcReplaceWithSum
xmap ;;v? <Plug>VimCalcReplace
xmap ;b?=s <Plug>BcCalcAppendWithEqAndSum
xmap ;b?s <Plug>BcCalcAppendWithSum
xmap ;b?= <Plug>BcCalcAppendWithEq
xmap ;b? <Plug>BcCalcAppend
xmap ;;b?s <Plug>BcCalcReplaceWithSum
xmap ;;b? <Plug>BcCalcReplace
xmap ;?=s <Plug>AutoCalcAppendWithEqAndSum
xmap ;?s <Plug>AutoCalcAppendWithSum
xmap ;?= <Plug>AutoCalcAppendWithEq
xmap ;? <Plug>AutoCalcAppend
xmap ;;?s <Plug>AutoCalcReplaceWithSum
xmap ;;? <Plug>AutoCalcReplace
nmap ;rwp <Plug>RestoreWinPosn
xmap ;rwp <Plug>RestoreWinPosn
omap ;rwp <Plug>RestoreWinPosn
nmap ;swp <Plug>SaveWinPosn
xmap ;swp <Plug>SaveWinPosn
omap ;swp <Plug>SaveWinPosn
nmap ;ds <Plug>DrawItStop
xmap ;ds <Plug>DrawItStop
omap ;ds <Plug>DrawItStop
nmap ;di <Plug>DrawItStart
xmap ;di <Plug>DrawItStart
omap ;di <Plug>DrawItStart
nmap ;ca <Plug>NERDCommenterAltDelims
xmap ;cA <Plug>NERDCommenterAppend
nmap ;cA <Plug>NERDCommenterAppend
xmap ;c$ <Plug>NERDCommenterToEOL
nmap ;c$ <Plug>NERDCommenterToEOL
xmap ;cu <Plug>NERDCommenterUncomment
nmap ;cu <Plug>NERDCommenterUncomment
xmap ;cn <Plug>NERDCommenterNest
nmap ;cn <Plug>NERDCommenterNest
xmap ;cb <Plug>NERDCommenterAlignBoth
nmap ;cb <Plug>NERDCommenterAlignBoth
xmap ;cl <Plug>NERDCommenterAlignLeft
nmap ;cl <Plug>NERDCommenterAlignLeft
xmap ;cy <Plug>NERDCommenterYank
nmap ;cy <Plug>NERDCommenterYank
xmap ;ci <Plug>NERDCommenterInvert
nmap ;ci <Plug>NERDCommenterInvert
xmap ;cs <Plug>NERDCommenterSexy
nmap ;cs <Plug>NERDCommenterSexy
xmap ;cm <Plug>NERDCommenterMinimal
nmap ;cm <Plug>NERDCommenterMinimal
xmap ;c  <Plug>NERDCommenterToggle
nmap ;c  <Plug>NERDCommenterToggle
xmap ;cc <Plug>NERDCommenterComment
nmap ;cc <Plug>NERDCommenterComment
xmap ;de :'<,'>DBExecVisualSQL
nmap ;p "+p
nmap ;sv :!source ~/.vimrc
nnoremap ;ev :vsp ~/.vimrc
xnoremap ;ev :vsp ~/.vimrc
onoremap ;ev :vsp ~/.vimrc
nmap ;mks :mksession! ./.session.vim
xmap <silent> ;ge <Plug>CamelCaseMotion_ge
xmap <silent> ;e <Plug>CamelCaseMotion_e
xmap <silent> ;b <Plug>CamelCaseMotion_b
xmap <silent> ;w <Plug>CamelCaseMotion_w
omap <silent> ;ge <Plug>CamelCaseMotion_ge
omap <silent> ;e <Plug>CamelCaseMotion_e
omap <silent> ;b <Plug>CamelCaseMotion_b
omap <silent> ;w <Plug>CamelCaseMotion_w
nmap <silent> ;ge <Plug>CamelCaseMotion_ge
nmap <silent> ;e <Plug>CamelCaseMotion_e
nmap <silent> ;b <Plug>CamelCaseMotion_b
nmap <silent> ;w <Plug>CamelCaseMotion_w
xmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
xmap <silent> i;ge <Plug>CamelCaseMotion_ige
xmap <silent> i;e <Plug>CamelCaseMotion_ie
xmap <silent> i;b <Plug>CamelCaseMotion_ib
xmap <silent> i;w <Plug>CamelCaseMotion_iw
omap <silent> i;ge <Plug>CamelCaseMotion_ige
omap <silent> i;e <Plug>CamelCaseMotion_ie
omap <silent> i;b <Plug>CamelCaseMotion_ib
omap <silent> i;w <Plug>CamelCaseMotion_iw
snoremap <silent> <BS> c
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
nnoremap <silent> <C-ScrollWheelDown> <C-ScrollWheelDown>:call color_coded#moved()
nnoremap <silent> <C-ScrollWheelUp> <C-ScrollWheelUp>:call color_coded#moved()
nnoremap <silent> <S-ScrollWheelDown> <S-ScrollWheelDown>:call color_coded#moved()
nnoremap <silent> <S-ScrollWheelUp> <S-ScrollWheelUp>:call color_coded#moved()
nnoremap <silent> <ScrollWheelDown> <ScrollWheelDown>:call color_coded#moved()
nnoremap <silent> <ScrollWheelUp> <ScrollWheelUp>:call color_coded#moved()
vnoremap <silent> <Plug>CamelCaseMotion_ige :call camelcasemotion#InnerMotion('ge',v:count1)
vnoremap <silent> <Plug>CamelCaseMotion_ie :call camelcasemotion#InnerMotion('e',v:count1)
vnoremap <silent> <Plug>CamelCaseMotion_ib :call camelcasemotion#InnerMotion('b',v:count1)
vnoremap <silent> <Plug>CamelCaseMotion_iw :call camelcasemotion#InnerMotion('w',v:count1)
onoremap <silent> <Plug>CamelCaseMotion_ige :call camelcasemotion#InnerMotion('ge',v:count1)
onoremap <silent> <Plug>CamelCaseMotion_ie :call camelcasemotion#InnerMotion('e',v:count1)
onoremap <silent> <Plug>CamelCaseMotion_ib :call camelcasemotion#InnerMotion('b',v:count1)
onoremap <silent> <Plug>CamelCaseMotion_iw :call camelcasemotion#InnerMotion('w',v:count1)
vnoremap <silent> <Plug>CamelCaseMotion_ge :call camelcasemotion#Motion('ge',v:count1,'v')
vnoremap <silent> <Plug>CamelCaseMotion_e :call camelcasemotion#Motion('e',v:count1,'v')
vnoremap <silent> <Plug>CamelCaseMotion_b :call camelcasemotion#Motion('b',v:count1,'v')
vnoremap <silent> <Plug>CamelCaseMotion_w :call camelcasemotion#Motion('w',v:count1,'v')
onoremap <silent> <Plug>CamelCaseMotion_ge :call camelcasemotion#Motion('ge',v:count1,'o')
onoremap <silent> <Plug>CamelCaseMotion_e :call camelcasemotion#Motion('e',v:count1,'o')
onoremap <silent> <Plug>CamelCaseMotion_b :call camelcasemotion#Motion('b',v:count1,'o')
onoremap <silent> <Plug>CamelCaseMotion_w :call camelcasemotion#Motion('w',v:count1,'o')
nnoremap <silent> <Plug>CamelCaseMotion_ge :call camelcasemotion#Motion('ge',v:count1,'n')
nnoremap <silent> <Plug>CamelCaseMotion_e :call camelcasemotion#Motion('e',v:count1,'n')
nnoremap <silent> <Plug>CamelCaseMotion_b :call camelcasemotion#Motion('b',v:count1,'n')
nnoremap <silent> <Plug>CamelCaseMotion_w :call camelcasemotion#Motion('w',v:count1,'n')
nnoremap <silent> <F11> :call conque_term#exec_file()
nnoremap <SNR>66_: :=v:count ? v:count : ''
vnoremap <silent> <Plug>PyCalcAppendWithEqAndSum :call HowMuch#HowMuch(1,1,1,'py')
vnoremap <silent> <Plug>PyCalcAppendWithSum :call HowMuch#HowMuch(1,0,1,'py')
vnoremap <silent> <Plug>PyCalcAppendWithEq :call HowMuch#HowMuch(1,1,0,'py')
vnoremap <silent> <Plug>PyCalcAppend :call HowMuch#HowMuch(1,0,0,'py')
vnoremap <silent> <Plug>PyCalcReplaceWithSum :call HowMuch#HowMuch(0,0,1,'py')
vnoremap <silent> <Plug>PyCalcReplace :call HowMuch#HowMuch(0,0,0,'py')
vnoremap <silent> <Plug>VimCalcAppendWithEqAndSum :call HowMuch#HowMuch(1,1,1,'vim')
vnoremap <silent> <Plug>VimCalcAppendWithSum :call HowMuch#HowMuch(1,0,1,'vim')
vnoremap <silent> <Plug>VimCalcAppendWithEq :call HowMuch#HowMuch(1,1,0,'vim')
vnoremap <silent> <Plug>VimCalcAppend :call HowMuch#HowMuch(1,0,0,'vim')
vnoremap <silent> <Plug>VimCalcReplaceWithSum :call HowMuch#HowMuch(0,0,1,'vim')
vnoremap <silent> <Plug>VimCalcReplace :call HowMuch#HowMuch(0,0,0,'vim')
vnoremap <silent> <Plug>BcCalcAppendWithEqAndSum :call HowMuch#HowMuch(1,1,1,'bc')
vnoremap <silent> <Plug>BcCalcAppendWithSum :call HowMuch#HowMuch(1,0,1,'bc')
vnoremap <silent> <Plug>BcCalcAppendWithEq :call HowMuch#HowMuch(1,1,0,'bc')
vnoremap <silent> <Plug>BcCalcAppend :call HowMuch#HowMuch(1,0,0,'bc')
vnoremap <silent> <Plug>BcCalcReplaceWithSum :call HowMuch#HowMuch(0,0,1,'bc')
vnoremap <silent> <Plug>BcCalcReplace :call HowMuch#HowMuch(0,0,0,'bc')
vnoremap <silent> <Plug>AutoCalcAppendWithEqAndSum :call HowMuch#HowMuch(1,1,1,'auto')
vnoremap <silent> <Plug>AutoCalcAppendWithSum :call HowMuch#HowMuch(1,0,1,'auto')
vnoremap <silent> <Plug>AutoCalcAppendWithEq :call HowMuch#HowMuch(1,1,0,'auto')
vnoremap <silent> <Plug>AutoCalcAppend :call HowMuch#HowMuch(1,0,0,'auto')
vnoremap <silent> <Plug>AutoCalcReplaceWithSum :call HowMuch#HowMuch(0,0,1,'auto')
vnoremap <silent> <Plug>AutoCalcReplace :call HowMuch#HowMuch(0,0,0,'auto')
nmap <silent> <Plug>RestoreWinPosn :call RestoreWinPosn()
nmap <silent> <Plug>SaveWinPosn :call SaveWinPosn()
noremap <silent> <Plug>DrawItStop :set lz:call DrawIt#DrawItStop():set nolz
noremap <silent> <Plug>DrawItStart :set lz:call DrawIt#DrawItStart():set nolz
onoremap <silent> <Plug>(wildfire-quick-select) :call wildfire#QuickSelect(['ip', 'i)', 'i]', 'i}', 'i''', 'i"', 'it'])
nnoremap <silent> <Plug>(wildfire-quick-select) :call wildfire#QuickSelect(['ip', 'i)', 'i]', 'i}', 'i''', 'i"', 'it'])
vnoremap <silent> <Plug>(wildfire-fuel) :call wildfire#Fuel(v:count1)
onoremap <silent> <Plug>(wildfire-fuel) :call wildfire#Start(v:count1, ['ip', 'i)', 'i]', 'i}', 'i''', 'i"', 'it'])
nnoremap <silent> <Plug>(wildfire-fuel) :call wildfire#Start(v:count1, ['ip', 'i)', 'i]', 'i}', 'i''', 'i"', 'it'])
vnoremap <silent> <Plug>(wildfire-water) :call wildfire#Water(v:count1)
nmap <silent> <Plug>NERDCommenterAppend :call NERDComment(0, "append")
nnoremap <silent> <Plug>NERDCommenterToEOL :call NERDComment(0, "toEOL")
vnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment(1, "uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment(0, "uncomment")
vnoremap <silent> <Plug>NERDCommenterNest :call NERDComment(1, "nested")
nnoremap <silent> <Plug>NERDCommenterNest :call NERDComment(0, "nested")
vnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment(1, "alignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment(0, "alignBoth")
vnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment(1, "alignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment(0, "alignLeft")
vmap <silent> <Plug>NERDCommenterYank :call NERDComment(1, "yank")
nmap <silent> <Plug>NERDCommenterYank :call NERDComment(0, "yank")
vnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment(1, "invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment(0, "invert")
vnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment(1, "sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment(0, "sexy")
vnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment(1, "minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment(0, "minimal")
vnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment(1, "toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment(0, "toggle")
vnoremap <silent> <Plug>NERDCommenterComment :call NERDComment(1, "norm")
nnoremap <silent> <Plug>NERDCommenterComment :call NERDComment(0, "norm")
snoremap <silent> <Del> c
xmap <BS> <Plug>(wildfire-water)
snoremap <silent> <C-Tab> :call UltiSnips#ListSnippets()
map <F10> :copen
map <F3> :NERDTreeFind
map <F2> w
map <F1> :NERDTreeToggle
inoremap <silent> 	 =UltiSnips#ExpandSnippetOrJump()
imap  <Right>
inoremap <expr>  pumvisible() ? "\" : "\"
inoremap <expr>  pumvisible() ? "\" : "\"
imap ;ihn :IHN
imap ;is :IHS:A
imap ;ih :IHS
inoremap ii 
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set cindent
set completefunc=youcompleteme#Complete
set completeopt=preview,menuone
set cpoptions=aAceFsB
set fileencodings=utf-8,gb2312,gbk
set guioptions=aegimt
set helplang=en
set hlsearch
set iminsert=0
set laststatus=2
set mouse=a
set omnifunc=youcompleteme#OmniComplete
set runtimepath=~/.vim,~/.vim/bundle/vundle,~/.vim/bundle/ultisnips,~/.vim/bundle/vim-snippets,~/.vim/bundle/vim-powerline,~/.vim/bundle/ctrlp.vim,~/.vim/bundle/ag.vim,~/.vim/bundle/The-NERD-tree,~/.vim/bundle/The-NERD-Commenter,~/.vim/bundle/DoxygenToolkit.vim,~/.vim/bundle/syntastic,~/.vim/bundle/wildfire.vim,~/.vim/bundle/DrawIt,~/.vim/bundle/delimitMate,~/.vim/bundle/HowMuch,~/.vim/bundle/tabular,~/.vim/bundle/vim-fugitive,~/.vim/bundle/Conque-Shell,~/.vim/bundle/vim-multiple-cursors,~/.vim/bundle/CamelCaseMotion,~/.vim/bundle/argtextobj.vim,~/.vim/bundle/dbext.vim,~/.vim/bundle/a.vim,~/.vim/bundle/color_coded,~/.vim/bundle/YouCompleteMe,~/.vim/bundle/YCM-Generator,~/.vim/bundle/vim-markdown,~/.vim/bundle/vim-markdown-preview,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,~/.vim/after,~/.vim/bundle/vundle/,~/.vim/bundle/vundle/after,~/.vim/bundle/ultisnips/after,~/.vim/bundle/vim-snippets/after,~/.vim/bundle/vim-powerline/after,~/.vim/bundle/ctrlp.vim/after,~/.vim/bundle/ag.vim/after,~/.vim/bundle/The-NERD-tree/after,~/.vim/bundle/The-NERD-Commenter/after,~/.vim/bundle/DoxygenToolkit.vim/after,~/.vim/bundle/syntastic/after,~/.vim/bundle/wildfire.vim/after,~/.vim/bundle/DrawIt/after,~/.vim/bundle/delimitMate/after,~/.vim/bundle/HowMuch/after,~/.vim/bundle/tabular/after,~/.vim/bundle/vim-fugitive/after,~/.vim/bundle/Conque-Shell/after,~/.vim/bundle/vim-multiple-cursors/after,~/.vim/bundle/CamelCaseMotion/after,~/.vim/bundle/argtextobj.vim/after,~/.vim/bundle/dbext.vim/after,~/.vim/bundle/a.vim/after,~/.vim/bundle/color_coded/after,~/.vim/bundle/YouCompleteMe/after,~/.vim/bundle/YCM-Generator/after,~/.vim/bundle/vim-markdown/after,~/.vim/bundle/vim-markdown-preview/after
set shiftwidth=4
set shortmess=filnxtToOc
set smartindent
set statusline=%{fugitive#statusline()}%#warningmsg#%{SyntasticStatuslineFlag()}%*
set tabstop=4
set termencoding=utf-8
set updatetime=2000
set window=47
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/documents/cpp/net
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +66 net/TCPTask.cpp
badd +145 net/Socket.cpp
badd +41 client/main.cpp
badd +40 net/Protocal.h
badd +28 net/Protocal.cpp
badd +83 net/Socket.h
badd +46 net/ByteBuff.cpp
badd +70 net/Task.cpp
badd +4 net/Epoll.cpp
badd +11 net/Base.h
badd +30 net/ByteBuff.h
badd +86 net/Server.cpp
argglobal
silent! argdel *
edit net/Protocal.cpp
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 31 + 119) / 239)
exe '2resize ' . ((&lines * 3 + 24) / 48)
exe 'vert 2resize ' . ((&columns * 103 + 119) / 239)
exe '3resize ' . ((&lines * 42 + 24) / 48)
exe 'vert 3resize ' . ((&columns * 103 + 119) / 239)
exe 'vert 4resize ' . ((&columns * 103 + 119) / 239)
argglobal
enew
file NERD_tree_1
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <S-Tab> <Plug>delimitMateS-Tab
imap <buffer> <S-BS> <Plug>delimitMateS-BS
imap <buffer> <BS> <Plug>delimitMateBS
nnoremap <buffer> <silent> <NL> :call nerdtree#ui_glue#invokeKeyMap("<C-j>")
nnoremap <buffer> <silent>  :call nerdtree#ui_glue#invokeKeyMap("<C-k>")
nnoremap <buffer> <silent>  :call nerdtree#ui_glue#invokeKeyMap(g:NERDTreeMapActivateNode)
nnoremap <buffer> <silent> ? :call nerdtree#ui_glue#invokeKeyMap("?")
nnoremap <buffer> <silent> A :call nerdtree#ui_glue#invokeKeyMap("A")
nnoremap <buffer> <silent> B :call nerdtree#ui_glue#invokeKeyMap("B")
nnoremap <buffer> <silent> CD :call nerdtree#ui_glue#invokeKeyMap("CD")
nnoremap <buffer> <silent> C :call nerdtree#ui_glue#invokeKeyMap("C")
nnoremap <buffer> <silent> D :call nerdtree#ui_glue#invokeKeyMap("D")
nnoremap <buffer> <silent> F :call nerdtree#ui_glue#invokeKeyMap("F")
nnoremap <buffer> <silent> I :call nerdtree#ui_glue#invokeKeyMap("I")
nnoremap <buffer> <silent> J :call nerdtree#ui_glue#invokeKeyMap("J")
nnoremap <buffer> <silent> K :call nerdtree#ui_glue#invokeKeyMap("K")
nnoremap <buffer> <silent> O :call nerdtree#ui_glue#invokeKeyMap("O")
nnoremap <buffer> <silent> P :call nerdtree#ui_glue#invokeKeyMap("P")
nnoremap <buffer> <silent> R :call nerdtree#ui_glue#invokeKeyMap("R")
nnoremap <buffer> <silent> T :call nerdtree#ui_glue#invokeKeyMap("T")
nnoremap <buffer> <silent> U :call nerdtree#ui_glue#invokeKeyMap("U")
nnoremap <buffer> <silent> X :call nerdtree#ui_glue#invokeKeyMap("X")
nnoremap <buffer> <silent> cd :call nerdtree#ui_glue#invokeKeyMap("cd")
nnoremap <buffer> <silent> e :call nerdtree#ui_glue#invokeKeyMap("e")
nnoremap <buffer> <silent> f :call nerdtree#ui_glue#invokeKeyMap("f")
nnoremap <buffer> <silent> gi :call nerdtree#ui_glue#invokeKeyMap("gi")
nnoremap <buffer> <silent> gs :call nerdtree#ui_glue#invokeKeyMap("gs")
nnoremap <buffer> <silent> go :call nerdtree#ui_glue#invokeKeyMap("go")
nnoremap <buffer> <silent> i :call nerdtree#ui_glue#invokeKeyMap("i")
nnoremap <buffer> <silent> m :call nerdtree#ui_glue#invokeKeyMap("m")
nnoremap <buffer> <silent> o :call nerdtree#ui_glue#invokeKeyMap("o")
nnoremap <buffer> <silent> p :call nerdtree#ui_glue#invokeKeyMap("p")
nnoremap <buffer> <silent> q :call nerdtree#ui_glue#invokeKeyMap("q")
nnoremap <buffer> <silent> r :call nerdtree#ui_glue#invokeKeyMap("r")
nnoremap <buffer> <silent> s :call nerdtree#ui_glue#invokeKeyMap("s")
nnoremap <buffer> <silent> t :call nerdtree#ui_glue#invokeKeyMap("t")
nnoremap <buffer> <silent> u :call nerdtree#ui_glue#invokeKeyMap("u")
nnoremap <buffer> <silent> x :call nerdtree#ui_glue#invokeKeyMap("x")
nnoremap <buffer> <silent> <2-LeftMouse> :call nerdtree#ui_glue#invokeKeyMap("<2-LeftMouse>")
nnoremap <buffer> <silent> <LeftRelease> <LeftRelease>:call nerdtree#ui_glue#invokeKeyMap("<LeftRelease>")
nnoremap <buffer> <silent> <MiddleRelease> :call nerdtree#ui_glue#invokeKeyMap("<MiddleRelease>")
imap <buffer> <silent> g <Plug>delimitMateJumpMany
imap <buffer>  <Plug>delimitMateBS
imap <buffer> " <Plug>delimitMate"
imap <buffer> ' <Plug>delimitMate'
imap <buffer> ( <Plug>delimitMate(
imap <buffer> ) <Plug>delimitMate)
imap <buffer> [ <Plug>delimitMate[
imap <buffer> ] <Plug>delimitMate]
imap <buffer> ` <Plug>delimitMate`
imap <buffer> { <Plug>delimitMate{
imap <buffer> } <Plug>delimitMate}
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=hide
setlocal nobuflisted
setlocal buftype=nofile
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'nerdtree'
setlocal filetype=nerdtree
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal nomodifiable
setlocal nrformats=bin,octal,hex
set number
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!Pl#Statusline(11,1)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'nerdtree'
setlocal syntax=nerdtree
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal winfixwidth
setlocal nowrap
setlocal wrapmargin=0
wincmd w
argglobal
enew
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <S-Tab> <Plug>delimitMateS-Tab
imap <buffer> <S-BS> <Plug>delimitMateS-BS
imap <buffer> <BS> <Plug>delimitMateBS
imap <buffer> <silent> g <Plug>delimitMateJumpMany
imap <buffer>  <Plug>delimitMateBS
imap <buffer> " <Plug>delimitMate"
imap <buffer> ' <Plug>delimitMate'
imap <buffer> ( <Plug>delimitMate(
imap <buffer> ) <Plug>delimitMate)
imap <buffer> [ <Plug>delimitMate[
imap <buffer> ] <Plug>delimitMate]
imap <buffer> ` <Plug>delimitMate`
imap <buffer> { <Plug>delimitMate{
imap <buffer> } <Plug>delimitMate}
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=wipe
setlocal buflisted
setlocal buftype=nofile
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=youcompleteme#Complete
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != ''
setlocal filetype=
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal nomodifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=youcompleteme#OmniComplete
setlocal path=
setlocal nopreserveindent
setlocal previewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!Pl#Statusline(0,0)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal winfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
wincmd w
argglobal
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <S-Tab> <Plug>delimitMateS-Tab
imap <buffer> <S-BS> <Plug>delimitMateS-BS
imap <buffer> <BS> <Plug>delimitMateBS
imap <buffer> <silent> g <Plug>delimitMateJumpMany
imap <buffer>  <Plug>delimitMateBS
imap <buffer>  <Plug>delimitMateCR
imap <buffer> " <Plug>delimitMate"
imap <buffer> ' <Plug>delimitMate'
imap <buffer> ( <Plug>delimitMate(
imap <buffer> ) <Plug>delimitMate)
imap <buffer> [ <Plug>delimitMate[
imap <buffer> ] <Plug>delimitMate]
imap <buffer> ` <Plug>delimitMate`
imap <buffer> { <Plug>delimitMate{
imap <buffer> } <Plug>delimitMate}
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=youcompleteme#Complete
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'cpp'
setlocal filetype=cpp
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=youcompleteme#OmniComplete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=
setlocal spellfile=
setlocal spelllang=
setlocal statusline=%!Pl#Statusline(0,1)
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cpp'
setlocal syntax=cpp
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 18 - ((17 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
18
normal! 047|
wincmd w
argglobal
edit net/Socket.cpp
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <S-Tab> <Plug>delimitMateS-Tab
imap <buffer> <S-BS> <Plug>delimitMateS-BS
imap <buffer> <BS> <Plug>delimitMateBS
imap <buffer> <silent> g <Plug>delimitMateJumpMany
imap <buffer>  <Plug>delimitMateBS
imap <buffer>  <Plug>delimitMateCR
imap <buffer> " <Plug>delimitMate"
imap <buffer> ' <Plug>delimitMate'
imap <buffer> ( <Plug>delimitMate(
imap <buffer> ) <Plug>delimitMate)
imap <buffer> [ <Plug>delimitMate[
imap <buffer> ] <Plug>delimitMate]
imap <buffer> ` <Plug>delimitMate`
imap <buffer> { <Plug>delimitMate{
imap <buffer> } <Plug>delimitMate}
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=youcompleteme#Complete
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'cpp'
setlocal filetype=cpp
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=youcompleteme#OmniComplete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=
setlocal spellfile=
setlocal spelllang=
setlocal statusline=%!Pl#Statusline(0,0)
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cpp'
setlocal syntax=cpp
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 186 - ((21 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
186
normal! 0
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 119) / 239)
exe '2resize ' . ((&lines * 3 + 24) / 48)
exe 'vert 2resize ' . ((&columns * 103 + 119) / 239)
exe '3resize ' . ((&lines * 42 + 24) / 48)
exe 'vert 3resize ' . ((&columns * 103 + 119) / 239)
exe 'vert 4resize ' . ((&columns * 103 + 119) / 239)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
