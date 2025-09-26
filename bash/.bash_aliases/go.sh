# Golang aliases for Bash on Arch Linux

# Run / Build
alias gor='go run'
alias gob='go build'
alias goba='go build ./...'
alias goi='go install'

# Test
alias got='go test'
alias gota='go test ./...'
alias gotv='go test -v'
alias gotf='go test -failfast'
alias gotc='go test -cover'
alias gotcf='go test -coverprofile=coverage.out'
alias gotr='go test -race ./...'

# Modules
alias gom='go mod'
alias gomt='go mod tidy'
alias gomi='go mod init'
alias gomu='go get -u ./...'
alias gomv='go mod vendor'

# Lint / Fmt / Vet
alias gofmt='go fmt ./...'
alias govet='go vet ./...'
alias golint='golangci-lint run'

# Misc
alias goenvv='go env'
alias gov='go version'
alias gop='go doc'
alias gopath='echo "$GOPATH"'

# Combined Helpers
alias gotfail='go test -p 1 ./... | grep FAIL'
alias goclean='go clean -modcache && go build ./...'
alias gobench='go test -bench=. ./...'
