vim.g.mapleader = " "

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true -- show which line cursor is on
vim.opt.cursorlineopt = "both"
vim.opt.wrap = false

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes" -- signcolumn - where LSP warnings/errors show up
vim.opt.mouse = "a" -- use mouse (e.g. for resizing splits, selecting, scrolling)
vim.opt.showmode = true -- show mode in cmdline; statustline is slow sometimes, this is instant
vim.opt.undofile = true -- persistent undo history

vim.opt.splitright = true -- default directions to split in
vim.opt.splitbelow = true -- ...

-- Don't continue comments on newlines (very annoying behavior)
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
