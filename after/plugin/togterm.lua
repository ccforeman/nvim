require("toggleterm").setup {
    size = 20,
    open_mapping = [[<C-\>]],
    direction = 'horizontal',
}

function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
