.PHONY: gokatas updatekatas build clean help

# Default target
help:
	@echo "Available targets:"
	@echo "  make gokatas [ARGS=...]        - Run gokatas with optional arguments"
	@echo "  make updatekatas [ARG ...]     - Run updatekatas with arguments for -k flag"
	@echo "  make build                     - Build both binaries"
	@echo "  make gokatas-build             - Build gokatas binary"
	@echo "  make updatekatas-build         - Build updatekatas binary"
	@echo "  make clean                     - Remove built binaries"
	@echo ""
	@echo "Examples:"
	@echo "  make gokatas"
	@echo "  make gokatas ARGS=\"-verbose\""
	@echo "  make updatekatas test"
	@echo "  make updatekatas test another_arg"

# Run gokatas with optional arguments
gokatas:
	go run ./cmd/gokatas $(ARGS)

# Run updatekatas with arguments forwarded to -k flag
updatekatas:
	go run ./cmd/updatekatas -k $(filter-out $@,$(MAKECMDGOALS))

# Catch-all rule to prevent make from complaining about extra arguments
%:
	@:

# Build both binaries
build: gokatas-build updatekatas-build

# Build gokatas binary
gokatas-build:
	go build -o bin/gokatas ./cmd/gokatas

# Build updatekatas binary
updatekatas-build:
	go build -o bin/updatekatas ./cmd/updatekatas

# Clean up built binaries
clean:
	rm -rf bin/
