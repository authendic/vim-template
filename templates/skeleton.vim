
" File              : <%=expand('%:t')%>
" Author            : <%=g:template_author%>
" Date              : <%=strftime('%Y-%m-%d')%>
" vim: ts=8 sw=4 sts=4 et foldenable foldmethod=marker foldcolumn=1


scriptencoding utf-8

if exists('g:loaded_<%=expand('%:t:r').'_'.strftime('%M%S')%>') | finish | endif " prevent loading file twice
let s:save_cpo = &cpo
set cpo&vim


let &cpo = s:save_cpo
unlet s:save_cpo
let g:<%=expand('%:t:r').'_'.strftime('%M%S')%>= 1
