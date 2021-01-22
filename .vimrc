set nocompatible

" Map ;; to <Esc>, mapleader to ","
imap ;; <Esc>
map ;; <Esc>
let mapleader = " "

" Vundle
filetype off " disabled during vundle config

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Display
Plugin 'joshdick/onedark.vim'
Plugin 'rakr/vim-one'
Plugin 'vim-airline/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'slim-template/vim-slim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
" Plugin 'Quramy/tsuquyomi'
" Plugin 'leafgarland/typescript-vim'
" Plugin 'peitalin/vim-jsx-typescript'
" Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'mhartington/nvim-typescript'
Plugin 'posva/vim-vue'
Plugin 'TaDaa/vimade'

" Tools
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'tpope/vim-fugitive'
" Plugin 'cohama/lexima.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'chaoren/vim-wordmotion'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'ap/vim-css-color'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets' " snippets community

" Completion, transformation
" Plugin 'ycm-core/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'alvan/vim-closetag'

" Navigation
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'preservim/nerdtree'

" Linters
" Plugin 'eslint/eslint'
" Plugin 'bbatsov/rubocop'

" All of your Plugins must be added before the following line
call vundle#end()						" required
filetype plugin indent on		" required


" -- Affichage
set title		" Met à jour le titre de la fenêtre ou terminal
set number		" Affiche numéro des lignes
set relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set ruler		" Affiche la position actuelle du curseur
set wrap		" Affiche les lignes trop longues sur plusieurs lignes
set scrolloff=3		" Affichge un min de 3 lignes autour du curseur pour le scroll
set cursorline	" Backround on current line
set foldmethod=syntax
set foldlevelstart=99 " start file with all folds opened

" -- Recherche
set ignorecase
set smartcase		" Si une recherche contient une majuscule, re-active la sensibilité à la casse
set incsearch		" Surligne les résultats de recherche pendant la saisie
set hlsearch		" Surligne les résultats de recherche

" -- Beep
set visualbell		" Empêche Vim de beeper
set noerrorbells	" Empêche Vim de beeper

" Disable backup
set nobackup
set nowritebackup

" Active le comportement ’habituel’ de la touche retour en arriere
set backspace=indent,eol,start

" Cache les fichiers lors de l’ouverture d’autres fichiers
set hidden

" Tabs as spaces
set tabstop=2		 " Size of a hard tabstop (ts).
set shiftwidth=2	" Size of an indentation (sw).
set shiftround
set expandtab		 " Always uses spaces instead of tab characters (et).
set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
set autoindent		" Copy indent from current line when starting a new line.
set smarttab			" Inserts blanks on a <Tab> key (as per sw, ts and sts).

" overrides by filetype
autocmd Filetype vim setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby

" Active les comportements specifiques aux types de fichiers comme
" la syntaxe et l’indentation
filetype on
filetype plugin on
filetype indent on


" Theme in true colors, automatic light/dark
" must be set before syntax.
set termguicolors
syntax enable
let hr = (strftime('%H'))
if hr >= 8 && hr < 17
  let dayOrNight="day"
  " hi CursorLine guibg=#e3ddca
else
  let dayOrNight="night"
  " hi CursorLine guibg=#294551
endif

if dayOrNight == "day"
  let g:one_allow_italics = 1 " I love italic for comments
  colorscheme one
  set background=light
else
  colorscheme onedark
  set background=dark
endif


if !has("nvim")
	set guifont=Monaco:h12 " Neovim in terminal will ignore this option. Set terminal font instead"
  set antialias
endif

set encoding=utf-8 " the encoding displayed
set fileencoding=utf-8 " the encoding written to file


" hightlight whitespace chars
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list

" Desactiver les touches directionnelles
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Easy split navigation. Instead of ctrl-w+j, it's just crl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom,
" which feels more natural than Vim’s default:
" set splitbelow
set splitright

" shortcuts
nnoremap <Leader>q :w\|:b#\|bd#<CR>  " write and close buffer, switching to another buffer. Helpful in splitted config
nnoremap <Leader>d :b#\|bd#<CR>
" nnoremap <leader>b :b#<CR>
" Better, from Mastering Vim Quicky:
nnoremap <leader>b <C-^>
" inoremap <leader>b <esc><C-^>

" copy current file relative path to system clipboard
nnoremap <leader>fi :let @+ = expand("%")<CR>


" status bar
let g:airline_section_b = ''
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" Ack parameters
nnoremap <Leader>a :Ack!<Space>
" Re-execute last quickfix command, presumely Ack search. This updates search
" results.
function! UpdateAck()
  if &buftype ==# 'quickfix'
    execute "normal! :A\<Up>\<CR>"
  else
    normal! u
  endif
endfunction
" nnoremap <Leader>r :A<Up> <CR>
nnoremap u :call UpdateAck()<CR>

" Set Marker and search
nmap <leader>j mA:Ack<space>
" clean search result
nmap <silent> <leader>/ :nohlsearch<CR>
" Set Marker and search word under cursor
nmap <leader>ja mA:Ack "<C-r>=expand("<cword>")<cr>"
nmap <leader>jA mA:Ack "<C-r>=expand("<cWORD>")<cr>"
if executable('ag')
  " Note: ag does not read .ackrc but .ignore files instead
  let g:ackprg="ag --vimgrep --ignore '*.lock' --ignore ./log"
else
  let g:ackprg="ack -H --nocolor --nogroup --column"
endif

" Trim whitespaces (most of languages are already supported by coc fixers)
match ErrorMsg '\s\+$'
autocmd BufWritePre FileType eruby :%s/\s\+$//e

"" Begin CoC recommendations
let g:coc_global_extensions = ['coc-tsserver', 'coc-prettier', 'coc-eslint', 'coc-json', 'coc-html', 'coc-css', 'coc-yaml', 'coc-markdownlint', 'coc-solargraph']

"
" JS files have prettier on save. Only 1 fixer can be applied by CoC, eslint
" must be manually set https://github.com/neoclide/coc.nvim/issues/2269#issuecomment-747268888
autocmd BufWritePre *.js,*.ts,*.tsx,*.vue call CocAction('runCommand', 'eslint.executeAutofix')

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=4000

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"

imap <silent><expr> <tab>
      \ pumvisible() ? "\<C-n>" :
      \ (delimitMate#ShouldJump() ?
      \   "<Plug>delimitMateS-Tab" :
      \   <SID>check_back_space() ? "\<tab>" : coc#refresh())

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>rs <Plug>(coc-codeaction-selected)
nmap <leader>rs <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>rc  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" command! Esfix :call CocAction('runCommand', 'eslint.executeAutofix')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{get(b:,'coc_current_function','')}

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(300, 'ShowDocIfNoDiagnostic')
endfunction

" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()
"" End CoC recommendations

" Ctrlp
" let g:ctrlp_map = "<leader>p"
set wildignore+=*/log/*,*/cache/*,*/node_modules/*,*/code/*/bin/*,*/.bundle/*,*/.git/*,*/.tags*,.eslintcache,*/coverage/*,*/public/packs/*

" FZF
let $FZF_DEFAULT_COMMAND="ag -g '' --hidden --ignore '*.png' --ignore '*.jpg' --ignore '*.svg' --ignore '*.ttf' --ignore '*.woff' --ignore '*.eot' --ignore '*.gif' --ignore '*.ico' --ignore '*.lock' --ignore 'log/' --ignore 'tmp/' --ignore .git"
nnoremap <silent> <Leader>p :Files<CR>
nnoremap <silent> <Leader>. :Files <C-r>=expand("%:h")<CR>/<CR>

" Rails project
" if filereadable('config/routes.rb')
"   " This looks like a Rails app, add Rails specific mappings here.
"   nnoremap <silent> <Leader>pc :Files app/controllers<CR>
"   nnoremap <silent> <Leader>pm :Files app/models<CR>
"   nnoremap <silent> <Leader>pj :Files app/javascript<CR>
"   nnoremap <silent> <Leader>pt :Files test<CR>
" endif

" Word motions
" NOTE: Meta (Alt) mapping is done by enabling iTerm right meta key behaving
" as Esc+
let g:wordmotion_mappings = {
\ 'w' : '<M-w>',
\ 'b' : '<M-b>',
\ 'e' : '<M-e>',
\ 'ge' : '',
\ 'aw' : '',
\ 'iw' : '',
\ '<C-R><C-W>' : ''
\ }

" YouCompleteMe
" Remove S-Tab mapping which conflicts with delimitMate
" let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
" Hide the completion with Enter
inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>"
let g:ycm_complete_in_strings = 0
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_max_num_candidates = 5
let g:ycm_max_num_identifier_candidates = 5
let g:ycm_add_preview_to_completeopt = 1

" delimitMate (Auto close)
let delimitMate_expand_cr = 2
let delimitMate_balance_matchpairs = 1
" jump to the right of balance with a <Tab> instead of <S-Tab> unless there is
" YouCompleteMe completion selection
" imap <expr> <tab> pumvisible() ? "<C-N>" : (delimitMate#ShouldJump() ? "<Plug>delimitMateS-Tab" : "<Tab>")

" NERDTree
map <Leader>k :NERDTreeToggle<CR>
map <Leader>kf :NERDTreeFind<CR>
let NERDTreeRespectWildIgnore = 1
let NERDTreeShowHidden = 1
let NERDTreeSortHiddenFirst = 1
let NERDTreeIgnore=['\.vim$', '\~$', '^log$', '^node_modules$', '^.bundle$', '^.git$', '.DS_Store$', '^.imdone']


" Vue support
let g:vue_pre_processors = ['scss']
autocmd Filetype vue let html_no_rendering=1 " Fix style syntax highligh for Vue files https://github.com/posva/vim-vue/issues/135#issuecomment-526167470

" Fix Javascrip/Typescript syntax highlight performance
" From https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear



" Close tags
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
" let g:closetag_filenames = '*.html,*.xhtml,*.tsx,*.jsx,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
" let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
" let g:closetag_filetypes = 'html,xhtml,jsx,javascript,typescript,typescriptreact'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
" let g:closetag_xhtml_filetypes = 'xhtml,typescriptreact'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
" let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
" let g:closetag_regions = {
    " \ 'typescriptreact': 'jsxRegion,tsxRegion',
    " \ 'javascript.jsx': 'jsxRegion',
    " \ }

" Shortcut for closing tags, default is '>'
"
" let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
" let g:closetag_close_shortcut = '<leader>>'


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/custom-snippets']


" Vimade - Dim inactive buffers
let g:vimade = {}
let g:vimade.fadelevel = 0.6
let g:vimade.checkinterval = 500
