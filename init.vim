"                           _       _ __        _
"                          (_)___  (_) /__   __(_)___ ___
"                         / / __ \/ / __/ | / / / __ `__ \
"                        / / / / / / /__| |/ / / / / / / /
"                       /_/_/ /_/_/\__(_)___/_/_/ /_/ /_/

"{{{SOURCE FILES

source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/goyo.vim
source $HOME/.config/nvim/plug-config/limelight.vim
source $HOME/.config/nvim/plug-config/Bclose.vim

"}}}
"{{{PLUGINS

call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-vinegar'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
" Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vim-latex/vim-latex'
Plug 'honza/vim-snippets'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'liuchengxu/vim-which-key'
Plug 'lambdalisue/suda.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/limelight.vim'
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
Plug 'Asheq/close-buffers.vim'
Plug 'airblade/vim-rooter'

call plug#end()

"}}}
"{{{GENERAL SETTINGS

"{{{Folding

"The marker method uses {{{ and }}} to define a folding section
"You can also nest curly brackets to get different levels of folding
"'zo' to open a fold, 'zc' to close a fold or 'za' to toggle
"'zO', 'zC' and 'zA' do the same thing but operate on all folding levels
set foldmethod=marker

"}}}
"{{{Cut & Paste

set pastetoggle=<F2> "Better copy & paste
set clipboard=unnamedplus

"}}}
"{{{Commenting

"Turns off automatically inserting a comment on a new line
set formatoptions-=cro

"}}}
"{{{Title Bar

"file name and path in title bar
set title

"}}}
"{{{Terminal

"To map <Esc> to exit terminal-mode:
" tnoremap <Esc> <C-\><C-n>
"Use this if running FZF so you can exit normally from searches
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

"}}}
"{{{Windows

"Some standard commands include:
"<C-w>o to close all windows but the current one
"<C-w>c to close the current window
"<C-w>= to make all windows the same size

"Use arrow keys for resizing windows
noremap <Up> :resize +2 <CR>
noremap <Down> :resize -2 <CR>
noremap <Left> :vertical resize -2 <CR>
noremap <Right> :vertical resize +2 <CR>

"Use ctrl-arrow keys to move between windows
noremap <C-Up> <C-w>k
noremap <C-Down> <C-w>j
noremap <C-Left> <C-w>h
noremap <C-Right> <C-w>l

"More natural behaviour when splitting windows
set splitbelow
set splitright

"Close (final) buffer but keep window open
nmap <leader>bd <Plug>Kwbd

"}}}
"{{{Line Numbers

set number

"Relative line number toggle
noremap <silent> <leader>r :set number! relativenumber!<CR>

"Line number toggle
noremap <silent> <leader>n :set number!<CR>

"Sets hybrid numbers in normal mode and absolute numbers in insert mode
" set number relativenumber
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

"}}}
"{{{Syntax Highlighting

"Allows syntax highlighting toggle on/off
:map <leader>sh :if exists("g:syntax_on") <Bar>
        \   syntax off <Bar>
        \ else <Bar>
        \   syntax enable <Bar>
        \ endif <CR>

"}}}
"{{{Files

"Use CTRL-x for saving, also in Insert mode.
noremap <C-x> :update<CR>
vnoremap <C-x> <C-C>:update<CR>
inoremap <C-x> <Esc>:update<CR>
"use this instead if you want to stay in insert mode after saving
"inoremap <C-x> <C-O>:update<CR>

"This is to automatically set the current Vim directory to the directory of
"your currently opened file.
set autochdir

"Write file if you forget to give it sudo permission
" map <leader>sudo : w !sudo tee % <CR><CR>
"The above command doesn't work in neovim. This solution requires suda.vim plugin
map <leader>sudo :w suda://%<CR>

"Enable if you want trailing whitespace stripped automatically when saving
"particular files (e.g. .py and .js). Requires Vim to be compiled with
"autocommand
if has("autocmd")
autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()
endif

"Press <leader>sw to strip trailing whitespace from a file.
nnoremap <silent> <leader>sw :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

"Makes Vim assign .md files as .markdown files rather than Modula-2
au BufRead,BufNewFile *.md set filetype=markdown

"Open html file in a browser.
nnoremap <leader>f :exe ':silent !firefox %'<CR>
nnoremap <leader>c :exe ':silent !chromium-browser %'<CR>

"Open pdf file in mupdf
nnoremap <leader>pdf :exe ':silent !mupdf %'<CR>

"}}}
"{{{Vimrc (init.vim) Settings

" Automatically source vimrc on save.
if has("autocmd")
 autocmd! bufwritepost $MYVIMRC source $MYVIMRC
endif

"Shortcut for opening/editing .vimrc
nmap <leader>v :e $MYVIMRC<CR>

"}}}
"{{{Temporary Files

"If you don't want sometimes annoying temporary files
" set nobackup
" set nowritebackup
" set noswapfile

"}}}
"{{{Printer Settings

"Sets the printer
"set pdev=HP_LaserJet_400_colorMFP_M475dn
"set pdev=Hewlett-Packard-HP-LaserJet-400-colorMFP-M475dn
set pdev=Hewlett-Packard_HP_LaserJet_400_colorMFP_M475dn

"}}}
"{{{Invisibles

"Toggles invisibles - tabs, EOL
nmap <leader>i :set list!<CR>
"Changes default tab and end-of-line markers when using :set list
set listchars=tab:▸\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"}}}
"{{{Spell Checking

"Toggles spell checking on/off by pressing leader sp
"Note if you want to check spelling on code (including markdown files) you need
"to disable syntax highlighting, :syntax off
map <leader>sp :setlocal spell! spelllang=en_au<CR>
"Changes all the  highlighting defaults of misspelled words
hi clear SpellBad
hi SpellBad cterm=underline
hi clear SpellRare
hi SpellRare cterm=none ctermbg=54 ctermfg=white
hi clear SpellCap
hi SpellCap cterm=none ctermbg=52 ctermfg=white
hi clear SpellLocal
hi SpellLocal cterm=none ctermbg=yellow ctermfg=black

"}}}
"{{{Cursor Position

"Sets scrolloff position of cursor which allows you to always see at least a
"certain number of lines above and below
" set so=7
"If you want the cursor always in the middle of the page
set so=999

"}}}
"{{{Search Features

"Bind nohl
"Removes highlight of your last search
" noremap <C-n> :nohl<CR>
" vnoremap <C-n> :nohl<CR>
" inoremap <C-n> :nohl<CR>

"Removes search highlighting
set nohlsearch

"Make search case insensitive
set ignorecase

"}}}
"{{{Buffers

"Allows you to modify buffer. I included so I could change the size of the
"current pane using ctrl-w + or -
set modifiable

set hidden

"To navigate through buffers in normal mode
nnoremap <leader>] :bnext<CR>
nnoremap <leader>[ :bprevious<CR>

"Also see the Close-Buffers Plugin. Currently have <leader>ob set to close all
"other buffers other than the current one

"The function below allows you to bring the output of a shell command into a
"new Vim buffer. One use I have for this is for when I run programs from Vim
"and want the output in a new buffer so I can search, edit, save, etc.
"e.g. `:Shell python! %`
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
" Original line below (commented out)
" setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  setlocal bufhidden=hide noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

"}}}
"{{{Line Formatting

set cursorline

"This code can be used to highlight text after a certain length, e.g. 80
"characters
"highlight OverLength ctermbg=darkgrey ctermfg= white guibg=#592929
"match OverLength /\%80v.*/

"This sets the textwidth where the line will break. Set to 0 for unlimited or
"79 for standard documents/ ease of reading.
set tw=0

"Sets colorcolumn (cc). Can also set relative to textwidth (tw), e.g. cc=+1
set cc=80

"Sets color of the colorcolumn. `h: ctermbg` will display available color
"choices
hi ColorColumn ctermbg=darkblue guibg=darkblue

"Setting linebreak means words won't be broken when line wraps or breaks to
"the next line.
set linebreak

"Automatically reformats text length when appending or deleting from existing
"lines. Can also reformat manually with the gq command.
"set formatoptions+=a

"}}}
"{{{Vim Colorscheme

autocmd vimenter * colorscheme gruvbox
set background=dark    " Setting dark mode
" set background=light   " Setting light mode

"}}}
"{{{Tabs

"Sets the length of a tab (default is 8).
set tabstop=2

"Sets the length of the softtabstop which takes precendence over tabstop. Helps
"when expandtab is set and spaces are inserted in place of tabs. When using the
"backspace, it will move back the number of set spaces rather than just a
"single space.
set softtabstop=2

"Controls the number of columns for the indent operations >> and <<
set shiftwidth=2

"Set expand tab if you prefer to work with spaces. Have it off if you prefer to
"work with tabs.
set expandtab

"Set tabstop, softtabstop and shiftwidth to the same value. You can invoke with
":Stab. Note that it will also tell you if expandtab is enabled (should be if
"you prefer working with spaces) or not (should be if you prefer working with
"tabs).
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

"}}}
"{{{Latex

"Turn off folding in LaTeX files.
let g:Tex_AutoFolding = 0

"Simple LaTeX compiling and displaying
"Compiles LaTeX file
map <leader>cx :! xelatex %<CR><CR>
"Opens pdf file in mupdf
map <leader>dp :! mupdf $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
"Note: once the pdf is open you can leave it open and just press `r`
"(a mupdf command) to reload after you make changes and you've recompiled.

"}}}
"{{{{Run Python

"To execute python program and see the output.
nnoremap <F5> :exe ':!python %'<CR>

"Same as above but puts output in a scratch buffer where you can do more with it.
"This relies on a custom function included in the 'Buffers' section.
nnoremap <F6> :exe ':Shell python %'<CR>

"}}}
"}}}
"{{{PLUGIN SETTINGS
"{{{COC

let g:coc_node_path = '/home/richard/.nvm/versions/node/v12.11.1/bin/node'
set statusline^=%{coc#status()}
let g:gruvbox_guisp_fallback = 'bg'

"}}}
"{{{AIRLINE PLUGIN

"Sets theme
let g:airline_theme='dark'

"Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

"Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"automatically populates the g:airline_symbols dictionary with the powerline
"symbols.
let g:airline_powerline_fonts = 1

"}}}
"{{{VIM-MARKDOWN PLUGIN

"Sets conceal level on markdown files. 0 means no characters are concealled.
autocmd Filetype markdown set conceallevel=0

"The folding state a markdown file opens in.
"Folding commands include:
" zr: reduces fold level throughout the buffer
" zR: opens all folds
" zm: increases fold level throughout the buffer
" zM: folds everything all the way
" za: open a fold your cursor is on
" zA: open a fold your cursor is on recursively
" zc: close a fold your cursor is on
" zC: close a fold your cursor is on recursively
autocmd Filetype markdown normal zR

"}}}
"{{{MARKDOWN-PREVIEW PLUGIN

"Allows you to style your markdown output, e.g. like the GitHub site.
let g:mkdp_markdown_css = '/home/richard/.config/nvim/github-markdown.css'

"Puts less cpu load by refreshing a bit slower than normal.
let g:mkdp_refresh_slow=1

"Can map the following or just type in a command when needed
" <Plug>MarkdownPreview
" <Plug>MarkdownPreviewStop
" <Plug>MarkdownPreviewToggle

nmap <leader>m <Plug>MarkdownPreview

"}}}
"{{{VIMWIKI PLUGIN

"Settings required for Vimwiki (some already defaults in neovim)
" set nocompatible
" filetype plugin on
" syntax on
" let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/Documents/Documentation/vimwiki/','syntax': 'markdown', 'ext': '.md'}]

nmap <leader>w <Plug>VimwikiIndex 

" Example below if wanting to run multiple wikis
" let g:vimwiki_list = [
"                         \{'path': '~/Documents/VimWiki/personal.wiki'},
"                         \{'path': '~/Documents/VimWiki/tech.wiki'}
"                 \]

" au BufRead,BufNewFile *.wiki set filetype=vimwiki
" :autocmd FileType vimwiki map d :VimwikiMakeDiaryNote

" Have disabled for the moment as pressing 'c' for change calls the calendar
" function! ToggleCalendar()
"   execute ":Calendar"
"   if exists("g:calendar_open")
"     if g:calendar_open == 1
"       execute "q"
"       unlet g:calendar_open
"     else
"       g:calendar_open = 1
"     end
"   else
"     let g:calendar_open = 1
"   end
" endfunction
" :autocmd FileType vimwiki map cal :call ToggleCalendar()

"}}}
"{{{VIM-LATEXSUITE PLUGIN

filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'
let g:Tex_TEXINPUTS = '~/texmf/mypackages/**,./**'

"}}}
"{{{VIM-VINEGAR

" Press "I" to toggle on/off the Netrw help/guide
"Initiate with dot files hidden. 'gh' to toggle on/off
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" let g:netrw_liststyle = 1

"Pressing '-' doesn't work to access Netrw when markdown files are open.
"This can be used as a workaround
nmap <leader>x :Explore<CR>

"}}}
"{{{FZF PLUGIN

"FZF custom call ':Vimwiki' to search the vimwiki folder only
"FZF also seems to allow you to call primary directories like ':Documents', ':Projects', etc
command! -bang Vimwiki call fzf#vim#files('~/Documents/Documentation/vimwiki', <bang>0)

"}}}
"{{{GOYO PLUGIN

map <silent> <Leader>g :Goyo<CR>

"}}}
"{{{WHICH KEY

" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['ob']   = [ ':Bdelete other'                                                           , 'Delete all buffers except current' ]
let g:which_key_map['c']    = [ ':silent !chromium-browser %'                                              , 'Open in chromium' ]
let g:which_key_map['f']    = [ ':silent !firefox %'                                                       , 'Open in firefox' ]
let g:which_key_map['g']    = [ 'Goyo'                                                                     , 'Goyo' ]
let g:which_key_map['i']    = [ ':set list!'                                                               , 'Invisibles']
let g:which_key_map['l']    = [ ':Limelight!!'                                                             , 'Limelight']
let g:which_key_map['m']    = [ ':MarkdownPreview'                                                         , 'Markdown Preview']
let g:which_key_map['n']    = [ ':set number!'                                                             , 'Line numbers' ]
let g:which_key_map['pdf']  = [ ':silent !mupdf %'                                                         , 'view pdf file' ]
let g:which_key_map['r']    = [ ':set number! relativenumber!'                                             , 'Relative line numbers' ]
let g:which_key_map['s']    = [ ':Startify'                                                                , 'Startify' ]
let g:which_key_map['sh']   = [ ':if exists("g:syntax_on") | syntax off | else | syntax enable | endif'    , 'Syntax' ]
let g:which_key_map['sp']   = [ ':setlocal spell! spelllang=en_au'                                         , 'Spell check' ]
let g:which_key_map['sudo'] = [ ':w suda://%'                                                              , 'Sudo save' ]
let g:which_key_map['sw']   = [ ':let _s=@/|:%s/\s\+$//e|:let @/=_s|'                                      , 'Strip white space' ]
let g:which_key_map['v']    = [ ':e $MYVIMRC'                                                              , 'Open .vimrc (init.vim)' ]
let g:which_key_map['w']    = [ ':VimwikiIndex'                                                            , 'Vimwiki Index' ]
let g:which_key_map['x']    = [ ':Explore'                                                                 , 'Explore (Netrw)' ]
let g:which_key_map[']']    = [ ':bnext'                                                                   , 'Next buffer' ]
let g:which_key_map['[']    = [ ':bprevious'                                                               , 'Previous buffer' ]

" s is for search
let g:which_key_map.se = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")

"}}}
"{{{STARTIFY

    let g:startify_custom_header = [
          \ '                _   __         _    ___              ', 
          \ '               / | / /__  ____| |  / (_)___ ___      ', 
          \ '              /  |/ / _ \/ __ \ | / / / __ `__ \     ',
          \ '             / /|  /  __/ /_/ / |/ / / / / / / /     ',
          \ '            /_/ |_/\___/\____/|___/_/_/ /_/ /_/      ',
          \ ]

nmap <leader>s :Startify<CR>

"}}}
"{{{LIMELIGHT

" map <leader>l :Limelight!! [0.0 ~ 1.0]<CR>
map <leader>l :Limelight!!<CR>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" nmap <Leader>l <Plug>(Limelight)
" xmap <Leader>l <Plug>(Limelight)

"}}}
"{{{SNEAK

let g:sneak#label = 1

" case insensitive sneak
let g:sneak#use_ic_scs = 1

" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1

" remap so I can use , and ; with f and t
map gS <Plug>Sneak_,
map gs <Plug>Sneak_;

" Change the colors
highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

" Cool prompts
" let g:sneak#prompt = '🕵'
" let g:sneak#prompt = '🔎'

" I like quickscope better for this since it keeps me in the scope of a single line
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T

"}}}
"{{{QUICKSCOPE

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

let g:qs_max_chars=150

"}}}
"{{{CLOSE BUFFERS
" :Command								Description																																								            Native version
" :Bdelete other 					bdelete all buffers except the buffer in the current window	
" :Bdelete hidden 				bdelete buffers not visible in a window	
" :Bdelete all						bdelete all buffers	                                                                                  :bufdo bdelete
" :Bdelete this						bdelete buffer in the current window	                                                                :bdelete
" :Bdelete nameless				bdelete buffers without a name: [No Name]	
" :Bdelete select					Lets you interactively select which buffers to bdelete	
" :Bdelete menu						Lets you interactively choose one of the other commands above	Command	Description	Native version

nmap <leader>ob :Bdelete other<CR>

"}}}
"}}}
