vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jj", "<ESC>")


-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<cmd>h", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<cmd>v", "<C-w>s") -- 垂直新增窗口
keymap.set("n", " ", ":")
keymap.set("n", "mm", "gd")
keymap.set("n", "ff", "gf")
keymap.set("n", "rr", "<C-o>")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

--copyright
local copyright = require("core.copyright")

vim.keymap.set("n", "ccpp", copyright.add_copyright, { desc = "Add copyright notice" })
