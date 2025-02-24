return require('packer').startup(function()
  use {
    'github/copilot.vim',
    config = function()
      vim.api.nvim_set_keymap('i', '<C-a>', "<Cmd>Copilot Accept<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('i', '<C-/>', "<Cmd>Copilot Trigger<CR>", { noremap = true, silent = true })
    end
  }
end)
