"set tags=./.tags;,.tags

set autoindent
filetype plugin indent on
syntax on

set nocompatible
set shortmess=IO
"no readonly in vimdiff
set noro

set number
set hlsearch
set incsearch
set ignorecase
set backspace=indent,eol,start"
set mouse=inv
set hidden
set listchars=tab:→\ ,trail:·,eol:§

" vim.wikia.com/wiki/All_folds_open_when_opening_a_file
"autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
"autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

set showmatch
set cursorline
autocmd InsertLeave * set cul
autocmd InsertEnter * set nocul
set ruler
set showcmd
set scrolloff=3
set laststatus=2
"set cmdheight=2
set confirm
set wildmenu
set report=0
hi VertSplit cterm=none

" 使用 4 个空格
set expandtab
set tabstop=4
set shiftwidth=4
" 使用 4 列tab
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set noexpandtab
" 使用 8 列tab
"set tabstop=8
"set softtabstop=8
"set shiftwidth=8
"set noexpandtab

" https://vim.fandom.com/wiki/Open_the_last_edited_file
" Go to last file(s) if invoked without arguments.
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"

"# keymap
let mapleader=" "
set pastetoggle=<F2>
nnoremap <F3> :set list!<CR>
nnoremap <F4> :set hlsearch! hlsearch?<CR>
noremap <F5> :Leaderf gtags --update<CR>
"noremap <F6> :redir! > vim_keys.txt<CR> \| :silent verbose map<CR> \| :redir END<CR>

let s:mappingsState=1
inoremap { {<cr>}<Up><End><cr>
inoremap <F4> <C-o>:call ToggleMappings() <cr>
"vi.stackexchange.com/questions/15578/how-can-i-toggle-multiple-mappings-on-off-with-a-command
function! ToggleMappings()
    if s:mappingsState
        inoremap { {}<Left>
    else
        inoremap { {<cr>}<Up><End><cr>
    endif
    let s:mappingsState = !s:mappingsState
endfunction

noremap <leader>a :e #<CR>
noremap <leader>q :q<cr>
noremap <leader>m :only<cr>
noremap <leader>v :bo vert sp<cr>
noremap <leader>w :bd<cr>
noremap <leader>e :BufOnly<cr><cr>
noremap <c-j> 5<c-d>
noremap <c-k> 5<c-u>
noremap <leader><leader> <c-w>w
" https://vim.fandom.com/wiki/Avoid_the_escape_key
inoremap <Tab> <Esc>`^
inoremap (  ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap [ []<Left>


"# LeaderF
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Gtags':0, 'BufTag':0, 'Function':1}
let g:Lf_Gtagsconf = '/home/zack/.vim/gtags.conf'
"let g:Lf_StlColorscheme = 'powerline'
noremap <leader>g :LeaderfMru<CR>
noremap <leader>t :Leaderf gtags --result=ctags-mod<CR>
noremap <leader>j :Leaderf function<CR>

noremap <leader>r :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>d :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>s :Leaderf! gtags -g 
noremap <leader>o :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>n :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>p :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

"#tagbar
let g:tagbar_compact = 1
let g:tagbar_zoomwidth = 0
set updatetime=500
nnoremap <silent> <leader>l :TagbarOpen c<CR>

"#airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = ''
"let g:airline_solarized_bg='dark'
"let g:airline_theme='solarized'
let g:airline#themes#base16#constant = 1
let g:airline_theme='base16'
let g:airline_extensions = ['tagbar', 'tabline']

"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

