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
    guifont = "cantarell:h18",
    shiftwidth = 4,
    smartindent = true,
    fileencoding = "utf-8",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=crp]]
