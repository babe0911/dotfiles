

"---------------------------------------------
"--- Plugin 管理
"---------------------------------------------

let s:dein_dir=expand('~/.vim/dein')
let s:dein_repo_dir=s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible               " Be iMproved
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('scrooloose/syntastic')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-fugitive.git')
call dein#add('junegunn/vim-easy-align')
call dein#add('itchyny/lightline.vim')
call dein#add('luochen1990/rainbow')

call dein#end()
call dein#save_state()

endif

if has('vim_starting') && dein#check_install()
  call dein#install()
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

"タブの移動
nnoremap  <C-l> :tabn<CR>
nnoremap  <C-h> :tabp<CR>
nnoremap  <C-n> :tabnew<CR>

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

"構文チェックの結果を閉じる
nnoremap <Leader>c :<C-u>SyntasticCheck<CR>
nnoremap <Leader>s :<C-u>SyntasticReset<CR>


"保存
nnoremap <Leader>w :w<CR>

"vnoremap <Leader>e <Plug>(EasyAlign)
map <Leader>e <Plug>(EasyAlign)<C-p>

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

"lightline設定
"----------------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme'        : 'solarized',
      \ 'mode_map'           : { 'c': 'NORMAL' },
      \ 'active'             : {
      \   'left'             : [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function' : {
      \   'modified'         : 'LightlineModified',
      \   'readonly'         : 'LightlineReadonly',
      \   'fugitive'         : 'LightlineFugitive',
      \   'filename'         : 'LightlineFilename',
      \   'fileformat'       : 'LightlineFileformat',
      \   'filetype'         : 'LightlineFiletype',
      \   'fileencoding'     : 'LightlineFileencoding',
      \   'mode'             : 'LightlineMode',
      \ },
      \ 'separator'          : { 'left': '', 'right': '' },
      \ 'subseparator'       : { 'left': '|', 'right': '|' }
      \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '×' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

"function! LightlineFugitive()
"  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
"    let branch = fugitive#head()
"    return branch !=# '' ? ' '.branch : ''
"  endif
"  return ''
"endfunction

function! LightlineFugitive()
  if exists('*fugitive#head') 
      let branch = fugitive#head()
      return branch !=# '' ? '√'.branch : ''
  endif
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


"Syntastic設定
"----------------------------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_verilog_remove_include_errors = 1
let g:syntastic_verilog_checkers = ['iverilog']
let g:syntastic_mode_map = { 'mode': 'passive', 'passive_filetypes': ['verilog'] }

"NERDTree設定
"----------------------------------------------------------------------------

nnoremap <silent><Leader>n :NERDTreeToggle<CR>

"起動時にNERDTreeを表示
autocmd VimEnter * execute 'NERDTree'

" ブックマークを最初から表示
let g:NERDTreeShowBookmarks=1

" ファイル指定で開かれた場合はNERDTreeは表示しない
if !argc()
    autocmd vimenter * NERDTree|normal gg3j
endif


"Rainbow
"----------------------------------------------------------------------------

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
