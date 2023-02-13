local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- Recommended settings from the nvim-tree docs
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

local nvim_tree_setup, nvim_tree_events = pcall(require, "nvim-tree.events")
if not nvim_tree_setup then
	return
end
local bufferline_setup, bufferline_api = pcall(require, "bufferline.api")
if not bufferline_setup then
	return
end

nvim_tree_events.on_tree_open(function()
	bufferline_api.set_offset(31, "File Tree")
end) -- Adds offset for the file explorer on tree open

nvim_tree_events.on_tree_close(function()
	bufferline_api.set_offset(0)
end) -- Removes the offset for file explorer on tree close

nvimtree.setup({
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
})
