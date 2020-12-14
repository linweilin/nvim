" platform macos
call plug#begin('~/.config/nvim/plugged')
    
    " coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " helper
    Plug 'scrooloose/nerdcommenter'

    " vision
    Plug 'vim-airline/vim-airline'
    Plug 'yggdroot/indentline'
    Plug 'jackguo380/vim-lsp-cxx-highlight'

    " theme
    Plug 'morhetz/gruvbox'

    " Others
    "Plug 'iandingx/leetcode.vim'

call plug#end()


" coc {
    autocmd FileType json syntax match Comment +\/\/.\+$+
    function! SetupCommandAbbrs(from, to)
        exec 'cnoreabbrev <expr> '.a:from
                    \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
                    \ .'? ("'.a:to.'") : ("'.a:from.'"))'
    endfunction

    " Use C to open coc config
    call SetupCommandAbbrs('C', 'bel vnew <cr>:CocConfig')

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Or use `complete_info` if your vim support it, like:
    " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
     
    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)
    " Remap keys for applying codeAction to the current line.
    nmap <leader>ac <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf <Plug>(coc-fix-current)

    " Using CocList
    " Code actions of selected range
    nnoremap <silent> <Leader>a  :<C-u>CocList actions<cr>
    " Show all diagnostics
    nnoremap <silent> <Leader>d  :<C-u>CocList diagnostics<cr>
    " Show commands
    nnoremap <silent> <Leader>c  :<C-u>CocList commands<cr>
    " match lines of current buffer"
    nnoremap <silent> <Leader>l  :<C-u>CocList lines<cr>
    " global search
    nnoremap <silent> <Leader>g  :<C-u>CocList grep<cr>
    " Find symbol of current document
    nnoremap <silent> <Leader>o  :<C-u>CocList outline<cr>
    " Show files 
    nnoremap <silent> <Leader>f  :<C-u>CocList files<cr>
    " Show Buffers
    nnoremap <silent> <Leader>b  :<C-u>CocList buffers<cr>
    " Most  recent used
    nnoremap <silent> <Leader>m  :<C-u>CocList mru<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    nnoremap <silent> <Leader>h <S-*>N
    nnoremap <silent> <Esc> :noh<Esc>
     "nnoremap <Leader>h :call CocActionAsync('highlight')
"}

" { build c/c++
    function! Run_cmake()
        :!rm -rf build
        :!cmake -H. -Bbuild -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
    endfunction

    function! Run_build()
        :wa
        :!cmake --build build -- -j4
    endfunction
    :command Build call Run_build()
    :command Cmake call Run_cmake()
    :command GDB :tabnew term://gdb
" }

" deol {
     tnoremap <ESC> <C-\><C-N>
     nmap <Leader>t :tabnew term://$SHELL<CR>i
    nmap <S-t> :bel vnew<CR>:vertical resize 60<CR>:term<CR>i
" }

" { leetcode
    " let g:leetcode_browser = 'firefox'
    
    " nnoremap <leader>ll :LeetCodeList<cr>
    " nnoremap <leader>lt :LeetCodeTest<cr>
    " nnoremap <leader>ls :LeetCodeSubmit<cr>
    " nnoremap <leader>li :LeetCodeSignIn<cr>
" }

" python3 {
    let g:python3_host_prog = "/usr/bin/python3.6"
"}

" {
    colorscheme gruvbox
    set background=dark
" }

" nerdcommenter {
    " add a space after between comment and code
    let g:NERDSpaceDelims=1 
" }

" vim settings
set nu
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cursorline
set ignorecase  " 设置默认进行大小写不敏感查找
set smartcase   " 如果有一个大写字母，则切换到大小写敏感查找

"window navigation {
    nmap gh <C-W>h
    nmap gj <C-W>j
    nmap gk <C-W>k
    nmap gl <C-W>l
"}

" git diff {
    nmap <silent> <leader>1 :diffget 1<cr> :diffupdata<cr>
    nmap <silent> <leader>2 :diffget 2<cr> :diffupdata<cr>
    nmap <silent> <leader>3 :diffget 3<cr> :diffupdata<cr>
" }
