return {
	"goolord/alpha-nvim",
	-- dependencies = { 'echasnovski/mini.icons' },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local theme = require("alpha.themes.dashboard")

		theme.section.header.val = {
			[[                                                                       ]],
			[[  ██████   █████                   █████   █████  ███                  ]],
			[[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
			[[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
			[[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
			[[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
			[[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
			[[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
			[[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
			[[                                                                       ]],
		}
		local function footer()
			local total_plugins = #require("lazy").plugins()
			local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
			local version = vim.version()
			local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

			return datetime .. "  " .. total_plugins .. " plugins" .. nvim_version_info
		end

		theme.section.footer.val = footer()

		theme.section.buttons.val = {
			theme.button("f", "  > Find file", ":cd D:\\devs\\projects | FzfLua files<CR>"),
			theme.button("r", "  > Marks", ":FzfLua marks<CR>"),
			theme.button("s", "  > Settings", ":cd ~\\AppData\\Local\\nvim | FzfLua files<CR>"),
			theme.button("q", "󰈆  > Quit", ":qa<CR>"),
		}
		require("alpha").setup(theme.config)
	end,
}
