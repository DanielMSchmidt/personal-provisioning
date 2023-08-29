# Don't track me
set -x CHECKPOINT_DISABLE "true"

# helpers
alias cdktfl="/Users/danielschmidt/work/terraform-cdk/packages/cdktf-cli/bin/cdktf"
alias jestd="node --inspect-brk ./node_modules/jest/bin/jest.js"

# TFC related
alias tfc_user_bigdane="cp ~/.terraform.d/credentials.tfrc.bigdane.json ~/.terraform.d/credentials.tfrc.json"
alias tfc_user_danielschmidt="cp ~/.terraform.d/credentials.tfrc.danielschmidt.json ~/.terraform.d/credentials.tfrc.json"
