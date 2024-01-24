local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
	"folke/which-key.nvim",
	"theprimeagen/harpoon",
    {
        
        "mortepau/codicons.nvim",
        lazy = false
    },
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},
	{
		'rose-pine/neovim',
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		name = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	},

	{
		'nvim-treesitter/nvim-treesitter',
		version = false,
		build = ":TSUpdate",
		--event = { "VeryLazy" },

	},
	--'nvim-treesitter/playground',
	'mbbill/undotree',
	--'tpope/vim-fugitive',
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		dependencies = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'williamboman/mason-nvim-dap.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	},
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false
    },
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            -- fancy UI for the debugger
            {
                'rcarriga/nvim-dap-ui',
                -- stylua: ignore
                keys = {
                    { '<leader>du', function() require('dapui').toggle({ }) end, desc = "Toggle DAP UI" },
                    { '<leader>de', function() require('dapui').eval() end, desc = "Eval", mode = {'n', 'v'} },
                },
                opts = {},
                config = function(_, opts)
                    -- setup dap config by VSCode launch.json file
                    -- require('dap.ext.vscode').load_launchjs()
                    local dap = require('dap')
                    local dapui = require('dapui')

                    dapui.setup(opts)
                    dap.listeners.after.event_initialized['dapui_config'] = function()
                        dapui.open({})
                    end
                    dap.listeners.before.event_terminated['dapui_config'] = function()
                        dapui.close({})
                    end
                    dap.listeners.before.event_exited['dapui_config'] = function()
                        dapui.close({})
                    end
                end,
            },

            -- virtual text for the debugger
            {
                'theHamsta/nvim-dap-virtual-text',
                opts = {},
            },

            -- which key integration
            {
                'folke/which-key.nvim',
                optional = true,
                opts = {
                    default = {
                        ['<leader>d'] = { name = '+debug' },
                    },
                }
            },

            -- Not sure I need mason nvim deps
        },

        -- do keys?
        -- stylua: ignore
        -- keys = {
        --     { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
        --     { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        --     { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
        --     { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
        --     { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
        --     { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
        --     { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
        --     { "<leader>dj", function() require("dap").down() end, desc = "Down" },
        --     { "<leader>dk", function() require("dap").up() end, desc = "Up" },
        --     { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
        --     { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
        --     { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
        --     { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
        --     { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
        --     { "<leader>ds", function() require("dap").session() end, desc = "Session" },
        --     { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
        --     { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
        -- },
        config = function()
            vim.api.nvim_set_hl(0, 'DapStoppedLine', { default = true, link = 'Visual' })
        end
    },
    'mfussenegger/nvim-dap-python',
    'mortepau/codicons.nvim',
    {
        'akinsho/toggleterm.nvim',
        version = "*", 
        config = true
    }

})
require("cforeman.set")
require("cforeman.remap")
