local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

-- TODO: Fix this
-- local transform_mod = require("telescope.actions.mt").transform_mod
-- local mod = {}
-- mod.open_in_nvim_tree = function(prompt_bufnr)
-- 	vim.cmd("NvimTreeFindFile")
-- 	vim.api.nvim_set_current_buf(1)
-- end
--
-- mod = transform_mod(mod)

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				-- ["<CR>"] = actions.select_default + mod.open_in_nvim_tree,
			},
		},
	},
	pickers = {
		find_files = {
			find_command = {
				"rg",
				"--files",
				"--hidden",
				"--no-ignore",
				"-g",
				"!node_modules",
				"-g",
				"!.git",
				"-g",
				"!.next",
			},
		},
	},
	extensions = {
		file_browser = {
			grouped = true,
			hijack_netrw = true,
			hidden = true,
			theme = "dropdown",
		},
	},
})

-- Currently incompatible due to architecture issues
-- require('telescope').load_extension("fzf")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("env")
