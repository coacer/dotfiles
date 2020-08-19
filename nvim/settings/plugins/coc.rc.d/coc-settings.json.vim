" 'true'は'v:true'に書き換えることに注意
let g:coc_user_config = {
      \  "tsserver.enableJavascript": v:true,
      \  "eslint.filetypes": ["javascript", "typescript", "typescriptreact", "javascriptreact", "typescript.tsx"],
      \  "languageserver": {
      \    "golang": {
      \      "command": "gopls",
      \      "rootPatterns": ["go.mod", ".vim/", ".git/", ".hg/"],
      \      "filetypes": ["go"],
      \      "initializationOptions": {
      \        "usePlaceholders": v:true
      \      }
      \    },
      \    "terraform": {
      \      "command": "~/.bin/terraform-lsp",
      \      "filetypes": ["tf"],
      \      "initializationOptions": {}
      \    }
      \  }
      \}
