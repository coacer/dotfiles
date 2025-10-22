-- ============================================
-- Basic Keymaps
-- ============================================

-- ctrl+l for escape
-- snoremap is used when using snippets
vim.keymap.set('i', '<C-l>', '<Esc>', { noremap = true })
vim.keymap.set('c', '<C-l>', '<C-c>', { noremap = true })
vim.keymap.set('v', '<C-l>', '<Esc>', { noremap = true })
vim.keymap.set('s', '<C-l>', '<Esc>', { noremap = true })
vim.keymap.set('o', '<C-l>', '<Esc>', { noremap = true })
vim.keymap.set('l', '<C-l>', '<Esc>', { noremap = true })

-- ctrl+l to exit terminal mode
vim.keymap.set('t', '<C-l>', [[<C-\><C-n>]], { noremap = true })

-- ctrl+l to disable search highlight and redraw
vim.keymap.set('n', '<C-l>', '<Cmd>nohlsearch<CR><C-l>', { noremap = true, silent = true })

-- ============================================
-- File Operations
-- ============================================

-- Leader+w to save
vim.keymap.set('n', '<Leader>w', '<Cmd>write<CR>', { noremap = true })

-- Leader+q to quit (show dialog if there are unsaved files)
vim.keymap.set('n', '<Leader>q', '<Cmd>confirm qall<CR>', { noremap = true })

-- Leader+z to save and quit
vim.keymap.set('n', '<Leader>z', '<Cmd>wqall<CR>', { noremap = true })

-- ============================================
-- Register & Clipboard Operations
-- ============================================

-- Set register prefix to Leader+r
vim.keymap.set('n', '<Leader>r', '"', { noremap = true })
vim.keymap.set('x', '<Leader>r', '"', { noremap = true })

-- Leader+S for substitute command
vim.keymap.set('n', '<Leader>S', [[:%s/<C-r>///g<Left><Left>]], { noremap = true })

-- + as clipboard yank operator
vim.keymap.set('n', '+', '"+y', { noremap = true })
vim.keymap.set('n', '++', '"+yy', { noremap = true })
vim.keymap.set('x', '+', '"+y', { noremap = true })

-- Operator+x to copy current filename to clipboard
vim.keymap.set('n', '+x', function()
  vim.fn.system('pbcopy', vim.fn.expand('%:t:r'))
end, { noremap = true, silent = true })

vim.keymap.set('n', '+X', function()
  vim.fn.system('pbcopy', vim.fn.expand('%'))
end, { noremap = true, silent = true })

-- Leader+a to select all
vim.keymap.set('n', '<Leader>a', 'ggVG', { noremap = true })

-- ============================================
-- Editing Operations
-- ============================================

-- x to delete without storing in register
vim.keymap.set('n', 'x', '"_x', { noremap = true })
vim.keymap.set('x', 'x', '"_x', { noremap = true })

-- gJ to join lines and remove leading whitespace
vim.keymap.set('n', 'gJ', [[mz:<C-u>+1s/^\s\+//e<CR>`zgJ]], { noremap = true, silent = true })
vim.keymap.set('x', 'gJ', [[:s/^\s\+//e<CR>gvgJ]], { noremap = true, silent = true })

-- ctrl+d to delete buffer
vim.keymap.set('n', '<C-d>', '<Cmd>bdelete<CR>', { noremap = true, silent = true })

-- ============================================
-- Window Operations
-- ============================================

-- Set window prefix to s
vim.keymap.set('n', 's', '<C-w>', { noremap = true })

-- Split window and move focus
vim.keymap.set('n', 'sv', '<C-w>v<C-w>w', { noremap = true })
vim.keymap.set('n', 'ss', '<C-w>s<C-w>w', { noremap = true })

-- sN for vnew
vim.keymap.set('n', 'sN', '<Cmd>vnew<CR>', { noremap = true })

-- ============================================
-- Yank & Paste Operations
-- ============================================

-- Y to yank from cursor position to end of line
vim.keymap.set('n', 'Y', 'y$', { noremap = true })

-- ctrl-j/k to insert blank line above/below and return to original position
vim.keymap.set('n', '<C-j>', [[mzo<Esc>"_cc<Esc>`z]], { noremap = true })
vim.keymap.set('n', '<C-k>', [[mzO<Esc>"_cc<Esc>`z]], { noremap = true })

-- g + yank to move to end of yanked range
vim.keymap.set('n', 'gyy', 'yy`]', { noremap = true })
vim.keymap.set('x', 'gy', 'y`>', { noremap = true })

-- gp to paste and move cursor one line up
vim.keymap.set('n', 'gp', 'gpk', { noremap = true })

-- ctrl+p to paste on that line
vim.keymap.set('n', '<C-p>', 'Vp', { noremap = false })

-- Execute . command on selected range
vim.keymap.set('x', '.', ':normal .<CR>', { noremap = true, silent = true })

-- ============================================
-- Cursor Movement
-- ============================================

-- Move cursor by display line instead of logical line
vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })
vim.keymap.set('n', '^', 'g^', { noremap = true })
vim.keymap.set('n', '$', 'g$', { noremap = true })

-- ============================================
-- Emacs Keybindings
-- ============================================

-- Insert mode
vim.keymap.set('i', '<C-b>', '<Left>', { noremap = true })
vim.keymap.set('i', '<C-f>', '<Right>', { noremap = true })

-- Command mode
vim.keymap.set('c', '<C-p>', '<Up>', { noremap = true })
vim.keymap.set('c', '<C-n>', '<Down>', { noremap = true })
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true })
vim.keymap.set('c', '<C-f>', '<Right>', { noremap = true })
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true })
vim.keymap.set('c', '<C-e>', '<End>', { noremap = true })
vim.keymap.set('c', '<C-k>', [[\/]], { noremap = true })

-- ============================================
-- Register Operations
-- ============================================

-- <ctrl+r>*2 for unnamed register
vim.keymap.set('i', '<C-r><C-r>', '<C-r>"', { noremap = true })
vim.keymap.set('c', '<C-r><C-r>', '<C-r>"', { noremap = true })
vim.keymap.set('t', '<C-r><C-r>', '<Esc>pi', { noremap = false })

-- ============================================
-- Plugin-related Keymaps
-- ============================================

-- ToggleTerm
vim.keymap.set('n', '<Leader>tt', ':ToggleTerm<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>tg', ':lua _LAZYGIT_TOGGLE()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>td', ':lua _LAZYDOCKER_TOGGLE()<CR>', { noremap = true, silent = true })

-- diffview
vim.keymap.set('n', '<Leader><C-G><C-G>', ':DiffOpen<CR>', { noremap = true })

-- hlslens has a bug
vim.keymap.set('n', 'n', '/<CR>', { noremap = true })

-- * to search word under cursor without jumping
vim.keymap.set('n', '*', '*N', { noremap = true, silent = true })

-- ============================================
-- Advanced Functions
-- ============================================

-- Visual mode paste without storing deleted string in register
local restore_reg = nil

local function restore_register()
  vim.fn.setreg('"', restore_reg)
  return ''
end

local function repl()
  restore_reg = vim.fn.getreg('"')
  return "p@=luaeval('require([[config.keymaps]]).restore_register()')\\<cr>"
end

vim.keymap.set('v', 'p', repl, { expr = true, silent = true })

-- Export function for use in expression mapping
return {
  restore_register = restore_register
}
