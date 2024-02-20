# Execute local terraform binary
alias tfl="/Users/dschmidt/work/hashicorp/terraform/bin/terraform"
# Build terraform binary
alias tfb="cd /Users/dschmidt/work/hashicorp/terraform && go build -v -o bin/"
# Watch terraform binary build
alias tfw="cd /Users/dschmidt/work/hashicorp/terraform && gow -v -c build -v -o bin/"
# Open Terminal session for terraform
alias workOnTerraform="zellij action new-tab --layout ~/.config/zellij/layouts/terraform.kdl"
