" for Python
let g:python_host_prog = '$HOME/.anyenv/envs/pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '$HOME/.anyenv/envs/pyenv/versions/neovim3/bin/python'

"##Main Setting##
set fenc=utf-8                          " 文字コード設定
set nobackup                            " バックアップファイルを作成しない
set noswapfile                          " スワップファイルを作成しない
set autoread                            " 編集中のファイルが変更された場合自動再読込
set clipboard+=unnamed                  " yankしたときにクリップボードにも反映
set backupskip=/tmp/*,/private/tmp/*    " tmpディレクトリではバックアップを行わない

set title                               " 編集中のファイル名表示
" set cursorline
set number

set whichwrap=b,s,h,l,<,>,[,],~         " カーソルの左右移動で行間の移動可能

set tabstop=2                           " 改行時にインデント挿入
set shiftwidth=2                        " タブをn文字の空白に変換
set expandtab                           " タブ入力を空白に変換

set foldmethod=syntax                   " 折りたたみ無効
let perl_fold=1
set foldlevel=100

set splitright                          " 新しい画面を右に開く

set synmaxcol=150                       " syntaxが重くなるのを回避

"##Search Setting##
set ignorecase                          " 大文字/小文字の区別なし
set smartcase                           " 検索パターンに大文字を含む場合大文字/小文字を区別
set wrapscan                            " 検索時、最終行に行ったら最初に折り返す
set hlsearch                            " 検索結果をハイライト
set incsearch                           " リアルタイム検索

" Escキー2度押しでハイライト解除
nnoremap <silent><ESC><ESC> :<C-u>set nohlsearch!<CR>

"##Normal Mode##
" 行が折り返し表示されていた際に行単位でなく表示単位でカーソル移動可能
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
" Window, tab関連
nnoremap s <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap <C-k> gt
nnoremap <C-j> gT
nnoremap st :<C-u>tabnew<CR>

" Leader
let mapleader = "\<Space>"
" 上書き保存
nnoremap <Leader>w :w<CR>
" 保存せず終了
nnoremap <Leader>q :q!<CR>

"## Session
" alias visで前回の状態を回復
autocmd VimLeave * :mks! ~/.vim.session

"##Insert Mode##
inoremap <silent> jj <ESC>

"##Ctags Setting
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis

"## vimgrepでQuickFix開く
autocmd QuickFixCmdPost *grep* cwindow

"## filetype
autocmd BufRead,BufNewFile *.tag setfiletype javascript     " riot.js
autocmd BufRead,BufNewFile *.ts setlocal filetype=typescript
autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx
autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx
autocmd BufRead,BufNewFile *.md set filetype=markdown

let s:dein_config_dir =$XDG_CONFIG_HOME . '/nvim'
let s:dein_cache_dir =$XDG_CACHE_HOME . '/dein'

if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state("~/.cache/dein")
  call dein#begin("~/.cache/dein")

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()       " 起動時に未インストールプラグインがないかチェック
  call dein#install()
endif

filetype plugin indent on
"End dein Scripts-------------------------
"
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
