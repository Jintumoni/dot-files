syntax on
set termguicolors
set guicursor=
set encoding=UTF-8
set relativenumber
" set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=4
set nowrap
set shiftwidth=4
set expandtab
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
" Give more space for displaying messages.
set cmdheight=1
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=1
filetype plugin on

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set rtp+=~/.vim/bundle/nerdtree
" highlight ColorColumn ctermbg=0 guibg=lightgren('~/.vim/plugged')
function Template(tmpl_file)
    exe "0read " . a:tmpl_file
    let substDict = {}
    let substDict["date"] = strftime("%d %b %Y %X")
    exe '%s/<<\([^>]*\)>>/\=substDict[submatch(1)]/g'
    set nomodified
    normal G
endfunction

autocmd BufNewFile *.c,*.cc,*.cpp,*.h call Template("~/.vim/tmpl.cpp")

call plug#begin('~/.vim/plugged')
Plug 'rakr/vim-one'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/Tabtastic'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'nlknguyen/papercolor-theme'
Plug 'sainnhe/gruvbox-material'
Plug 'jremmen/vim-ripgrep'
Plug 'chrisbra/vim-autosave'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Jintumoni/DSA'
Plug 'Valloric/YouCompleteMe'
Plug 'matze/vim-move'
Plug 'kien/ctrlp.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'
call plug#end()
autocmd TextChanged, TextChangedI <buffer> silent write
"atom one theme"
" colorscheme one 
" set background=dark"
"
"nightfly theme" 
"let g:nightflyCursorColor = 1
" let g:nightflyUnderlineMatchParen = 1
" let g:nightfly_contrast_dark = 'medium'
"
" gruvbox theme
 " let g:gruvbox_contrast_dark = 'hard'
 " " let g:autosave_timer      = 5000
 " colorscheme gruvbox
 " " colorscheme nightfly
 " set background=dark
"
" solarised theme
" set background=light
" colorscheme solarized

colorscheme gruvbox 
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" let CtrlP use ripgrep as the search engine
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif

" let g:gruvbox_invert_selection='0'
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
" let g:airline_theme='wombat'
let g:move_key_modifier = 'S'
let g:vim_be_good_log_file = 1
let g:airline#extensions#tabline#enabled = 1


if executable('rg')
    let g:rg_derive_root='true'
endif

" let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_branch_actions = {
      \ 'rebase': {
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>

nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
" nnoremap <leader>h :wincmd h<CR>
" nnoremap <leader>j :wincmd j<CR>
" nnoremap <leader>k :wincmd k<CR>
" nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string()<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv
" vnoremap X "_d

" greatest remap ever
vnoremap <leader>p "_dP
" vim TODO
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

" Vim with me
nnoremap <leader>vwm :colorscheme gruvbox<bar>:set background=dark<CR>
nmap <leader>vtm :highlight Pmenu ctermbg=gray guibg=gray

inoremap <C-c> <esc>


nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" YES
com! W w

fun! ThePrimeagen_LspHighlighter()
    lua print("Testing")
    lua package.loaded["my_lspconfig"] = nil
    lua require("my_lspconfig")
endfun

com! SetLspVirtualText call ThePrimeagen_LspHighlighter()

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
nnoremap<silent> <Leader>v : NERDTreeFind<CR>
"" NERDTree configuration
let NERDTreeMinimalUI=1
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize =20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
" nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
" map <F8> :w <CR> :!clear ; mk %:r &&  rn %:r <CR>
map <F8> :w <CR> :!clear ; mk.sh %:r &&  rn.sh %:r <CR>
:imap jj <Esc>
nnoremap <C-c> :!g++ -o  %:r % -std=c++17 -Wall -Wextra -Wshadow -fsanitize=address -fsanitize=undefined -Wshift-overflow -D_GLIBCXX_DEBUG  -fno-omit-frame-pointer<Enter>
nnoremap <C-x> :!./%:r <Enter>
" nmap <leader>alg AlgDS<CR>
:vnoremap <Leader>c "*y 
" autocmd vimenter * let &shell='/bin/zsh -i' 
" auto-save fold views
augroup AutoSaveFolds
autocmd!
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent loadview
augroup END
