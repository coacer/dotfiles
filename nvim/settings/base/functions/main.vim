" vim: foldmethod=marker

" カラースキームをプレビューしながら変更できる
command! ColorSchemeSelect Unite colorscheme -auto-preview

command! TodayNote execute 'edit /Users/nakagamiyuki/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Obsidian_Vault/02_DailyNotes/' . strftime('%Y-%m-%d') . '.md'
