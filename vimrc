" Authors: Steven IO
" Description: This is a vimrc that I took from the vim wiki and modified.
"
"------------------------------------------------------------

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

execute pathogen#infect()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

"------------------------------------------------------------
" Must have options
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
set nomodeline

"------------------------------------------------------------
" Usability options
"
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
" set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" 'press <Enter> to continue'
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

set lazyredraw

"------------------------------------------------------------
" Mappings

" Map Y to yank until EOL, rather than act as yy,
map Y y$

nnoremap <C-L> :nohl<CR><C-L>

" Map space to leader. Very useful since default space is near useless.
map <space> <leader>

nnoremap <leader>w :w<cr>

nnoremap <leader>r <c-w><c-w>

nnoremap <leader>l :bnext<cr>

nnoremap <leader>h :bprev<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>

nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>v :vsplit<cr>

"---Syntastic mappings---

if exists(':SyntasticToggleMode<CR>')
    map <leader>s :SyntasticToggleMode<CR>
endif

"===Neovim mappings===
if has('nvim')
    tnoremap <C-[> <C-\><C-n>

    nnoremap <leader>t :terminal<cr>
endif

"------------------------------------------------------------
" Misc. Configurations

set noswapfile

"Terminal recognizes colors correctly
set t_Co=256


"Turn tabs into four spaces.
set tabstop=4
set shiftwidth=4
set expandtab

"colorscheme desert
"set background=dark
"let base16colorspace=256 
"colorscheme base16-bespin

" Wild cards ignore those patterns. Good for file searching.
"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"---------------------------------------------------------
" Longer and More complex configurations (functions, etc.)

" In addition to searching for the word under the cursor, * in normal mode will search for the current visual selection
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

" Recognize .md files as markdown.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"--------------------------
" Vim Plugin Configurations
"
" Notes: plugin specific mappings are in the mapping section.

"===vim-airline===
"
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"let g:airline_powerline_fonts = 1
"let g:airline_symbols.space = \"\ua0\"
"let g:airline_left_sep = '▶▶'
"let g:airline_left_sep = '≻≻≻'
"let g:airline_left_sep = '⊣⊢⊣⊢'
"let g:airline_left_sep = ' ❩❩❩ '

"let g:airline_left_sep = ' ❱❱❱ '
"let g:airline_right_sep = ' ❰❰❰ '
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"---Syntastic---

if exists(':SyntasticToggleMode<CR>')
    let g:airline#exstensions#syntastic#enabled = 1

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1

    " Don't like having the error window open when it hits an error. I usually
    " already know what the error is. I can open it up if I don't.
    let g:syntastic_auto_loc_list = 0

    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
endif

"===CtrlP===

if exists(':CtrlP<CR>')
    let g:ctrlp_working_path_mode = 'ra'

    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

    " Ignores files in .gitignore.
    " let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
endif

"--------------------------
" Neovim configurations
" 
" Note: Neovim specific mappings are in the mapping section.

" Put this back in once there are actual configurations.
"if has('nvim')
"endif
