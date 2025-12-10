-- ============================================
-- Basic Keymaps
-- ============================================

-- ctrl+l for escape
-- snoremap is used when using snippets
vim.keymap.set('i', '<C-l>', '<Esc>', { noremap = true, desc = 'Exit insert mode' })
vim.keymap.set('c', '<C-l>', '<C-c>', { noremap = true, desc = 'Cancel command mode' })
vim.keymap.set('v', '<C-l>', '<Esc>', { noremap = true, desc = 'Exit visual mode' })
vim.keymap.set('s', '<C-l>', '<Esc>', { noremap = true, desc = 'Exit select mode' })
vim.keymap.set('o', '<C-l>', '<Esc>', { noremap = true, desc = 'Exit operator pending mode' })
vim.keymap.set('l', '<C-l>', '<Esc>', { noremap = true, desc = 'Exit language mode' })

-- ctrl+l to exit terminal mode
vim.keymap.set('t', '<C-l>', [[<C-\><C-n>]], { noremap = true, desc = 'Exit terminal mode' })

-- ctrl+l to disable search highlight and redraw
vim.keymap.set('n', '<C-l>', '<Cmd>nohlsearch<CR><C-l>', { noremap = true, silent = true, desc = 'Clear search highlight and redraw screen' })

-- ============================================
-- File Operations
-- ============================================

-- Leader+w to save
vim.keymap.set('n', '<Leader>w', '<Cmd>write<CR>', { noremap = true, desc = 'Save file' })

-- Leader+q to quit (show dialog if there are unsaved files)
vim.keymap.set('n', '<Leader>q', '<Cmd>confirm qall<CR>', { noremap = true, desc = 'Quit all windows (confirm if unsaved files)' })

-- Leader+z to save and quit
vim.keymap.set('n', '<Leader>z', '<Cmd>wqall<CR>', { noremap = true, desc = 'Save all files and quit' })

-- ============================================
-- Register & Clipboard Operations
-- ============================================

-- Set register prefix to Leader+r
vim.keymap.set('n', '<Leader>r', '"', { noremap = true, desc = 'Register prefix' })
vim.keymap.set('x', '<Leader>r', '"', { noremap = true, desc = 'Register prefix' })

-- Leader+S for substitute command
vim.keymap.set('n', '<Leader>S', [[:%s/<C-r>///g<Left><Left>]], { noremap = true, desc = 'Start substitute command' })

-- + as clipboard yank operator
vim.keymap.set('n', '+', '"+y', { noremap = true, desc = 'Yank to clipboard' })
vim.keymap.set('n', '++', '"+yy', { noremap = true, desc = 'Yank current line to clipboard' })
vim.keymap.set('x', '+', '"+y', { noremap = true, desc = 'Yank selection to clipboard' })

-- Operator+x to copy current filename to clipboard
vim.keymap.set('n', '+x', function()
  vim.fn.system('pbcopy', vim.fn.expand('%:t:r'))
end, { noremap = true, silent = true, desc = 'Copy filename (without extension) to clipboard' })

vim.keymap.set('n', '+X', function()
  vim.fn.system('pbcopy', vim.fn.expand('%'))
end, { noremap = true, silent = true, desc = 'Copy filename (with extension) to clipboard' })

-- Leader+a to select all
-- vim.keymap.set('n', '<Leader>a', 'ggVG', { noremap = true, desc = 'Select entire file' })

-- ============================================
-- Editing Operations
-- ============================================

-- x to delete without storing in register
vim.keymap.set('n', 'x', '"_x', { noremap = true, desc = 'Delete character (without saving to register)' })
vim.keymap.set('x', 'x', '"_x', { noremap = true, desc = 'Delete selection (without saving to register)' })

-- gJ to join lines and remove leading whitespace
vim.keymap.set('n', 'gJ', [[mz:<C-u>+1s/^\s\+//e<CR>`zgJ]], { noremap = true, silent = true, desc = 'Join lines and remove leading whitespace' })
vim.keymap.set('x', 'gJ', [[:s/^\s\+//e<CR>gvgJ]], { noremap = true, silent = true, desc = 'Join selected lines and remove leading whitespace' })

-- ctrl+d to delete buffer
vim.keymap.set('n', '<Leader>d', '<Cmd>bdelete<CR>', { noremap = true, silent = true, desc = 'Delete buffer' })

-- ============================================
-- Window Operations
-- ============================================

-- Set window prefix to s
vim.keymap.set('n', 's', '<C-w>', { noremap = true, desc = 'Window operation prefix' })

-- Split window and move focus
vim.keymap.set('n', 'sv', '<C-w>v<C-w>w', { noremap = true, desc = 'Split window vertically and move' })
vim.keymap.set('n', 'ss', '<C-w>s<C-w>w', { noremap = true, desc = 'Split window horizontally and move' })

-- sN for vnew
vim.keymap.set('n', 'sN', '<Cmd>vnew<CR>', { noremap = true, desc = 'Open new vertical split window' })

-- ============================================
-- Yank & Paste Operations
-- ============================================

-- Y to yank from cursor position to end of line
vim.keymap.set('n', 'Y', 'y$', { noremap = true, desc = 'Yank from cursor to end of line' })

-- ctrl+j/k to insert blank line above/below and return to original position
vim.keymap.set('n', '<C-j>', [[mzo<Esc>"_cc<Esc>`z]], { noremap = true, desc = 'Insert blank line below and return to original position' })
vim.keymap.set('n', '<C-k>', [[mzO<Esc>"_cc<Esc>`z]], { noremap = true, desc = 'Insert blank line above and return to original position' })

-- g + yank to move to end of yanked range
vim.keymap.set('n', 'gyy', 'yy`]', { noremap = true, desc = 'Yank line and move to end of yanked range' })
vim.keymap.set('x', 'gy', 'y`>', { noremap = true, desc = 'Yank selection and move to end of yanked range' })

-- gp to paste and move cursor one line up
vim.keymap.set('n', 'gp', 'gpk', { noremap = true, desc = 'Paste and move cursor one line up' })

-- ctrl+p to paste on that line
vim.keymap.set('n', '<C-p>', 'Vp', { noremap = false, desc = 'Select current line and paste' })

-- Execute . command on selected range
vim.keymap.set('x', '.', ':normal .<CR>', { noremap = true, silent = true, desc = 'Execute last command on selected range' })

-- ============================================
-- Cursor Movement
-- ============================================

-- Move cursor by display line instead of logical line
vim.keymap.set('n', 'j', 'gj', { noremap = true, desc = 'Move down by display line' })
vim.keymap.set('n', 'k', 'gk', { noremap = true, desc = 'Move up by display line' })
vim.keymap.set('n', '^', 'g^', { noremap = true, desc = 'Move to beginning of display line' })
vim.keymap.set('n', '$', 'g$', { noremap = true, desc = 'Move to end of display line' })

-- ============================================
-- Emacs Keybindings
-- ============================================

-- Insert mode
vim.keymap.set('i', '<C-b>', '<Left>', { noremap = true, desc = 'Move left (Emacs style)' })
vim.keymap.set('i', '<C-f>', '<Right>', { noremap = true, desc = 'Move right (Emacs style)' })

-- Command mode
vim.keymap.set('c', '<C-p>', '<Up>', { noremap = true, desc = 'Move up in command history (Emacs style)' })
vim.keymap.set('c', '<C-n>', '<Down>', { noremap = true, desc = 'Move down in command history (Emacs style)' })
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true, desc = 'Move left (Emacs style)' })
vim.keymap.set('c', '<C-f>', '<Right>', { noremap = true, desc = 'Move right (Emacs style)' })
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true, desc = 'Move to beginning of line (Emacs style)' })
vim.keymap.set('c', '<C-e>', '<End>', { noremap = true, desc = 'Move to end of line (Emacs style)' })
vim.keymap.set('c', '<C-k>', [[\/]], { noremap = true, desc = 'Delete from cursor to end of line (Emacs style)' })

-- ============================================
-- Register Operations
-- ============================================

-- <ctrl+r>*2 for unnamed register
vim.keymap.set('i', '<C-r><C-r>', '<C-r>"', { noremap = true, desc = 'Insert from unnamed register' })
vim.keymap.set('c', '<C-r><C-r>', '<C-r>"', { noremap = true, desc = 'Insert from unnamed register' })
vim.keymap.set('t', '<C-r><C-r>', '<Esc>pi', { noremap = false, desc = 'Insert from unnamed register' })

-- ============================================
-- Plugin-related Keymaps
-- ============================================

-- ToggleTerm
vim.keymap.set('n', '<Leader>tt', ':ToggleTerm<CR>', { noremap = true, silent = true, desc = 'Toggle terminal' })
vim.keymap.set('n', '<Leader>tg', ':lua _LAZYGIT_TOGGLE()<CR>', { noremap = true, silent = true, desc = 'Toggle LazyGit' })
vim.keymap.set('n', '<Leader>td', ':lua _LAZYDOCKER_TOGGLE()<CR>', { noremap = true, silent = true, desc = 'Toggle LazyDocker' })

-- diffview
vim.keymap.set('n', '<Leader><C-G><C-G>', ':DiffOpen<CR>', { noremap = true, desc = 'Open DiffView' })

-- hlslens has a bug
vim.keymap.set('n', 'n', '/<CR>', { noremap = true, desc = 'Move to next search result' })

-- * to search word under cursor without jumping
vim.keymap.set('n', '*', '*N', { noremap = true, silent = true, desc = 'Search word under cursor (without jumping)' })

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

vim.keymap.set('v', 'p', repl, { expr = true, silent = true, desc = 'Paste (without saving deleted text to register)' })

-- Export function for use in expression mapping
return {
  restore_register = restore_register
}
