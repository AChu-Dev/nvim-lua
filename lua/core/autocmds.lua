vim.api.nvim_create_autocmd("TabNewEntered", {
	group = vim.api.nvim_create_augroup("NeotreeOnNewTab", { clear = true }),
	callback = vim.schedule_wrap(function()
		vim.cmd("Neotree show")
	end),
})
