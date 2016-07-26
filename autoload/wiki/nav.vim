" wiki
"
" Maintainer: Karl Yngve Lervåg
" Email:      karl.yngve@gmail.com
"

function! wiki#nav#next_link() "{{{1
  call search(wiki#rx#link(), 's')
endfunction

" }}}1
function! wiki#nav#prev_link() "{{{1
  if wiki#u#in_syntax('wikiLink.*')
        \ && wiki#u#in_syntax('wikiLink.*', line('.'), col('.')-1)
    call search(wiki#rx#link(), 'sb')
  endif
  call search(wiki#rx#link(), 'sb')
endfunction

" }}}1
function! wiki#nav#return() "{{{1
  if exists('b:wiki.prev_link')
    let [l:file, l:pos] = b:wiki.prev_link
    execute ':e ' . substitute(l:file, '\s', '\\\0', 'g')
    call setpos('.', l:pos)
  else
    silent! pop!
  endif
endfunction

" }}}1

" vim: fdm=marker sw=2