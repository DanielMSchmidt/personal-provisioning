## Terraform

# Execute local terraform binary
alias tfl="/Users/dschmidt/work/hashicorp/terraform/bin/terraform"
# Build terraform binary
alias tfb="cd /Users/dschmidt/work/hashicorp/terraform && go build -ldflags=\"-X 'main.experimentsAllowed=yes'\" -v -o bin/"
# Watch terraform binary build
alias tfw="cd /Users/dschmidt/work/hashicorp/terraform && gow -v -c build -v -ldflags=\"-X 'main.experimentsAllowed=yes'\" -o bin/"
# Open Terminal session for terraform
alias workOnTerraform="zellij action new-tab --layout ~/.config/zellij/layouts/terraform.kdl"

## Stacks

# Set my tf binary to the local one
set -x TFSTACKS_TERRAFORM_BINARY /Users/dschmidt/work/hashicorp/terraform/bin/terraform
# Execute local tfstacks binary
alias scli="/Users/dschmidt/work/hashicorp/terraform-stacks-cli/dist/tfstacks"
# Build tfstacks binary
alias sclib="cd /Users/dschmidt/work/hashicorp/terraform-stacks-cli && make build"
