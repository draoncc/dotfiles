if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"
"
" PLUGINS
"
"
call plug#begin()
Plug 'Shougo/deoplete.nvim', {'do':':UpdateRemotePlugins'} " Asynchronous keyword completion
"Plug 'zchee/deoplete-go', {'do':'make'}
"Plug 'fatih/vim-go', {'do':':GoUpdateBinaries'}            " Go bindings for vim

Plug 'w0rp/ale'                          " Asynchronous Linting Engine
Plug 'mhinz/vim-grepper'                 " Asonchronous grepper
Plug 'itchyny/lightline.vim'             " Statusbar replacement
Plug 'kaicataldo/material.vim'           " Material colorscheme
Plug 'ctrlpvim/ctrlp.vim'                " Fuzzy finder
Plug 'vim-scripts/Vimball'               " Support for creating, extracting and listing
                                         " vimball archives (*.vba)
Plug 'vim-scripts/auto-pairs-gentle'     " Gentle version of automatic parens

" Syntax highlighting plugins
Plug 'ekalinin/Dockerfile.vim'           " Dockerfile
Plug 'hashivim/vim-terraform'            " Terraform
Plug 'garyharan/vim-proto'               " ProtoBuf
Plug 'pangloss/vim-javascript'           " JS ES6
Plug 'posva/vim-vue'                     " Vue.js components
Plug 'mxw/vim-jsx'                       " React JSX
Plug 'HerringtonDarkholme/yats.vim'      " TypeScript
Plug 'jparise/vim-graphql'               " GraphQL
Plug 'dart-lang/dart-vim-plugin'         " Dart
Plug 'vmchale/dhall-vim'                 " Dhall
Plug 'jvirtanen/vim-hcl'                 " HashiCorp HCL
Plug 'cespare/vim-toml'                  " TOML

" Snippets
Plug 'Shougo/neosnippet.vim'             " Snippet support
Plug 'Shougo/neosnippet-snippets'        " Standard snippets for neosnippet
Plug 'isRuslan/vim-es6'                  " JS ES6 snippets
Plug 'mhartington/vim-angular2-snippets' " Angular 2 snippets for neosnippet
call plug#end()

"
"
" COLORS
" 
"
let g:material_theme_style = 'darker'
let g:material_terminal_italics = 1
if (has('termguicolors'))
  set termguicolors
endif
colorscheme material
hi Normal ctermbg=none guibg=none
hi NonText ctermbg=none guibg=none
hi ColorColumn ctermbg=238 guibg=#303030

"
"
" VIM STANDARD
"
"
filetype off              " Reset filetype detection...
filetype plugin indent on " ... enable filetype detection
set tabstop=2             " Indendation of 2 spaces
set shiftwidth=2          " Delete number of spaces as tabwidth
set expandtab             " Use spaces instead of real tab
set autowrite             " Auto-save before compiling
set undofile              " Persistent undo files
set undodir=$HOME/.config/nvim/undo
set showcmd               " Show what is being typed
set colorcolumn=80        " Highlight lines over 80 chars long

"
"
" PLUGIN CONFIG
" 
"
" Lightline lightline LIGHTLINE
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \ }
      \ }

" Configure vim-go (see https://github.com/fatih/vim-go)
"let g:go_highlight_functions = 1         " Nicer syntax highligting
"let g:go_highlight_methods = 1
"let g:go_highlight_types = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_generate_tags = 1
"let g:go_fmt_command = "goimports"       " Automatically import on save
"let g:go_list_type = "quickfix"          " Open quickfix instead of location list
"let g:go_autodetect_gopath = 1           " Automatically detect gopath

" Ale ale ALE
" :ALELint
let g:ale_linters = {
\   'javascript': ['standard'],
\   'typescript': ['tslint'],
\}

" :ALEFix.
let g:ale_fixers = {
\   'javascript': ['prettier', 'standard'],
\   'typescript': ['prettier', 'tslint'],
\   'html': ['prettier'],
\}

" Overwrite fixing and linting for .ts files
let g:ale_pattern_options = {
\   '.*\.tsx\?$': {
\     'ale_linters': ['tslint'],
\     'ale_fixers': ['prettier', 'tslint'],
\   },
\}

" Fix files automatically on save
let g:ale_fix_on_save = 1

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0

" Gentle auto pairs
let g:AutoPairsUseInsertedCount = 1

" Autocompletion
set completeopt+=noinsert " neocomplete like
set completeopt+=noselect " deoplete.nvim recommend
set completeopt-=preview  " don't need preview
let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'

" Other
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim " Fix vim-slim html override
autocmd BufNewFile,BufRead *.slm setlocal filetype=slm   " Fix vim-slm html override

" neosnippet
let g:neosnippet#enable_snipmate_compatibility = 1 " Enable snipMate compatibility feature.

"
"
" CUSTOM KEYS
"
"
map ; :
noremap ;; ;

" copying and pasting to xsel shortcuts
nnoremap <Leader>p :read !xsel -o -b<CR>
nnoremap <Leader>y <S-v>:write !xsel -i -b<CR><CR>
vnoremap <Leader>y :write !xsel -i -b<CR><CR>

" i3-like behaviour for split win with alt + shift as mod key
"nnoremap <M-n> <C-W><Up>
"nnoremap <M-t> <C-W><Down>
"nnoremap <M-h> <C-W><Left>
"nnoremap <M-s> <C-W><Right>
"nnoremap <M-;> <C-W>q
"nnoremap <M-S-j> :<C-U>exec 'source '.$HOME.'/.config/nvim/init.vim'<CR>

" ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" vim-grepper
nnoremap <Leader>/ :Grepper -tool ag -jump -noswitch -buffers<CR>
nnoremap <Leader>? :Grepper -tool ag -jump -noswitch<CR>
nnoremap <Leader>* :Grepper -tool ag -cword -noprompt<CR>

nmap gs <Plug>(GrepperOperator)
xmap gs <Plug>(GrepperOperator)

" deoplete
" Use tap for cycling completion when completion window is open.
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" neosnippet
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" https://github.com/tpope/vim-unimpaired/blob/master/plugin/unimpaired.vim
function! s:MapNextFamily(map,cmd)
  let cmd = '".(v:count ? v:count : "")."'.a:cmd
  let end = '"<CR>'.(a:cmd == 'l' || a:cmd == 'c' ? 'zv' : '')
  execute 'nmap <silent> ['.        a:map .' :<C-U>exe "'.cmd.'previous'.end
  execute 'nmap <silent> ]'.        a:map .' :<C-U>exe "'.cmd.'next'.end
  execute 'nmap <silent> ['.toupper(a:map).' :<C-U>exe "'.cmd.'first'.end
  execute 'nmap <silent> ]'.toupper(a:map).' :<C-U>exe "'.cmd.'last'.end
  if exists(':'.a:cmd.'nfile')
    execute 'nmap <silent> [<C-'.a:map.'> :<C-U>exe "'.cmd.'pfile'.end
    execute 'nmap <silent> ]<C-'.a:map.'> :<C-U>exe "'.cmd.'nfile'.end
  endif
endfunction

call s:MapNextFamily('a','')
call s:MapNextFamily('b','b')
call s:MapNextFamily('l','l')
call s:MapNextFamily('q','c')
call s:MapNextFamily('t','t')

nmap <silent> [f :<C-U>exe 'cc'.v:count1<CR>zv
nmap <silent> [F :<C-U>exe 'll'.v:count1<CR>zv

" go-vim
"augroup go
"  autocmd!
"
"  autocmd FileType go nmap <Leader>rt <Plug>(go-run-tab)
"  autocmd FileType go nmap <Leader>rs <Plug>(go-run-split)
"  autocmd FileType go nmap <Leader>rv <Plug>(go-run-vertical)
"
"  autocmd FileType go nmap <Leader>r <Plug>(go-run)
"  autocmd FileType go nmap <Leader>b <Plug>(go-build)
"  autocmd FileType go nmap <Leader>t <Plug>(go-test)
"  autocmd FileType go nmap <Leader>c <Plug>(go-coverage)
"
"  autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
"  autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
"  autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)
"
"  autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
"  autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
"
"  autocmd FileType go nmap <Leader>s <Plug>(go-implements)
"  autocmd FileType go nmap <Leader>i <Plug>(go-info)
"  autocmd FileType go nmap <Leader>e <Plug>(go-rename)
"augroup END
