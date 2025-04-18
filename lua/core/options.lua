local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
vim.o.background = "dark"
opt.termguicolors = true
opt.signcolumn = "yes"
vim.cmd[[colorscheme catppuccin]]
vim.cmd[[hi Cursor guifg=white guibg=white]]
local function copy(text)
    local encoded = vim.fn.system("base64", text):gsub("\n", "")
    local osc52_seq = "\27]52;c;" .. encoded .. "\7"
    io.stdout:write(osc52_seq)
    io.stdout:flush()
end

vim.g.clipboard = {
    name = "OSC 52",
    copy = {
        ["+"] = copy,
        ["*"] = copy,
    },
    paste = {
        ["+"] = "pbpaste",
        ["*"] = "pbpaste",
    },
}
