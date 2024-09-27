-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  desc = 'Open help page in a vertical split instead of horizontal',
  group = vim.api.nvim_create_augroup('help_window_right', {}),
  pattern = { '*.txt' },
  callback = function()
    if vim.o.filetype == 'help' then
      vim.cmd.wincmd 'L'
    end
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Make a buffer-local keymap of gd to enabled natural traversel of help files',
  pattern = 'help',
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<C-]>', { noremap = true, silent = true })
  end,
})
