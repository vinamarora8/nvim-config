vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!

vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes" -- signcolumn - where LSP warnings/errors show up
vim.opt.mouse = "a" -- use mouse (e.g. for resizing splits, selecting, scrolling)
vim.opt.showmode = true -- show mode in cmdline; statustline is slow sometimes, this is instant
vim.opt.undofile = true -- persistent undo history
vim.opt.updatetime = 250 -- time (ms) to wait before current edits are written in a swap file
vim.opt.timeoutlen = 300 -- time (ms) to wait for key sequences

vim.opt.splitright = true -- default directions to split in
vim.opt.splitbelow = true -- ...

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Don't continue comments on newlines (very annoying behavior)
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
