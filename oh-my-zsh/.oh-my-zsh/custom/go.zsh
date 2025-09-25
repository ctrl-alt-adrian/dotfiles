# -----------------------------
# 🐹 Golang Aliases
# -----------------------------

# Run / Build
alias gor="go run"
alias gob="go build"
alias goba="go build ./..."
alias goi="go install"

# Test
alias got="go test"
alias gota="go test ./..."
alias gotv="go test -v"
alias gotf="go test -failfast"
alias gotc="go test -cover"
alias gotcf="go test -coverprofile=coverage.out"
alias gotr="go test -race ./..."

# Modules
alias gom="go mod"
alias gomt="go mod tidy"
alias gomi="go mod init"
alias gomu="go get -u ./..."
alias gomv="go mod vendor"

# Lint / Fmt / Vet
alias gofmt="go fmt ./..."
alias govet="go vet ./..."
alias golint="golangci-lint run"

# Misc
alias goenvv="go env"
alias gov="go version"
alias gop="go doc"     # quick docs
alias gopath="echo $GOPATH"

# -----------------------------
# ⚡ Combined Helpers
# -----------------------------

# Run tests and show only FAIL
alias gotfail="go test -p 1 ./... | grep FAIL"

# Clean and rebuild everything
alias goclean="go clean -modcache && go build ./..."

# Benchmark all tests
alias gobench="go test -bench=. ./..."

