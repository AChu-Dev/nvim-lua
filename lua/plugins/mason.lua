return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"emmet_language_server",
				"rust_analyzer",
				"pyright",
				"ts_ls",
				"html",
				"svelte",
				"clangd",
				"tailwindcss",
				"lua_ls",
				"graphql",
				"ansiblels",
				"bashls",
				"docker_compose_language_service",
				"dockerls",
				"golangci_lint_ls",
				"gopls",
				"gitlab_ci_ls",
				"jsonls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d", -- js linter
			},
		})
	end,
}
