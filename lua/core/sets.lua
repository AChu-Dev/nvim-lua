local options = {
	number = true,
	autoindent = true,
	ignorecase = true,
	smartcase = true,
	hlsearch = true,
	incsearch = true,
	history = 512,
	cmdheight = 2,
	tabstop = 4,
	cursorline = true,
	smarttab = true,
	showtabline = 2,
	termguicolors = true,
	clipboard = "unnamedplus",
	conceallevel = 0,
	mouse = "a",
	wrap = false,
	softtabstop = 0,
	expandtab = true,
	scrolloff = 8,
	sidescrolloff = 8,
	splitright = true,
	splitbelow = true,
	shiftwidth = 4,
	smartindent = true,
	fileencoding = "utf-8",
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end


