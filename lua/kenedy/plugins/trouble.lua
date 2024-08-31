return {
	"folke/trouble.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", {} },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", {} },
		{ "<leader>xq", "<cmd>Trouble qflist toggle<CR>", {} },
	}
}
