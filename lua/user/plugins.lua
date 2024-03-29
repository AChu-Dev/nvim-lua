return require('packer').startup(function()
        --Allows Packer to Manage itself
        use {'wbthomason/packer.nvim'}
	    --Themes
        --use {'thedenisnikulin/vim-cyberpunk'}
        use {"projekt0n/github-nvim-theme"}
        use {'sonph/onehalf'}
	    --Code Addons
        use { 'mhartington/formatter.nvim' }
        use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
	    use {'preservim/nerdtree'}
        use {'junegunn/vim-easy-align'}
	    use {'airblade/vim-gitgutter', on = 'GitGutterEnable'}
	    use {'ryanoasis/vim-devicons'}
        use {"williamboman/mason.nvim"}
        use {"williamboman/mason-lspconfig.nvim"}
        use {'neovim/nvim-lspconfig'}
        use {"nvim-telescope/telescope.nvim", requires = {{'nvim-lua/plenary.nvim'}}}
        use {"hrsh7th/cmp-nvim-lsp"}
        use {"hrsh7th/cmp-buffer"}
        use {"hrsh7th/nvim-cmp"}
        use {"L3MON4D3/LuaSnip"}
        use {"saadparwaiz1/cmp_luasnip"}
        use {"onsails/lspkind-nvim"}
end)
