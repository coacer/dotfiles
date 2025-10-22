# =============================================================================
# FZF Configuration for Fish
# Migrated from zsh/.zsh.d/fzf.zsh
# =============================================================================

# --------------------------------------------------
# FZF Environment Variables
# --------------------------------------------------

# Default options
set -gx FZF_DEFAULT_OPTS "--reverse --margin=1,3 --inline-info --prompt='Search: ' --preview 'bat --color=always --style=header,grid --line-range :100 {}' --color=fg+:85,bg+:23,fg:247"

# Directory preview with tree
set -gx FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200'"

# Default command - show hidden files
set -gx FZF_DEFAULT_COMMAND "find . -path '*/\\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"

# --------------------------------------------------
# FZF Key Bindings
# --------------------------------------------------

# Source fzf key bindings if available
if test -f ~/.fzf.fish
    source ~/.fzf.fish
else if test -f /opt/homebrew/opt/fzf/shell/key-bindings.fish
    source /opt/homebrew/opt/fzf/shell/key-bindings.fish
end

# --------------------------------------------------
# Custom FZF Functions
# --------------------------------------------------

# fd: Fast directory navigation with fzf
function fd --description 'Fast directory navigation with fzf'
    set -l dir (find (test (count $argv) -gt 0; and echo $argv[1]; or echo .) -path '*/\\.*' -prune -o -type d -print 2> /dev/null | fzf +m)
    and cd $dir
end

# fbr: Git branch checkout with fzf
function fbr --description 'Git branch checkout with fzf'
    set -l branches (git --no-pager branch -vv 2>/dev/null)
    if test $status -eq 0
        set -l branch (echo $branches | fzf +m)
        if test -n "$branch"
            set -l branch_name (echo $branch | awk '{print $1}' | sed 's/.* //')
            git checkout $branch_name
        end
    else
        echo "Not a git repository"
        return 1
    end
end
