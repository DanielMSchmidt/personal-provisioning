# Open Repo
alias repo="gh repo view --web"
# Open PR
alias pr="gh pr view --web"
# PR Copy URL
alias prc="gh pr view --json url | jq -r '.url' | pbcopy"
