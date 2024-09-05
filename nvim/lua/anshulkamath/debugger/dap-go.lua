return {
	"leoluz/nvim-dap-go",
	name = "nvim-dap-go",
	dependencies = {
		{ "mfussenegger/nvim-dap", name="nvim-dap" },
	},
	opts = {
		buildFlags = {
			"-gcflags=-N -l",
		},
	},
}
