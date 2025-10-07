return {
	"neovim/nvim-lspconfig",
	config = function()
		-- Setup language servers.
		local lsps = {
			{
				"emmet_language_server",
				filetypes = {
					"css",
					"svelte",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"pug",
					"typescriptreact",
				},
				-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
				-- **Note:** only the options listed in the table are supported.
				init_options = {
					---@type table<string, string>
					includeLanguages = {},
					--- @type string[]
					excludeLanguages = {},
					--- @type string[]
					extensionsPath = {},
					--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
					preferences = {},
					--- @type boolean Defaults to `true`
					showAbbreviationSuggestions = true,
					--- @type "always" | "never" Defaults to `"always"`
					showExpandedAbbreviation = "always",
					--- @type boolean Defaults to `false`
					showSuggestionsAsSnippets = false,
					--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
					syntaxProfiles = {},
					--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
					variables = {},
				},
			},
			{
				"rust_analyzer",
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			},
			{ "pyright" },
			{ "ts_ls" },
			{ "html" },
			{ "svelte" },
			{ "clangd" },
			{ "tailwindccss" },
			{ "lua_ls" },
			{ "graphql" },
			{ "ansiblels" },
			{ "bashls" },
			{ "docker_compose_language_service" },
			{ "dockerls" },
			{ "golangci_lint_ls" },
			{ "gopls" },
			{ "gitlab_ci_ls" },
			{ "jsonls" },
		}

		-- Automatically Pickup LSP Names and Configs from traverisingz list
		for _, lsp in pairs(lsps) do
			local name, config = lsp[1], lsp[2]
			vim.lsp.enable(name)
			if config then
				vim.lsp.config(name, config)
			end
		end

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		--
		vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
		vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
		vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float)
		vim.keymap.set("n", "<space>dl", vim.diagnostic.setloclist)

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set("n", "<space>f", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end,
		})
		local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		}

		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end

		local config = {
			-- disable virtual text
			virtual_text = false,
			-- show signs
			signs = {
				active = signs,
			},
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}
		vim.diagnostic.config(config)
	end,
}
