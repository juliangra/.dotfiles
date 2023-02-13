local keymap = vim.keymap

vim.g.mapleader = " " -- Set leaderkey to <space>

-- General keymaps
keymap.set("i", "jk", "<ESC>")

-- Clear highlighted text
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Do not copy to register on deletion
keymap.set("n", "x", '"_x')

-- Increment and decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- Window split keymaps
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horisontally
keymap.set("n", "<leader>se", "<C-w>=") -- split window equally
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- Tab keymaps
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":BufferDelete<CR>") -- close current tab
keymap.set("n", "<leader>q", ":BufferDelete<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":BufferNext<CR>") -- go to next tab
keymap.set("n", "<leader>tb", ":BufferPrevious<CR>") -- go to previous tab

-- Tab shortcuts
keymap.set("n", "<leader>1", "<cmd>BufferGoto 1<CR>") -- go to tab 1
keymap.set("n", "<leader>2", "<cmd>BufferGoto 2<CR>") -- go to tab 2
keymap.set("n", "<leader>3", "<cmd>BufferGoto 3<CR>") -- go to tab 3
keymap.set("n", "<leader>4", "<cmd>BufferGoto 4<CR>") -- go to tab 4
keymap.set("n", "<leader>5", "<cmd>BufferGoto 5<CR>") -- go to tab 5
keymap.set("n", "<leader>6", "<cmd>BufferGoto 6<CR>") -- go to tab 6
keymap.set("n", "<leader>7", "<cmd>BufferGoto 7<CR>") -- go to tab 7
keymap.set("n", "<leader>8", "<cmd>BufferGoto 8<CR>") -- go to tab 8
keymap.set("n", "<leader>9", "<cmd>BufferGoto 9<CR>") -- go to tab 9

-- Plugin keymaps
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser<CR>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

-- lazygit
keymap.set("n", "<leader>gg", ":LazyGit<CR>")

local opts = { silent = true, nowait = true }

-- Code action menu
keymap.set("n", "<leader>lc", "<Plug>(coc-codeaction)", opts)

-- Rename
keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

-- Go to definition
keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })

-- Markdown preview
keymap.set({ "n", "v", "i" }, "<F5>", function()
	require("knap").process_once()
end)

-- Generate JsDoc
keymap.set("n", "<leader>md", ":JsDoc<CR>", opts)

vim.cmd([[

  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ "\<TAB>"

  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

]])
