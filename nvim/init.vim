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

" ============================================================

" let g:neovide_refresh_rate=90
let g:neovide_transparency=0.9

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

" Initialize plugin system
call plug#end()

" ============================================================

nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>

" ============================================================

" Enable Monokai Pro From https://github.com/phanviet/cim-monokai-pro
" Copy monokai_pro.vim into %AppData%/Local/nvim/colors
set termguicolors
colorscheme monokai_pro
let g:lightline = {
	\ 'colorscheme':'monokai_pro',
	\ }

