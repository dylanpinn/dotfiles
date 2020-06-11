""" vimrc
"
" Author: Dylan Pinn
" Repo: https://github.com/dylanpinn/dotfiles

" This will be the configuration file for "most" of vim. This file (vimrc)
" should be the only file located in the home directory.
let $VIMFILES = expand('$HOME/.vim')

" Move the viminfo file out of the home directory.
set viminfofile=$VIMFILES/viminfo

" Increase size of history from 50 to 1000.
set history=1000

" Create automatic backups for all files.
" Store these in the ~/.vim/backups directory. Double slashes are added to the
" end of the path to ensure that the file names are constructed using the full
" path. This ensures that file collisions are minimised.
set backup
set backupdir=$VIMFILES/backups//

" Keep swapfiles out of the current directory. Double slashes are added to the
" end of the path to reduce naming collisions.
set directory=$VIMFILES/swaps//

" Keep track of undo history for files. Check if the current vim version has
" this enabled and then save these using the full file path to avoid collisions.
if has('persistent_undo')
  set undofile
  set undodir=$VIMFILES/undo//
endif

" Enable 24-bit colours in terminal vim (if it is supported by Vim and the
" terminal).
if (has('termguicolors') && !empty($COLORTERM))
  set termguicolors
endif

" Load colorscheme.
colorscheme jellybeans

" Vim by default does not allow a file buffer to have unsaved changes if it is
" not displayed in a window. Ideally, most buffers would be saved before moving
" away from them, however, this option now allows this.
set hidden

" Reload files if they have changed on the disk.
set autoread

" Use 2 spaces as indent. If tabs or changes are needed this should be done on a
" filetype by filetype basis in after/ftplugin/*.vim.
set tabstop=2       " Number of visual spaces per TAB.
set softtabstop=2   " Number of spaces in tab when editing.
set expandtab       " Tabs are spaces.
set shiftwidth=2    " Number of spaces when visual indenting.

" Plugins {{{
" Use vim Minpac (https://github.com/k-takata/minpac) to manage plugins. This
" uses the built in Vim 8 package feature.
"
" Main reason for using this is to load 3rd party plugins without having to deal
" with submodules or install scripts.
if exists('*minpac#init')
  call minpac#init()
  " Load minpac using minpac (Inception). This is loaded as optional plugin and
  " loaded only when required to update plugins.
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " A universal set of defaults that (hopefully) everyone can agree on. Might
  " look into replacing this in the future with the defaults directly. However,
  " I do like being able to add some settings that are almost considered best
  " practices.
  call minpac#add('tpope/vim-sensible')

  " Color (colour) scheme; tried many but always come back to this one. Will
  " probably last me until I go down the rabbithole of creating my own.
  call minpac#add('nanotech/jellybeans.vim')

  " I use Wakatime to roughly track how much actual "development" I am doing and
  " what I am doing. This isn't always accurate as can be doing pair programming
  " on a remote computer.
  call minpac#add('wakatime/vim-wakatime')

  " Improve JavaScript syntax highlighting, enhances highlighting for >= ES5.
  call minpac#add('yuezk/vim-js')

  " Improve JSX syntax highlighting, Vim's default highlighting can leave a bit
  " to be desired.
  call minpac#add('MaxMEllon/vim-jsx-pretty')

  " Add optional LSP support to Vim. Looking at using this with metals for Scala
  " development.
  call minpac#add('neoclide/coc.nvim', { 'type': 'opt', 'branch': 'release' })
endif

" Manage Minpac commands by loading the plugin then executing the commands.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()
" }}}

" UI Layout {{{
set number          " Show line numbers.
set splitbelow      " New horizontal splits below, not above
set splitright      " New vertical splits on the right, not left
set cursorline      " Highlight current line.

" Set and show title; which contains the buffer's name, indicators for modified
" and read-only, value of the global variable cur_project (if set), path of the
" current buffer relative from current directory, the current working directory
" itself, and finally, the server name.
set title
let &titlestring = '%t%( %m%r%)%( <%{get(g:, "cur_project", "")}>%)' .
      \ '%( (%{expand("%:~:.:h")})%)' .
      \ '%( (%{getcwd()})%)%( %a%) - %(%{v:servername}%)'
" }}}

" Searching {{{
set ignorecase " Ignore case when searching.
set smartcase  " Ignore case unless CAPS.
set hlsearch   " Highlight matches.

" Ignore tag files
set wildignore+=tags,tags.*
" Allow expanding wildmenu.
" Remove unused directory from path.
set path-=/usr/include

" Use ripgrep as default grep program, this is faster than "grep" and also
" performs recursive search and respects ignore files by default.
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
" }}}

" Status Line {{{
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    +-- current column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer
" }}}

" Keybindings {{{
" leader
let mapleader=','

" Fuzzy searching using wildmenu.
nnoremap <Leader>e :edit **/
nnoremap <Leader>f :find **/
nnoremap <Leader>s :sfind **/
nnoremap <Leader>v :vert sfind **/
nnoremap <Leader>t :tabfind **/

" Rename current file.
nnoremap <Leader>n :call RenameFile()<cr>
" }}}

"" SCRATCH AREA

" Edit vimrc in a new tab.
nnoremap cv :tabedit $MYVIMRC<CR>

" Async grepping without losing vim focus.
" function! Grep(...)
"   return system(join([&grepprg] + [a:1] + [expandcmd(join(a:000[1:-1], ' '))], ' '))
" endfunction
" command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
" command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)
" cnoreabbrev <expr> grep (getcmdtype() ==# ':' && getcmdline() ==# 'grep') ? 'Grep' : 'grep'
" cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'grep'

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  " TODO: Figure out what nested does.
  " autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost l*    lwindow
  " autocmd QuickFixCmdPost    l* nested lwindow
augroup END

" Source the vimrc file after saving it
" TODO: Wrap in augroup
" TODO: Move to ftplugin
if has('autocmd')
  augroup write_vimrc
    autocmd!
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd bufwritepost vimrc source $MYVIMRC
  augroup END
endif

" Edit my filetype/syntax plugin files for current filetype.
command -nargs=? -complete=filetype EditFileTypePlugin
            \ exe 'keepj vsplit $VIMFILES/after/ftplugin/' . (empty(<q-args>) ? &filetype : <q-args>) . '.vim'
command -nargs=? -complete=filetype Eft EditFileTypePlugin <args>

" Simple mappings for buffer switching.
nnoremap <Leader>d :b *
nnoremap <Leader>l :ls<CR>

nnoremap <Leader>m :make %<CR>
nnoremap <Leader>ml :compiler eslint <bar> make %<CR>
nnoremap <Leader>mt :compiler jest-cli <bar> make %<CR>

noremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Insert current path
cnoremap %% <C-R>=expand('%:h').'/'<CR>
" RUN make on write
" autocmd BufWritePost <pattern> silent make! <afile> | silent redraw!
" autocmd BufWritePost *.py,*.js silent make! <afile> | silent redraw!


set showmatch " Jump back to matching bracket briefly.

" Make space more useful
nnoremap <leader><space> za

" Move line down.
noremap <leader>- ddp
noremap <leader>= ddkP

" Uppercase word
imap <C-u> <ESC>viwUea

let maplocalleader = "\\"

" Save VIMRC
nnoremap <leader>vs :source $MYVIMRC<CR>

" Edit vimrc in a new tab.
nnoremap <leader>ve :tabedit $MYVIMRC<CR>

" Surround in quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <leader>" di"<esc>pa"<esc>
vnoremap <leader>( di(<esc>pa)<esc>

nnoremap H 0
nnoremap L $

inoremap jk <ESC>

" common spelling errors
iabbrev adn and

" CoC Settings

" These default mappings should either go in your .vimrc or in a file that
" you're going to source from your .vimrc. For example, you can copy this file
" into your ~ directory and then put the following in your .vimrc to source it
"
" coc.nvim lsp mappings
"if filereadable(expand("~/coc-mappings.vim"))
"  source ~/coc-mappings.vim"
"endif
"
"
" If you're curious how to share this or your .vimrc with both vim and nvim,
" you can find a great instructions about this here
" https://neovim.io/doc/user/nvim.html#nvim-from-vim
"
" Finally, keep in mind that these are "suggested" settings. Play around with
" them and change them to your liking.

if exists(':CocInfo')
  " If hidden is not set, TextEdit might fail.
  set hidden

  " Some servers have issues with backup files
  set nobackup
  set nowritebackup

  " You will have a bad experience with diagnostic messages with the default of 4000.
  set updatetime=300

  " Don't give |ins-completion-menu| messages.
  set shortmess+=c

  " Always show signcolumns
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by another plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  " Used in the tab autocompletion for coc
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Used to expand decorations in worksheets
  nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

  " Use K to either doHover or show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  " autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType scala setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Trigger for code actions
  " Make sure `"codeLens.enable": true` is set in your coc config
  nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>

  " Show all diagnostics
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

  " Notify coc.nvim that <enter> has been pressed.
  " Currently used for the formatOnType feature.
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Toggle panel with Tree Views
  nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
  " Toggle Tree View 'metalsPackages'
  nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
  " Toggle Tree View 'metalsCompile'
  nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
  " Toggle Tree View 'metalsBuild'
  nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
  " Reveal current current class (trait or object) in Tree View 'metalsPackages'
  nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>

  " Statusline
  set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
endif


" # vim: set syntax=vim:
