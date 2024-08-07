if has('nvim')
    runtime! plugin/python_setup.vim
endif

" Change settings
set nu rnu
set mouse=a
set encoding=UTF-8
syntax enable
set noswapfile
set splitright
set splitbelow
set smartindent
set colorcolumn=80
set tabstop=4
set softtabstop=4
set shiftwidth=4 
set expandtab 
set shiftround
set smarttab
set ignorecase smartcase
set hls
set backupcopy=yes
set so=5

" Don't show mode 
set noshowmode
set noshowcmd

" COC Vim Settings
" set cmdheight=2
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" CocCommand
noremap <Leader>cc <Esc>:CocCommand<CR>

" CocAction
noremap <Leader>ca <Esc>:CocAction<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" coc-snippets
let g:coc_snippet_next = '<TAB>'

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
noremap <Leader>cd <Esc>:CocDiagnostics<CR>

" Documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Comment this out if you're not in a virtual environment like conda or
" miniconda
" let g:python3_host_prog = expand('~/anaconda3/bin/python3')

" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" Close preview window after completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" COC Extensions
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-prettier',
    \ 'coc-html',
    \ 'coc-css',
    \ ]

" JSON stuff
set conceallevel=1

" Plugins ( Add plugins here )
call plug#begin('~/.vim/plugged')

Plug 'elzr/vim-json'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'honza/vim-snippets'
Plug 'jwalton512/vim-blade'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/npm.nvim', {'do' : 'npm install'}
Plug 'godlygeek/tabular'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mg979/vim-visual-multi'
Plug 'vim-test/vim-test'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'fladson/vim-kitty'
Plug 'posva/vim-vue'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'folke/todo-comments.nvim', { 'branch': 'main' }
Plug 'projekt0n/github-nvim-theme', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lambdalisue/suda.vim'

call plug#end()

let g:vim_json_syntax_conceal = 0

" Enable true color
set termguicolors

" Set colorscheme
" colorscheme github_dark

" Vim-vue fix for some error which can happen which I forgot
" autocmd FileType vue syntax sync fromstart

" Save file
nnoremap <Leader>w <Esc>:w<CR>

" Quit file
nnoremap <Leader>q <Esc>:q<CR>

" Move line up or down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Remove search highlight
nnoremap <C-c> :noh<CR>

" Map C-c to ESC
inoremap <C-c> <Esc>

" Move back and forth buffers
nnoremap <A-h> :bp<return>
nnoremap <A-l> :bn<return>

" Disable Ex mode
map Q <Nop>

" Disable indentline in markdown
autocmd FileType markdown let g:indentLine_enabled=0

" Telescope
nnoremap <C-p> <cmd>Telescope find_files theme=get_dropdown previewer=false winblend=10 layout_config.width=100<cr>
nnoremap <leader>rg <cmd>Telescope live_grep<cr>
nnoremap <A-k> :lua require('telescope.builtin').buffers({show_all_buffers = true})<cr>

fun! VM_Start()
  nmap <buffer> <C-C> <Esc>
  imap <buffer> <C-C> <Esc>
endfun

fun! VM_Exit()
  nunmap <buffer> <C-C>
  iunmap <buffer> <C-C>
endfun

" nvimtree
nnoremap <Leader>e :NvimTreeToggle<CR>

" vim-test
let test#php#phpunit#executable = 'php artisan test' " Use artisan

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

lua <<EOF
require 'nvim-treesitter.configs'.setup {
    auto_install = true,
    highlight = {
        enable = true,
        disable = { "vue", "blade" }
    },
    indent = {
        enable = true,
    },
}
EOF

" PHP file indent issue fix
au BufNewFile,BufRead,BufReadPost *.php set syntax=php

" Floaterm
nmap <Leader>fg :FloatermNew lazygit<CR>
nmap <Leader>fd :FloatermNew lazydocker<CR>
nmap <Leader>fn :FloatermNew<CR>
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

" treesitter todo
nnoremap <leader>td <cmd>TodoTelescope<cr>
lua << EOF
require("todo-comments").setup {
    signs = false,
    highlight = {
        keyword = "bg"
    }
}
EOF

lua << EOF
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  hijack_directories  = {
        enable = true,
        auto_open = true,
    },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 30,
    side = 'left',
  },
  actions = {
    open_file = {
      resize_window = true
    }
  },
  renderer ={
    root_folder_label = false
  }
}
EOF

lua << END
require'lualine'.setup()
END

lua << EOF
require("github-theme").setup({
  option = {
    styles = {
      functions = "italic",
    },
  },
})
vim.cmd('colorscheme github_dark')
EOF
