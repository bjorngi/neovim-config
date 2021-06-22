syntax off
hi DiffText   cterm=none ctermfg=DarkYellow ctermbg=none gui=none guifg=DarkYellow guibg=none    
hi DiffChange cterm=none ctermfg=LightYellow ctermbg=none gui=none guifg=LightYellow guibg=none    
hi DiffAdd    cterm=bold ctermfg=LightGreen ctermbg=none gui=none guifg=LightGreen guibg=none    
hi DiffDelete cterm=bold ctermfg=DarkRed ctermbg=none gui=none guifg=DarkRed guibg=none    
    
nmap <Left> :tabp<CR>    
nmap <Right> :tabn<CR>    
nmap <Up> :tabs<CR>    
nmap <Down> :windo bd<CR>
