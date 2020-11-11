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
      \      "filetypes": ["terraform"],
      \      "initializationOptions": {}
      \    },
      \    "dls": {
      \      "command": "diagnostic-languageserver",
      \      "args": [ "--stdio" ],
      \      "filetypes": [ "php" ],
      \      "initializationOptions": {
      \        "linters": {
      \          "phpcs": {
      \            "command": "./vendor/bin/phpcs",
      \            "debounce": 100,
      \            "rootPatterns": [ "composer.json", "composer.lock", "vendor", ".git" ],
      \            "args": [ "--standard=PSR2", "--report=emacs", "-s", "-" ],
      \            "offsetLine": 0,
      \            "offsetColumn": 0,
      \            "sourceName": "phpcs",
      \            "formatLines": 1,
      \            "formatPattern": [
      \              "^.*:(\\d+):(\\d+):\\s+(.*)\\s+-\\s+(.*)$",
      \              {
      \                "line": 1,
      \                "column": 2,
      \                "message": 4,
      \                "security": 3
      \              }
      \            ],
      \            "securities": {
      \              "error": "error",
      \              "warning": "warning"
      \            }
      \          }
      \        },
      \        "filetypes": {
      \          "php": "phpcs"
      \        }
      \      }
      \    }
      \  }
      \}
