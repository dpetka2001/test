-- DO NOT change the paths and don't remove the colorscheme
local root = vim.fn.fnamemodify("./.repro", ":p")

-- set stdpaths to use .repro
for _, name in ipairs({ "config", "data", "state", "cache" }) do
	vim.env[("XDG_%s_HOME"):format(name:upper())] = root .. "/" .. name
end

-- bootstrap lazy
local lazypath = root .. "/plugins/lazy.nvim"
-- local lazypath = vim.fn.expand("~/projects/plugins/lazy.nvim/")
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.runtimepath:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
	spec = {
		{
			"folke/tokyonight.nvim",
			priority = 1000,
			lazy = false,
			config = function()
				require("tokyonight").setup({ style = "moon" })
				require("tokyonight").load()
			end,
		},
		{ import = "plugins" },
	},
	root = root .. "/plugins",
	dev = {
		path = "~/projects/plugins/",
	},
})

vim.cmd.colorscheme("tokyonight")
