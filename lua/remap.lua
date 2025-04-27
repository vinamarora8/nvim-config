function ToggleSigncolumn()
	if vim.wo.signcolumn == "yes" then
		vim.wo.signcolumn = "no"
	else
		vim.wo.signcolumn = "yes"
	end
end

function TelescopeSafeGitFiles()
	if os.execute("git rev-parse HEAD 2> /dev/null 1> /dev/null") == 0 then
		vim.cmd("Telescope git_files")
	else
		vim.cmd("Telescope find_files")
	end
end

vim.g.mapleader = " "

-- File explorers
vim.keymap.set("n", "<leader>xf", ":Neotree reveal<CR>", { desc = "Explorer: focus", silent = true })
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Explorer: toggle", silent = true })
vim.keymap.set("n", "<leader>ff", TelescopeSafeGitFiles, { desc = "Telescope: git files" })
vim.keymap.set("n", "<leader>fa", ":Telescope find_files<CR>", { desc = "Telescope: all files" })

-- Buffer management
vim.keymap.set("n", "<leader>xb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>xk", ":bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Buffer: close current" })
vim.keymap.set("n", "<leader>bl", ":Telescope buffers<CR>", { desc = "Buffer: list in telescope" })
vim.keymap.set("n", "<leader>bk", ":bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Buffer: close current" })

-- Text editing
vim.keymap.set("n", "<leader>n", ":noh<CR>:cclose<CR>", { desc = "Clear highlights & close quickfix list" })
vim.keymap.set("n", "<C-d>", "10j", { noremap = true })
vim.keymap.set("n", "<C-u>", "10k", { noremap = true })

-- Sign column toggle
vim.keymap.set("n", "<leader>s", ToggleSigncolumn, { desc = "Toggle sign column", silent = true })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(e)
		local desc_opts = function(desc)
			return { buffer = e.buf, desc = desc }
		end
		print("LSP attached!")
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, desc_opts("LSP: goto definition"))
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({ border = "single" })
		end, desc_opts("LSP: symbol info"))
		vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, desc_opts("show LSP diagnostics under cursor"))
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, desc_opts("show references of symbol under cursor"))
		vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, desc_opts("rename symbol under cursor"))
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, desc_opts("show function signature"))
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, desc_opts("goto next diagnostic"))
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, desc_opts("goto prev diagnostic"))
		vim.keymap.set("n", "<leader>lq", vim.diagnostic.setqflist, desc_opts("open diagonostics as qflist"))
		-- vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { buffer = e.buf, desc = "Workspace symbol" })
		-- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
		--
		-- Disabled since handling
		-- vim.keymap.set("n", "<leader>bf", function()
		--     vim.lsp.buf.format(); print("Formatted")
		-- end, desc_opts("LSP: format current buffer"))
	end,
})

-- Formatting
vim.keymap.set("n", "<leader>bf", ":lua require('conform').format()<CR>", { desc = "Buffer: format current buffer" })

-- Git
function GitBufferInfoToggle()
	local gitsigns = require("gitsigns")
	gitsigns.toggle_linehl()
	gitsigns.toggle_deleted()
end
vim.keymap.set("n", "<leader>gg", GitBufferInfoToggle, { desc = "git: toggle diff" })
vim.keymap.set("n", "<leader>gv", ":Gitsigns select_hunk<CR>", { desc = "select hunk" })
vim.keymap.set("n", "<leader>gd", ":Gitsigns preview_hunk<CR>", { desc = "preview hunk diff" })
vim.keymap.set(
	"n",
	"<leader>gi",
	":FloatermNew --height=0.8 --width=0.8 --name=gitui gitui<CR>",
	{ desc = "git: toggle diff" }
)

vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "stage hunk" })
vim.keymap.set("v", "<leader>gs", function()
	require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "stage hunk" })

vim.keymap.set("n", "<leader>gx", ":Gitsigns reset_hunk<CR>", { desc = "reset hunk" })
vim.keymap.set("v", "<leader>gx", function()
	require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "reset hunk" })

vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", { desc = "unstage hunk" })
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "blame line" })
vim.keymap.set("n", "]g", ":Gitsigns next_hunk<CR>", { desc = "goto next hunk" })
vim.keymap.set("n", "[g", ":Gitsigns prev_hunk<CR>", { desc = "goto prev hunk" })
vim.keymap.set("n", "<leader>gl", ":Gitsigns setqflist<CR>", { desc = "show change in quickfix list" })

-- Copilot chat
vim.keymap.set("n", "<A-l>", ":CopilotChatToggle<CR>")
vim.keymap.set("n", "<A-k>", function()
	require("CopilotChat").open({
		window = {
			layout = "float",
			relative = "cursor",
			width = 80,
			height = 5,
            row = -5,
            col = 0,
		},
	})
end)


-- Lol
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
