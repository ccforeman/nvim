require('dap-python').setup('/home/cforeman/.pyenv/versions/3.10.13/envs/debugpy/bin/python')
-- TODO: Add ability to use launch.json to configure project specific launch configurations
-- Run :help dap-launch.json or go to https://github.com/mfussenegger/nvim-dap-python to read more
local dap = require('dap')
table.insert(dap.configurations.python, {
    type = 'python',
    request = 'launch',
    name = 'codecrafters-sqlite-main config',
    module = 'app.main',
    -- args = {'sample.db', '.tables'},
    args = function()
        local args_string = vim.fn.input('Argument: ')
        -- return vim.split('sample.db ' .. args_string, " +")
        return {'superheroes.db', args_string}
    end,
    console = 'integratedTerminal',
    pythonPath = 'python',
    cwd = '/home/cforeman/dev/codecrafters-sqlite-python-advanced/'
})
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').close() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<F9>', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<leader>dh', function()
    require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<leader>dp', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)
