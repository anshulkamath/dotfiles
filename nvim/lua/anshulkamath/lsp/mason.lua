return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls",
					"yamlls",
					"lua_ls",
					"marksman",
				},
				automatic_installation = true,
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"gopls",
					"prettier",
					"stylua",
					"goimports",
				},
			})
		end,
	},
}
