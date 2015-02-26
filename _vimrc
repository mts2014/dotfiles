" ############# Base ###############

"vi互換の動きにしない
set nocompatible

"左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,<,>,[,]

" バッファをキーで移動
map <F2> <ESC>:bp<CR>
map <F3> <ESC>:bn<CR>


" 検索を循環させない
set nowrapscan

" バックアップファイルを作成しない
set nobackup

" スワップファイルを作成しない
set noswapfile

" 対応括弧の瞬間強調時間
set matchtime=3

" 行番号表示
set number

" 見た目で行移動
nnoremap j gj
nnoremap k gk

" 削除でレジスタに格納しない(ビジュアルモードでの選択後は格納する)
nnoremap x "_x
nnoremap dd "_dd


"水平タブ系の設定==============================================
"デフォルト設定。結局runtime/indentの設定のほうで、ファイルごとに切り替える
" タブとか改行を表示する
set list

" タブとか改行を示す文字列 eol(改行)は背景色違いのスペースにする。
set listchars=tab:>-,extends:<,trail:-,eol:\  

"タブを空白で入力する
set expandtab

"標準タブは2
set tabstop=2
set softtabstop=2

"自動的にインデントする
set autoindent
"実はスマートはウザかったりする。
"set smartindent

"空行のインデントを勝手に消さない
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>


" 文字コード関連
" 文字コードの自動解釈の優先順位
set fileencodings=utf-8,cp932,euc-jp
" 改行コードの解釈優先順位
set fileformats=unix,dos

" 内部の解釈の文字コード　設定ファイルもこのコードで書け
set encoding=utf-8
" 内部の改行コード
set fileformat=unix



" 可視化文字列の設定==================================================================
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"全角スペースを視覚化
if has('syntax')
  syntax enable
  function! ActivateInvisibleIndicator()
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=#FF0000
    match ZenkakuSpace /　/
  endfunction
  augroup InvisibleIndicator
    autocmd!
    autocmd BufEnter * call ActivateInvisibleIndicator()
  augroup END
endif


" クリップボード関係=========================================
" ヤンクをクリップボードへ送り込む
set clipboard+=unnamed,unnamedplus

" バッファ関連=====================================================
"編集中でもバッファを切り替えれるようにしておく
set hidden
"バッファ一覧ショートカット→バッファ番号で移動
nmap gb :ls<CR>:buf 


" ステータスエリア関係
"ステータスのところにファイル情報表示
set statusline=%<[%n]%F%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l,%c\ %P 

"ルーラーを表示
set ruler
set title

" 矩形選択で行末を超えてブロックを選択できるようにする
set virtualedit+=block


"escでハイライトをオフ
nnoremap <silent> <ESC> <ESC>:noh<CR>
" ノーマルモード中でもエンターキーで改行挿入でノーマルモードに戻る
noremap <CR> i<CR><ESC>

" 挿入モードでctrl+T二回うちで現在時刻挿入
imap <silent> <C-T><C-T> <C-R>=strftime("%H:%M:%S")<CR>


" コマンドラインの設定===============
" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000

" 色の設定===============
colorscheme hybrid

" markdown
au BufRead,BufNewFile *.md set filetype=markdown

" ビジュアルモード選択した部分を*で検索
vnoremap * "zy:let @/ = @z<CR>n

" ############# NeoBundle ###############

if has('vim_starting')
  set nocompatible               " Be iMproved
 
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
 
" My Bundles here:
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/nerdtree'
"   for markdown http://www.key-p.com/blog/staff/archives/9032
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
 
call neobundle#end()
 
" Required:
filetype plugin indent on
 
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" ############# NERDTree ###############

" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
 
" デフォルトでツリーを表示させる
" autocmd VimEnter * execute 'NERDTree'

