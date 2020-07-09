" VIM CONFIG "

" Misc Options
set background=dark
set splitright
set updatetime=100
set hidden
set backupdir=,~/.cache/nvim/tmp
set backupext=string
set nowritebackup
set signcolumn=yes
set encoding=utf-8
set t_Co=256
set noerrorbells
set guicursor=a:ver25
set mouse=a
set tabstop=2
set shiftwidth=2
set expandtab
set scrolloff=8
set noshowmatch
set relativenumber
set smartcase
set undodir=~/.cache/nvim/undodir
set undofile
set incsearch
set shortmess+=c
set viminfo+=n~/.vim/viminfo

" Let definitions
let mapleader = " "
let loaded_matchparen = 1

"""""""""""""""" Plugins """""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'ntk148v/vim-horizon' " Theme
Plug 'gruvbox-community/gruvbox'
Plug 'Yggdroot/indentLine' " Config for Indents
Plug 'sheerun/vim-polyglot'  " Language Packs
Plug 'xuhdev/SingleCompile' " compile code within buffer
Plug 'vimwiki/vimwiki' " md syntax + org-mode like wiki
Plug 'terryma/vim-multiple-cursors' " mulitple cursors derived from emacs
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " Autocomplete
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Search
Plug 'junegunn/fzf.vim' " Fuzzy Seach
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'css', 'json', 'markdown', 'yaml', 'html'] } " Format Code
Plug 'mbbill/undotree' " Undo Tree
Plug 'tpope/vim-commentary' " Comment/Uncomment Lines
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go Langauge Support
Plug 'tpope/vim-fugitive' " Git
Plug 'vim-airline/vim-airline' " Bar
Plug 'vim-airline/vim-airline-themes' " Bar Theme Presets
Plug 'ap/vim-css-color'
Plug 'amiralies/coc-discord'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses.vim'

call plug#end()


"""""""""""""""" Theming """""""""""""""""""""""
" Misc options
filetype plugin on
set omnifunc=syntaxcomplete#Complete
syntax on
highlight Pmenu ctermbg=111217 guibg=#111217

" Theme
colorscheme gruvbox
" colorscheme horizon
let ayucolor="dark"

" airline
" let g:airline_theme = "base16_spacemacs"
let g:airline_theme = "wombat"
" let g:lightline = {'colorscheme' : 'horizon'}

"""""""""""""""" Plugins Config """""""""""""""""""""""

nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<Enter>
nnoremap <C-x> :!./%:r.out

autocmd BufWinEnter * set fo-=c fo-=r fo-=o

" Indent Line
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" --- vim go (polyglot) settings.
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

" Change colour for Parentheses based on file type
augroup rainbow
  autocmd!
  autocmd FileType go,rust,python,c,c++,lisp,scheme RainbowParentheses
augroup END

" " fzf.vim
let g:fzf_preview_window = ''

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" Vim In-built FM  Options
let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

" prettier
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

if executable('rg')
    let g:rg_derive_root='true'
endif

" // on a word to go to the next version of that
vnoremap // y/\V<C-R>=escape(@", '/\')<CR><CR>

"""""""""""""""" Mapping and Misc Features """""""""""""""""""""""

" Basic remaps.  This is where the magic of vim happens
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader>u :UndotreeShow<CR>
nmap <s-p> :Rg<CR>
nnoremap <C-j> :x<CR>
nnoremap <C-k> :q!<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.vim/vimrc<CR>
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" nnoremap <C-c> :!g++ -o %< % -std=c++17<Enter>

" maps function that compiles and runs code (only compiled code)
nmap <Leader>m :SCCompileRun<CR>

" autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r -W<CR>

" autocmd filetype cpp nnoremap <F10> :!%:r<CR>

" runs code in python buffer
nnoremap <F5> <ESC>:w<CR>:!python %<CR>

" go
au FileType go nmap <leader>rv <Plug>(go-run-vertical)

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

vnoremap X "_d

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

" Bindings
autocmd FileType rmd map <F7> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
autocmd BufWritePre * %s/\s\+$//e

"""""""""""""""" CoC (Autocomplete)"""""""""""""""""""""""

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
