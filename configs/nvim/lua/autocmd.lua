vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost *.sh | ShellCheck! 
  augroup end
]])
