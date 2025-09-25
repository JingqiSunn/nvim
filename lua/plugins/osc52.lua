require('osc52').setup {
  max_length = 0, -- 0 means no limit
  silent = true, -- do not echo the copied text
  trim = true, -- trim trailing whitespace
  copy_hlgroup = "Visual", -- highlight group used when copying text
  register = "+", -- register to use for copying text
  paste_on_yank = true, -- paste on yank
}

local function copy()
  if vim.v.event.operator == 'y' and vim.v.event.regname == '' then
    require('osc52').copy_register('')
  end
end

vim.api.nvim_create_autocmd('TextYankPost', { callback = copy })
