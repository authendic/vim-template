scriptencoding utf8
" vim:set fdm=marker:

let s:template_home = resolve(expand('<sfile>:p:h:h'))

function template#Home() 
    return s:template_home
endfunction

let g:template_paths = get(g:, 'template_paths', ['./templates'])
function template#GetTemplate(postfix)
    let s:name = "skeleton.".a:postfix
    for s:p in g:template_paths
        if s:p[0:2] == './'
            s:p = expand(s:p)
            let s:template_file = s:template_home .s:p[1:]. '/'. s:name
        else
            let s:template_file = s:p. '/' . s:name
        endif
        if filereadable(s:template_file)
            return s:template_file
        endif
    endfor
    return ''
endfunction
