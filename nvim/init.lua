local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
    Plug('sudar/vim-arduino-syntax')
    Plug('neovim/nvim-lspconfig')
    Plug('preservim/nerdtree')
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

-- this shows clangd errors while you're editing source files
vim.diagnostic.config({
  virtual_text = true,
})

vim.cmd('colorscheme murphy')
vim.cmd('set shiftwidth=4 smarttab')
vim.cmd('set tabstop=4')
vim.cmd('set cindent')
vim.cmd('set number')
vim.cmd('set nowrap')

vim.cmd('noremap <C-p> :NERDTreeFind<CR>')
vim.cmd('noremap <C-n> :NERDTreeToggle<CR>')
