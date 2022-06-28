" File              : template.vim
" Author            : daniel <danielliwd86@gmail.com>
" Date              : 2022-06-28
" Last Modified Date: 2022-06-28
" Last Modified By  : daniel <danielliwd86@gmail.com>

" Install:
"   Plug 'authendic/vim-template'
"
" config:
"   let g:template_paths = ['./templates', '/path/to/templates']
"
" self define template:
"   /path/to/templates/skeleton.<ext>
"

:scriptencoding utf-8

if exists('g:loaded_template_0100') | finish | endif " prevent loading file twice
let s:save_cpo = &cpo
set cpo&vim

let g:template_author = get(g:, 'template_author', 'daniel')

" auto use templates
" 新建文件时自动使用模板
augroup Templates
    autocmd!
    " 模板替换算法: [template.vim](https://www.vim.org/scripts/script.php?script_id=2834)
    autocmd BufNewFile *.*  let b:tpl = template#GetTemplate(expand('%:e'))
        \| if filereadable(b:tpl) 
        \| exec "0r ".b:tpl 
        \| silent %s/<%=\(.\{-}\)%>/\=eval(submatch(1))/ge 
        \| endif
augroup end

let &cpo = s:save_cpo
unlet s:save_cpo
let g:loaded_template_0100 = 1
