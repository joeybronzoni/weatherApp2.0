"
" ----------------------------------------------------------------------
" | General Settings                                                   |
" ----------------------------------------------------------------------
set nocompatible               " Don't make vim vi-compatibile

syntax on                      " Enable syntax highlighting

 if has("autocmd")
    filetype plugin indent on
    "           │     │    └──── Enable file type detection
    "           │     └───────── Enable loading of indent file
    "           └─────────────── Enable loading of plugin files
endif

set autoindent                 " Copy indent to the new line

set backspace=indent           " ┐
set backspace+=eol             " │ Allow `backspace`
set backspace+=start           " ┘ in insert mode

set backupdir=~/.vim/backups   " Set directory for backup files
set backupskip=/tmp/*          " ┐ Don't create backups

set backupskip+=/private/tmp/* " ┘ for certain files

set clipboard=unnamed          " ┐
                               " │ Use the system clipboard
if has("unnamedplus")          " │ as the default register
    set clipboard+=unnamedplus " │
endif                          " ┘

""" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<Leader>a "\a before pasting to preserve indentation
"Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"

set cpoptions+=$               " When making a change, don't
                               " redisplay the line, and instead,
                               " put a `$` sign at the end of
                               " the changed text

"color desert
set cursorline                 " Highlight the current line
set directory=~/.vim/swaps     " Set directory for swap files
set encoding=utf-8 nobomb      " Use UTF-8 without BOM
set history=5000               " Increase command line history
set hlsearch                   " Enable search highlighting
set ignorecase                 " Ignore case in search patterns

set incsearch                  " Highlight search pattern as
                               " it is being typed

set laststatus=2               " Always show the status line

set lazyredraw                 " Do not redraw the screen while
                               " executing macros, registers
                               " and other commands that have
                               " not been typed

set listchars=tab:▸\           " ┐
set listchars+=trail:·         " │ Use custom symbols to
set listchars+=eol:↴           " │ represent invisible characters
set listchars+=nbsp:_          " ┘

set magic                      " Enable extended regexp
set mousehide                  " Hide mouse pointer while typing
set noerrorbells               " Disable error bells

set nojoinspaces               " When using the join command,
                               " only insert a single space
                               " after a `.`, `?`, or `!`

set nostartofline              " Kept the cursor on the same column
set number                     " Show line number. Disable temp with :set nonu
set relativenumber             " Show line numbers relative to cursor position, this is useful to move between lines. Disable temp with :set nornu

set numberwidth=5              " Increase the minimal number of
                               " columns used for the `line number`

set report=0                   " Report the number of lines changed
set ruler                      " Show cursor position

set scrolloff=5                " When scrolling, keep the cursor
                               " 5 lines below the top and 5 lines
                               " above the bottom of the screen

set shortmess=aAItW            " Avoid all the hit-enter prompts
set showcmd                    " Show the command being typed
set showmode                   " Show current mode
set spelllang=en_us            " Set the spellchecking language

set smartcase                  " Override `ignorecase` option
                               " if the search pattern contains
                               " uppercase characters

set synmaxcol=2500             " Limit syntax highlighting (this
                               " avoids the very slow redrawing
                               " when files contain long lines)

set tabstop=4                  " ┐
set softtabstop=4              " │ Set global <TAB> settings
set shiftwidth=4               " │ http://vimcasts.org/e/2
set expandtab                  " ┘

set ttyfast                    " Enable fast terminal connection
set undodir=~/.vim/undos       " Set directory for undo files
set undofile                   " Automatically save undo history
set virtualedit=all            " Allow cursor to be anywhere

set visualbell                 " ┐
set noerrorbells               " │ Disable beeping and window flashing

set t_vb=                      " ┘ https://vim.wikia.com/wiki/Disable_beeping
set wildmenu                   " Enable enhanced command-line
                               " completion (by hitting <TAB> in
                               " command mode, Vim will show the
                               " possible matches just above the
                               " command line with the first
                               " match highlighted)

set winminheight=0             " Allow windows to be squashed

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


" Load up all of our plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load up all of our plugins
if filereadable(expand("~/.vim.autoloads"))
  source ~/.vimrc/autoloads
endif

" Show syntax highlighting groups for word under cursor
nmap <C-S-S> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Remove trailing spaces on save
" https://makandracards.com/makandra/11541-how-to-not-leave-trailing-whitespace-using-your-editor-or-git
autocmd BufWritePre * :%s/\s\+$//e


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~MINE
"~~~~~Vundle~~~~~~~~~~~~~~~~~~
filetype off                  " required

" Initialize plugin system
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/.vim/bundle/')
" let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'
 "~~~~~~MYPLUGINS ~~~~~~~~~~~~~~~~~~
 Plugin 'junegunn/vim-plug'
 Plugin 'heavenshell/vim-tslint'
 Plugin 'prettier/vim-prettier'
 Plugin 'ianks/vim-tsx'
 Plugin 'dikiaap/minimalist'
" Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plugin 'leafgarland/typescript-vim'
 Plugin 'Quramy/vim-js-pretty-template'
 Plugin 'jason0x43/vim-js-indent'
 Plugin 'Quramy/vim-dtsm'
 Plugin 'mhartington/vim-typings'
 Plugin 'w0rp/ale'
 Plugin 'tpope/vim-surround'
 Plugin 'terryma/vim-multiple-cursors'
" Plugin 'itchyny/lightline.vim'
 Plugin 'junegunn/fzf.vim'
" Plugin 'mattn/emmet-vim'
 Plugin 'vim-airline/vim-airline'
 Plugin 'vim-airline/vim-airline-themes'
 Plugin 'flazz/vim-colorschemes'
 Plugin 'felixhummel/setcolors.vim'
 Plugin 'gko/vim-coloresque'
 Plugin 'ctrlpvim/ctrlp.vim'
 Plugin 'vim-scripts/tComment' "Comment easily with gcc
 " [8] Snippets
 Plugin 'ervandew/supertab'
 Plugin 'justinj/vim-react-snippets'
 " [11] Move code
 Plugin 'tpope/vim-unimpaired'
 Plugin 'Quramy/tsuquyomi'
 Plugin 'jparise/vim-graphql'
 Plugin 'othree/es.next.syntax.vim'



 	set t_Co=256
	set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		\,sm:block-blinkwait175-blinkoff150-blinkon175

	if &term =~ '256color'
		set t_ut=
	endif

	if (has("termguicolors"))
		if (!(has("nvim")))
			let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
			let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
		endif
		set termguicolors
	endif

	match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

	Plugin 'morhetz/gruvbox'
	Plugin 'arcticicestudio/nord-vim'
	Plugin 'joshdick/onedark.vim'
	Plugin 'Rigellute/shades-of-purple.vim'
	Plugin 'chriskempson/base16-vim'

 "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~LightLine~~~~~~~~~~~~~~~~~~~~~~~~
" LightLine {{{
		Plugin 'itchyny/lightline.vim'
		Plugin 'nicknisi/vim-base16-lightline'

		let g:lightline = {
			\	'colorscheme': 'base16',
			\	'active': {
			\		'left': [ [ 'mode', 'paste' ],
			\				[ 'gitbranch' ],
			\				[ 'readonly', 'filetype', 'filename' ]],
			\		'right': [ [ 'percent' ], [ 'lineinfo' ],
			\				[ 'fileformat', 'fileencoding' ],
			\				[ 'linter_errors', 'linter_warnings' ]]
			\	},
			\	'component_expand': {
			\		'linter': 'LightlineLinter',
			\		'linter_warnings': 'LightlineLinterWarnings',
			\		'linter_errors': 'LightlineLinterErrors',
			\		'linter_ok': 'LightlineLinterOk'
			\	},
			\	'component_type': {
			\		'readonly': 'error',
			\		'linter_warnings': 'warning',
			\		'linter_errors': 'error'
			\	},
			\	'component_function': {
			\		'fileencoding': 'LightlineFileEncoding',
			\		'filename': 'LightlineFileName',
			\		'fileformat': 'LightlineFileFormat',
			\		'filetype': 'LightlineFileType',
			\		'gitbranch': 'LightlineGitBranch'
			\	},
			\	'tabline': {
			\		'left': [ [ 'tabs' ] ],
			\		'right': [ [ 'close' ] ]
			\	},
			\	'tab': {
			\		'active': [ 'filename', 'modified' ],
			\		'inactive': [ 'filename', 'modified' ],
			\	},
			\	'separator': { 'left': '', 'right': '' },
			\	'subseparator': { 'left': '', 'right': '' }
			\ }

		function! LightlineFileName() abort
			let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
			if filename =~ 'NERD_tree'
				return ''
			endif
			let modified = &modified ? ' +' : ''
			return fnamemodify(filename, ":~:.") . modified
		endfunction

		function! LightlineFileEncoding()
			" only show the file encoding if it's not 'utf-8'
			return &fileencoding == 'utf-8' ? '' : &fileencoding
		endfunction

		function! LightlineFileFormat()
			" only show the file format if it's not 'unix'
			let format = &fileformat == 'unix' ? '' : &fileformat
			return winwidth(0) > 70 ? format . ' ' . WebDevIconsGetFileFormatSymbol() : ''
		endfunction

		function! LightlineFileType()
			return WebDevIconsGetFileTypeSymbol()
		endfunction

		function! LightlineLinter() abort
			let l:counts = ale#statusline#Count(bufnr(''))
			return l:counts.total == 0 ? '' : printf('×%d', l:counts.total)
		endfunction

		function! LightlineLinterWarnings() abort
			let l:counts = ale#statusline#Count(bufnr(''))
			let l:all_errors = l:counts.error + l:counts.style_error
			let l:all_non_errors = l:counts.total - l:all_errors
			return l:counts.total == 0 ? '' : '⚠ ' . printf('%d', all_non_errors)
		endfunction

		function! LightlineLinterErrors() abort
			let l:counts = ale#statusline#Count(bufnr(''))
			let l:all_errors = l:counts.error + l:counts.style_error
			return l:counts.total == 0 ? '' : '✖ ' . printf('%d', all_errors)
		endfunction

		function! LightlineLinterOk() abort
			let l:counts = ale#statusline#Count(bufnr(''))
			return l:counts.total == 0 ? 'OK' : ''
		endfunction

		function! LightlineGitBranch()
			return "\uE725" . (exists('*fugitive#head') ? fugitive#head() : '')
		endfunction

		function! LightlineUpdate()
			if g:goyo_entered == 0
				" do not update lightline if in Goyo mode
				call lightline#update()
			endif
		endfunction

		augroup alestatus
		autocmd User ALELintPost call LightlineUpdate()
		augroup end
	" }}}

" }}}
" ~~~~~~~~~~~~~~~~~~~~~LightLine_END~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"


" vim-plug plugin-manager:
 call plug#begin('~/.vim/autoload/')
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
  Plug 'Shougo/vimproc.vim'
call plug#end()

"  Writing in vim {{{{
        Plugin 'junegunn/goyo.vim'

        let g:goyo_entered = 0
        function! s:goyo_enter()
            silent !tmux set status off
            let g:goyo_entered = 1
            set noshowmode
            set noshowcmd
            set scrolloff=999
            set wrap
            setlocal textwidth=0
            setlocal wrapmargin=0
        endfunction

        function! s:goyo_leave()
            silent !tmux set status on
            let g:goyo_entered = 0
            set showmode
            set showcmd
            set scrolloff=5
            set textwidth=120
            set wrapmargin=8
        endfunction

        autocmd! User GoyoEnter nested call <SID>goyo_enter()
        autocmd! User GoyoLeave nested call <SID>goyo_leave()
    " }}}

" NERDTree {{{
        Plugin 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
        Plugin 'Xuyuanp/nerdtree-git-plugin'
        Plugin 'ryanoasis/vim-devicons'
        Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
        let g:WebDevIconsOS = 'Darwin'
        let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        let g:DevIconsEnableFoldersOpenClose = 1
        let g:DevIconsEnableFolderExtensionPatternMatching = 1
        let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
        let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
        let NERDTreeNodeDelimiter = "\u263a" " smiley face

        augroup nerdtree
            autocmd!
            autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
            autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
        augroup END

        " Toggle NERDTree
        function! ToggleNerdTree()
            if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
                :NERDTreeFind
            else
                :NERDTreeToggle
            endif
        endfunction
        " toggle nerd tree
        nmap <silent> <leader>k :call ToggleNerdTree()<cr>
        " find the current file in nerdtree without needing to reload the drawer
        nmap <silent> <leader>y :NERDTreeFind<cr>

        let NERDTreeShowHidden=1
        " let NERDTreeDirArrowExpandable = '▷'
        " let NERDTreeDirArrowCollapsible = '▼'
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
    " }}}

 " JavaScript {{{
		Plugin 'othree/yajs.vim', { 'for': [ 'javascript', 'javascript.jsx', 'html' ] }
		" Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] }
		Plugin 'moll/vim-node', { 'for': 'javascript' }
		Plugin 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] }
		Plugin 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'yarn install' }
	" }}}

	" TypeScript {{{
		Plugin 'leafgarland/typescript-vim', { 'for': 'typescript' }
		"Plugin 'Shougo/vimproc.vim'  ", { 'do': 'make' }
"		Plugin 'Shougo/vimproc.vim', { 'do': 'nmake -f make_msvc.mak nodebug=1'}
	" }}}

	" Styles {{{
		Plugin 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
		Plugin 'groenewege/vim-less', { 'for': 'less' }
		Plugin 'hail2u/vim-css3-syntax', { 'for': 'css' }
		Plugin 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
		Plugin 'stephenway/postcss.vim', { 'for': 'css' }

		Plugin 'RRethy/vim-hexokinase'
		let g:Hexokinase_highlighters = ['virtual']
		let g:Hexokinase_refreshEvents = ['BufWritePost']
		let g:Hexokinase_ftAutoload = ['css']
		" let g:Hexokinase_virtualText = '█'
		let g:Hexokinase_virtualText = '■'
	" }}}

	" markdown {{{
		Plugin 'tpope/vim-markdown', { 'for': 'markdown' }
	" }}}

	" JSON {{{
		Plugin 'elzr/vim-json', { 'for': 'json' }

		let g:vim_json_syntax_conceal = 0
	" }}}

	Plugin 'fatih/vim-go', { 'for': 'go' }
	Plugin 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
	Plugin 'joukevandermaas/vim-ember-hbs', { 'for': 'html.handlebars' }
	Plugin 'josemarluedke/ember-vim-snippets', { 'for': ['html.handlebars', 'javascript.jsx'] }

 "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Javascript plugin~~~~~~~~~~~~~~~~~~~~~~~~~"
 let g:javascript_plugin_jsdoc = 1
 let g:javascript_plugin_ngdoc = 1
 let g:javascript_plugin_flow = 1
 augroup javascript_folding
     au!
     au FileType javascript setlocal foldmethod=syntax
 augroup END
 let g:javascript_conceal_function             = "ƒ"
 let g:javascript_conceal_null                 = "ø"
 let g:javascript_conceal_this                 = "@"
 let g:javascript_conceal_return               = "⇚"
 let g:javascript_conceal_undefined            = "¿"
 let g:javascript_conceal_NaN                  = "ℕ"
 let g:javascript_conceal_prototype            = "¶"
 let g:javascript_conceal_static               = "•"
 let g:javascript_conceal_super                = "Ω"
 let g:javascript_conceal_arrow_function       = "⇒"
 let g:javascript_conceal_noarg_arrow_function = "🞅"
 let g:javascript_conceal_underscore_arrow_function = "🞅"
 map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
 let g:jsx_ext_required = 0
" }}}
"
"
 " Language-Specific Configuration {{{
	" html / templates {{{
		" emmet support for vim - easily create markdup wth CSS-like syntax
		Plugin 'mattn/emmet-vim', { 'for': ['html', 'javascript.jsx', 'javascript' ]}
        let g:user_emmet_settings = {
			\  'javascript.jsx': {
			\		 'extends': 'jsx',
			\  },
			\}

		" match tags in html, similar to paren support
		Plugin 'gregsexton/MatchTag', { 'for': 'html' }

		" html5 support
		Plugin 'othree/html5.vim', { 'for': 'html' }

		" mustache support
		Plugin 'mustache/vim-mustache-handlebars'

		" pug / jade support
		Plugin 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
	" }}}

 " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher (a lot
 " faster than grep)
 if executable('ag')
   " Use Ag over Grep
   set grepprg=ag\ --nogroup\ --nocolor

   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
   let g:ctrlp_working_path_mode = 'r'

   " ag is fast enough that CtrlP doesn't need to cache
   let g:ctrlp_use_caching = 0

   let g:ctrlp_extensions = ['line']
 endif


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"~~~~~Vundle_END~~~~~~~~~~~~~~~~~~





























"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Javascript_END~~~~~~~~~~~~~~~~~~~~~~~~~"



"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~NERDTREE~~~~~~~~~~~~~~~~~~~~~~~~~"
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
map &lt;Leader>n :NERDTreeFind&lt;CR>
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~NERDTREE_END~~~~~~~~~~~~~~~~~~~~~~~~~"
		let g:ale_linters = {
			\	'javascript': ['eslint'],
				\	'javascript.jsx': ['eslint'],
			\	'typescript': ['tsserver', 'tslint'],
			\	'html': []
		\}
		let g:ale_fixers = {}
		let g:ale_fixers['javascript'] = ['prettier', 'prettier-eslint']
		let g:ale_fixers['typescript'] = ['prettier', 'tslint']
		let g:ale_fixers['json'] = ['prettier']
		let g:ale_fixers['css'] = ['prettier']
		let g:ale_javascript_prettier_use_local_config = 1
		let g:ale_fix_on_save = 1

"let g:ale_typescript_tslint_config_path = '/c/Users/U716527/AppData/Roaming/npm/tsc'
"let g:ale_typescript_tsserver_config_path = '/c/Users/U716527/AppData/Roaming/npm/tsserver'

 augroup tslint
   function! s:typescript_after(ch, msg)
     let cnt = len(getqflist())
     if cnt > 0
       echomsg printf('[Tslint] %s errors', cnt)
     endif
   endfunction
   let g:tslint_callbacks = {
     \ 'after_run': function('s:typescript_after')
     \ }

   let g:tsuquyomi_disable_quickfix = 1

   function! s:ts_quickfix()
     let winid = win_getid()
     execute ':TsuquyomiGeterr'
       call tslint#run('a', winid)
     endfunction

     autocmd BufWritePost *.ts,*.tsx silent! call s:ts_quickfix()
     autocmd InsertLeave *.ts,*.tsx silent! call s:ts_quickfix()
     augroup END

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ALE_LINTERS_END~~~~~~~~~~~~~~~~~~~~~~~~~"


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~Typescript~~~~~~~~~~~~~~~~~~~~~~~~~"
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
"let g:typescript_indent_disable = 1
" == AUTOCMD ================================
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx


" == AUTOCMD END ================================
"
"let g:typescript_compiler_binary = 'tsc'
"let g:typescript_compiler_options = ''
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~Typescript_END~~~~~~~~~~~~~~~~~~~~~~~~~"

color minimalist
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~SetRuntimePath~~~~~~~~~~~~~~~~~~~~~~~~~"
set runtimepath^=~/.vim/bundle/vim-javascript/,~/.vim/bundle/vim-json/,~/.vim/bundle/vim-jsx/,~/.vim/bundle/nerdtree/,~/.vim/bundle/AutoComplPop/,~/.vim/bundle/fzf/,~/.vim/bundle/ale/,~/.vim/bundle/vim-test/,~/.vim/bundle/typescript-vim/,~/.vim/bundle/vim-tsx,~/.vim/bundle/Vundle.vim,~/.vim/bundle/coc.nvim/,~/.vim/bundle/vim-tslint/,~/.vim/bundles/vim-prettier

" https://github.com/gigo6000/dotfiles
