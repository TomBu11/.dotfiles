require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("i", "C-h", "C-w")
map("i", "C-BS", "C-w")
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
map("i", "jl", "<C-o>")
map("i", "lj", "<C-o>")

-- map("t", "Esc", "<C-\\><C-n>")

vim.opt.shiftwidth = 4
