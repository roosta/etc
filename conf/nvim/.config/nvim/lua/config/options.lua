-- ┌─┐┬─┐┌┐┐o┌─┐┌┐┐┐─┐
-- │ ││─┘ │ ││ ││││└─┐
-- ┘─┘┆   ┆ ┆┘─┘┆└┘──┘
-- ─────────────────────────────────────────────────────────────────────────────

-- Space as leader, backslash as local
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- General
vim.opt.scrolloff = 7
vim.opt.cursorline = true
vim.opt.spelllang = { "en_us", "nb" }
vim.opt.undofile = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.matchtime = 2
vim.opt.showmatch = true
vim.opt.clipboard:append('unnamedplus')

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.shiftround = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- Linebreak
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = '↳ '

-- Local rc
-- https://vimtricks.com/p/local-vimrc-files/
if vim.fn.getcwd():find('^' .. vim.fn.expand('~/src')) then
  vim.opt.secure = true
  vim.opt.exrc = true
end

if vim.fn.executable('rg') == 1 then
  vim.opt.grepprg =
    "rg --vimgrep --no-heading --smart-case --hidden --glob '!**/.git/*'"
end

vim.opt.termguicolors = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.textwidth = 80
--  vim: set ts=2 sw=2 tw=0 fdm=marker et :
