local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('sudar/vim-arduino-syntax')
Plug('neovim/nvim-lspconfig')

vim.call('plug#end')

local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
  cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
  init_options = {
    fallbackFlags = { '-std=c++17' },
  },
})

vim.cmd('colorscheme pablo')
vim.cmd('set shiftwidth=4 smarttab')
vim.cmd('set number')
