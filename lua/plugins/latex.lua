vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 0

vim.api.nvim_exec([[
  augroup latex_auto_compile
    autocmd!
    autocmd BufWritePost *.tex silent! VimtexCompile
  augroup END
]], false)

-- 遇 warning 不弹出 Quickfix 窗口
vim.g.vimtex_quickfix_open_on_warning = 0

