return {
	"NicolasGB/jj.nvim",
	version = "*",
	cmd = "J",
	keys = {
		{ "<leader>jj", "<cmd>J log<CR>", desc = "jj log" },
		{ "<leader>js", "<cmd>J status<CR>", desc = "jj status" },
		{ "<leader>jd", "<cmd>J diff<CR>", desc = "jj diff" },
		{ "<leader>jc", "<cmd>J commit<CR>", desc = "jj commit" },
		{ "<leader>jn", "<cmd>J new<CR>", desc = "jj new change" },
		{ "<leader>je", "<cmd>J edit<CR>", desc = "jj edit revision" },
		{ "<leader>jD", "<cmd>J describe<CR>", desc = "jj describe" },
		{ "<leader>jb", "<cmd>J bookmark<CR>", desc = "jj bookmark" },
		{ "<leader>jp", "<cmd>J push<CR>", desc = "jj push" },
		{ "<leader>jf", "<cmd>J fetch<CR>", desc = "jj fetch" },
		{ "<leader>ju", "<cmd>J undo<CR>", desc = "jj undo" },
		{ "<leader>jr", "<cmd>J rebase<CR>", desc = "jj rebase" },
		{ "<leader>jq", "<cmd>J squash<CR>", desc = "jj squash" },
		{ "<leader>ja", "<cmd>J annotate<CR>", desc = "jj annotate (blame)" },
		{ "<leader>jo", "<cmd>J open_pr<CR>", desc = "jj open PR" },
	},
	config = function()
		require("jj").setup({})
	end,
}
