return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- Autocompletion capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- lua_ls
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
							disable = { "different-requires" },
						},
					},
				},
			})
			vim.lsp.enable("lua_ls")

			-- rust_analyzer
			vim.lsp.config("rust_analyzer", {
				capabilities = capabilities,
			})
			vim.lsp.enable("rust_analyzer")

			-- pyright
			vim.lsp.config("pyright", {
				capabilities = capabilities,
				filetypes = { "py" },
			})
			vim.lsp.enable("pyright")

			-- svelte
			vim.lsp.config("svelte", {
				capabilities = capabilities,
				filetypes = { "svelte" },
			})
			vim.lsp.enable("svelte")

			-- ts_ls
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				filetypes = { "ts", "tsx" },
			})
			vim.lsp.enable("ts_ls")

			-- gopls
			vim.lsp.config("gopls", {
				capabilities = capabilities,
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				settings = {
					env = {
						GOEXPERIMENT = "rangefunc",
					},
					formatting = {
						gofumpt = true,
					},
				},
			})
			vim.lsp.enable("gopls")

			-- tailwindcss
			vim.lsp.config("tailwindcss", {
				capabilities = capabilities,
				settings = {
					includeLanguages = {
						templ = "html",
					},
				},
			})
			vim.lsp.enable("tailwindcss")

			-- templ
			vim.lsp.config("templ", {
				capabilities = capabilities,
			})
			vim.lsp.enable("templ")
		end,
	},
}
