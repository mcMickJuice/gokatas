.PHONY: gokatas updatekatas build clean help

# Default target
help:
	@echo "Available targets:"
	@echo "  make gokatas [ARGS=...]        - Run gokatas with optional arguments"
	@echo "  make updatekatas [ARGS=...]    - Run updatekatas with optional arguments"
	@echo "  make build                     - Build both binaries"
	@echo "  make gokatas-build             - Build gokatas binary"
	@echo "  make updatekatas-build         - Build updatekatas binary"
	@echo "  make clean                     - Remove built binaries"
	@echo ""
	@echo "Examples:"
	@echo "  make gokatas"
	@echo "  make gokatas ARGS=\"-verbose\""
	@echo "  make updatekatas ARGS=\"-dry-run\""

# Run gokatas with optional arguments
gokatas:
	go run ./cmd/gokatas $(ARGS)

# Run updatekatas with optional arguments
updatekatas:
	go run ./cmd/updatekatas $(ARGS)

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
