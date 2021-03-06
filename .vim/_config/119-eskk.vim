if !filereadable(expand('~/.config/eskk/jisyo'))
    call system('mkdir -p ~/.config/eskk')
    call system('cd ~/.config/eskk/ && wget http://openlab.jp/skk/dic/SKK-JISYO.L.gz && gzip -d SKK-JISYO.L.gz && nkf -Ew SKK-JISYO.L > jisyo && rm -f SKK-JISYO.L')
endif

let g:eskk#directory = "~/.config/eskk"
let g:eskk#dictionary = { 'path': "~/.config/eskk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': "~/.config/eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'utf-8',}

autocmd User eskk-initialize-post call s:eskk_initial_pre()
function! s:eskk_initial_pre() abort
    EskkUnmap -type=sticky ;
    EskkMap -type=sticky Q
endfunction

imap <C-o> <Plug>(eskk:toggle)
cmap <C-o> <Plug>(eskk:toggle)
let g:eskk#kakutei_when_unique_candidate = 1
let g:eskk#enable_completion = 0

