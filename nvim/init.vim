" Display the current cursor position in the lower right of the vim window
set ruler

" Display matches for search pattern while you type
"set incsearch

" This switches on syntax hilighting. And the hlsearch option tells vim to
" highlight matches with the last used search pattern. More info in usr_41.txt
syntax on
syntax enable
set hlsearch

" Show line numbers
set number

" Set indentation to 4 spaces
set shiftwidth=4

" trigger `autoread` when files changes on disk
set autoread

" ============================================================

" let g:neovide_refresh_rate=90
let g:neovide_transparency=0.85

" Setting g:neovide_no_idle to a boolean value will force neovide to redraw all the time. This can be a quick hack if animations appear to stop too early.
let g:neovide_no_idle=v:true

let g:neovide_remember_window_size = v:true

" Enables or disables antialiasing of the cursor quad. Disabling may fix some cursor visual issues.
let g:neovide_cursor_antialiasing=v:true

" ============================================================

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Plugins Here...

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Fuzzy File Finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Code completion
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

" ============================================================
" Coc Settings
" https://github.com/neoclide/coc.nvim

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

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
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Automatically detect and install extensions
let g:coc_global_extensions = ['coc-json', 'coc-highlight', 'coc-go', 'coc-clangd']

" ============================================================

nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>

" ============================================================

" Font settings
set guifont=Cascadia\ Code\ PL:h14

" Scroll bar
set guioptions=r

" Enable Monokai Pro From https://github.com/phanviet/cim-monokai-pro
" Copy monokai_pro.vim into %AppData%/Local/nvim/colors
set termguicolors
colorscheme monokai_pro
let g:lightline = {
	\ 'colorscheme':'monokai_pro',
	\ }

