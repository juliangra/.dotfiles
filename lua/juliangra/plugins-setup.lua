local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

-- Run PackerSync on file save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Init packer

	-- Lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	use("bluz71/vim-nightfly-guicolors") -- Nightfly color scheme

	use("Shatur/neovim-ayu") -- Ayu mirage color theme

	-- Tmux & split window navigation
	use("christoomey/vim-tmux-navigator")

	-- Maximizes and restores current window
	use("szw/vim-maximizer")

	-- Essential plugins
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")

	-- Commenting with gc
	use("numToStr/Comment.nvim")

	-- File explorer
	use("nvim-tree/nvim-tree.lua")

	-- File icons
	use("kyazdani42/nvim-web-devicons")

	-- Statusline
	use("nvim-lualine/lualine.nvim")

	-- TODO: This will not work due to M1 architecture issues
	-- use({'lucasfcosta/telescope-fzf-native.nvim', run = 'make' })

	-- Fuzzy finding
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
	use({ "nvim-telescope/telescope-ui-select.nvim" }) -- for showing lsp code actions
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "LinArcX/telescope-env.nvim" })

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- Managing & installing LSP servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- Configuring LSP servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")

	-- Formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- Auto closing
	-- use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- Git signs plugin
	use("lewis6991/gitsigns.nvim")

	-- Lazygit integration
	use("kdheepak/lazygit.nvim")

	-- Code actions menu
	use({
		"weilbith/nvim-code-action-menu",
		after = "coc.nvim",
		requires = "xiyaowong/coc-code-action-menu.nvim",
		config = function()
			require("coc-code-action-menu")
		end,
	})

	-- Renamer
	use({
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	})

	-- Markdown preview
	use("frabjous/knap")

	-- Tabline
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	-- Barbar
	use({ "romgrk/barbar.nvim", requires = "nvim-web-devicons" })

	-- K9s
	use("hsalem7/nvim-k8s")

	-- Volar
	use("yaegassy/coc-volar-tools")

	-- Code minimap
	use("wfxr/minimap.vim")

	-- Startup screen
	use({
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("startup").setup()
		end,
	})

	-- CoC
	use({ "neoclide/coc.nvim", branch = "release" })

	-- JsDoc
	use("heavenshell/vim-jsdoc")

	-- venvsetup
	use("jmcantrell/vim-virtualenv")

	-- Case converted
	use("chiedo/vim-case-convert")

	-- GitHub copilot
	use("github/copilot.vim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
