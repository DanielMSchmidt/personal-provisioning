set -x GOPRIVATE github.com/mesosphere
set -x GONOPROXY github.com/mesosphere
set -x GONOSUMDB github.com/mesosphere
set -x GOPATH /Users/danielschmidt/go
# set -x GOBIN $GOPATH/bin

set -x PATH /usr/local/opt/go/libexec/bin $PATH
# set -x PATH $GOBIN $PATH

contains /usr/local/opt/go/libexec/bin $PATH; or set -Ua PATH /usr/local/opt/go/libexec/bin
# contains $GOBIN $PATH; or set -Ua PATH $GOBIN
