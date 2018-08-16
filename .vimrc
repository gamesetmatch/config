"colorscheme badwolf                                                                               "wonderful colourscheme

set backspace=indent,eol,start                                                                     "backspace over everything in insert mode

syntax enable                                                                                      "enable syntax processing

set tabstop=4                                                                                      "number of visual spaces per tab

set shiftwidth=4                                                                                   "number of spaces when indenting

set softtabstop=4                                                                                  "number of spaces in tab when editing

set expandtab                                                                                      "tabs are spaces

set number                                                                                         "show line numbers

set showcmd                                                                                        "show command in bottom bar

set cursorline                                                                                     "highlight current line

set wildmenu                                                                                       "visual autocomplete for command menu

filetype indent on                                                                                 "load filetype-specific indent files

set lazyredraw                                                                                     "redraw only when we need to

set showmatch                                                                                      "highlight matching [{()}]

set incsearch                                                                                      "search as characters are entered

set ic                                                                                             "ignore case while searching

set pastetoggle=<leader>p                                                                          "toggle to lose indentation while pasting

"set previewheight=100                                                                             "sets the preview height for definition previews

set tags=./tags;/                                                                                  "sets tags file

"set vb                                                                                            "sets visual bell instead of audio

set belloff=all                                                                                    "disable audio bells

highlight LineNr ctermfg=grey       "changes line number to grey

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

command Wq  wq

command WQ  wq

command W   w

command Q   q

"nnoremap <C-]> :execute "vertical ptag " . expand("<cword>")<CR>

"command to split and open another file
:nmap <leader>f :vsp

"command to remove trailing spaces
:nmap <leader>t :%s/\s\+$//gc

"command to set tabs to spaces
:nmap<leader>s :%s/\t/    /gc

"toggle highlighting search matches
:nmap <leader>h :set invhlsearch

"toggle showing linenumbers
:nmap <leader>n :set invnumber

"search case insensitive
:nmap <leader>c :set invic

"http://dougblack.io/words/a-good-vimrc.html"
