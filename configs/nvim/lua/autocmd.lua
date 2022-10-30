vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost *.sh | ShellCheck! 
  augroup end
]])


vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.rs",
	callback = function()
		vim.lsp.buf.formatting_sync(nil, 200)
	end,
	group = format_sync_grp,
})


