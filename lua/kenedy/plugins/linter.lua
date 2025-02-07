return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "cspell" },
			typescript = { "cspell" },
			javascriptreact = { "cspell" },
			typescriptreact = { "cspell" },
			php = { "cspell" },
			lua = { "cspell" },
			json = { "cspell" },
			html = { "cspell" },
			cpp = { "cspell" },
			c = { "cspell" },
			cs = { "cspell" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
