if exists('g:vscode')
  
"分割画面の移動
nnoremap<C-w><C-j> <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
xnoremap<C-w><C-j> <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
nnoremap<C-w><C-k> <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
xnoremap<C-w><C-k> <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
nnoremap<C-w><C-h> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
xnoremap<C-w><C-h> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
nnoremap<C-w><C-l> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
xnoremap<C-w><C-l> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>

"タブの移動
nnoremap<C-l> <Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>
xnoremap<C-l> <Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>
nnoremap<C-h> <Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>
xnoremap<C-h> <Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>

else
  
"タブの移動
nnoremap  <C-l> :tabn<CR>
nnoremap  <C-h> :tabp<CR>
nnoremap  <C-n> :tabnew<CR>

endif

"---------------------------------------------
"--- 基本設定
"---------------------------------------------
"txtファイルのシンタックスをmarkdownにする。
"au BufRead,BufNewFile *.txt  set filetype=markdown formatoptions=q

"バックアップファイル自動作成の停止
set nobackup

"ビープ音と画面フラッシュの停止（設定が効かない場合があるので注意）
"set vb t_vb=

"undofileの置き場所を設定
"set undofile
set undodir=C:/vim_undofile

"TABを常に表示
set showtabline=2 

"開いたファイルと同じディレクトリに移動
"au   BufEnter *   execute ":lcd " . expand("%:p:h")
"
"ステータスラインに改行コードを表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"ブロック間ジャンプ(begin - end)
packadd! matchit
packadd! editexisting

"折り返し無し
"set nowrap

"自動改行無し
set textwidth=0
"インデントをスペース4つにでそろえる
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

"grep時、自動でcwindowを開く
autocmd QuickFixCmdPost *grep* cwindow

"相対行番号
"set rnu

"tagファイルを上位フォルダまで検索
set tags=tags;

"ファイルに応じて見やすく色付けをしてくれる
syntax on

"検索したときにハイライトを付ける
set hlsearch

"カーソル行をハイライト
set cursorline


"エンコードの指定
"set fileencoding=japan
"set fileencodings=utf-8,iso-2022-jpm,euc-jp,ucs-2le,ucs-2,cp932

"行番号を付ける
set number

"検索時に大文字・小文字を区別しない
set ignorecase

"色テーマはデフォルトを使用
"colorscheme default

"スワップファイルを作成しない
"「無名のスワップファイルを開けないのでリカバリは不可能です」が表示された時の回避
set noswapfile

"画面のスクロールをする際、上下10行表示したままスクロールする。
set scrolloff=10

"数値のインクリメントを行う際進数を決める
set nrformats=hex   "16進数
"set nrformats=octal "8進数
"set nrformats=alpha "alphabet

"modeの表示をしない
set noshowmode

"key bind
"----------------------------------------------------------------------------

let mapleader = "\<Space>"

nnoremap <Leader>t :set filetype=markdown formatoptions=q<CR>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap Q <nop>
nnoremap <C-Z> <nop>
nnoremap ZZ <nop>
nnoremap ZQ <nop>

nnoremap H 0
nnoremap L $
vnoremap H 0
vnoremap L $
nnoremap dH d0
nnoremap dL d$
nnoremap yH y0
nnoremap yL y$

vnoremap Q <nop>
vnoremap <C-Z> <nop>

"クリップボードへコピー
vnoremap <Leader> <nop>
nnoremap <Leader> <nop>
vnoremap <Leader>y "*y
vnoremap <Leader>d "*d
nnoremap <Leader>yy "*yy
nnoremap <Leader>dd "*dd
nnoremap <Leader>p "*p
nnoremap <Leader>P "*P
vnoremap <Leader>p "*p
vnoremap <Leader>P "*P

"張り付けたテキストの末尾に自動的に移動
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"新しいタブを開いてタグジャンプ
nnoremap t<C-]> :tab tag <C-R>=expand('<cword>')<CR><CR>

" [tag vertical] 縦にウィンドウを分割してジャンプ
nnoremap tv :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>

" [tag horizon] 横にウィンドウを分割してジャンプ
nnoremap th :split<CR> :exe("tjump ".expand('<cword>'))<CR>

"no hilight
nnoremap <silent> <Leader>h :noh<CR>

"Visual Mode時、選択した範囲を検索
vnoremap * "zy:let @/ = @z<CR>n

xmap ga <Plug>(EasyAlign)<C-p>
rmap ga <Plug>(EasyAlign)<C-p>

let g:easy_align_delimiters = {
\ "(": {'pattern': '(', 'right_margin': 0},
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\}

" netrwは常にtree view
let g:netrw_liststyle = 3
" CVSと.で始まるファイルは表示しない
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1
