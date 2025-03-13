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

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
    })
  end,
})

vim.cmd('colorscheme murphy')
vim.cmd('set shiftwidth=4 smarttab')
vim.cmd('set number')
