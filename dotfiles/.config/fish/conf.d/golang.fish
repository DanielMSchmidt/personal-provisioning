set -x NVM_DIR ~/.nvm

set -x GOPATH $HOME/go
set -x GOROOT "/usr/local/opt/go/libexec"
set -x PATH $PATH $GOPATH/bin $GOROOT/bin
