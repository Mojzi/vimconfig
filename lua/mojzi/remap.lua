vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "/r", function()
    vim.lsp.buf.format()
end)
