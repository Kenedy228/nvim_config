local opts = {
	noremap = true,
	silent = true,
}

vim.g.mapleader = " "

-- Normal mode

--Changing windows
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

--Changing tabs
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", opts)
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", opts)
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", opts)
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", opts)

--File explorer
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

--LSP buffer
vim.keymap.set("n", "H", vim.lsp.buf.hover, {})

--TODO
vim.keymap.set("n", "]t", function()
	local todo_comments = require("todo_comments")
	todo_comments.jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	local todo_comments = require("todo_comments")
	todo_comments.jump_prev()
end, { desc = "Previous todo comment" })

--Telescope
vim.keymap.set("n", "<leader>ff", function()
	local builtin = require("telescope.builtin")
	builtin.find_files()
end, {})

vim.keymap.set("n", "<leader>fg", function()
	local builtin = require("telescope.builtin")
	builtin.live_grep()
end, {})

vim.keymap.set("n", "<leader>fb", function()
	local builtin = require("telescope.builtin")
	builtin.buffers()
end, {})

vim.keymap.set("n", "<leader>fh", function()
	local builtin = require("telescope.builtin")
	builtin.help_tags()
end, {})

--Auto-session
vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", {})
vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", {})

--Linter
vim.keymap.set("n", "<leader>fl", function()
	local lint = require("lint")
	lint.try_lint()
end, { desc = "Trigger linting for current file" })

--Formatter
vim.keymap.set({ "n", "v" }, "<leader>fd", function()
	local conform = require("conform")
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })

--Compiler
-- Open compiler
vim.keymap.set("n", "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.keymap.set(
	"n",
	"<S-F6>",
	"<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
		.. "<cmd>CompilerRedo<cr>",
	{ noremap = true, silent = true }
)

-- Toggle compiler results
vim.keymap.set("n", "<S-F7>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
