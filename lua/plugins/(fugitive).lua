-- Inside `testdir/(fugitive).lua`
return {
	"tpope/vim-fugitive",
	event = "BufReadPre",

	config = function()
		print("fugitive init loaded!")
	end,
}
