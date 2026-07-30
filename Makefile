# Makefile for The Habit OS
# Author: MD Iqbal Bajmi
# Date: July 29, 2026
# Repository: https://github.com/iqbalatvideogen-png/the-habit-os

.PHONY: help pdf clean install

# Default target
help:
	@echo "The Habit OS - Makefile"
	@echo "======================="
	@echo ""
	@echo "Available targets:"
	@echo "  pdf      - Generate PDF version of the book"
	@echo "  install  - Install Node.js dependencies"
	@echo "  clean    - Remove generated files"
	@echo "  help     - Show this help message"
	@echo ""

# Generate PDF
pdf: install
	@echo "Generating PDF..."
	@npm run generate-pdf
	@echo ""
	@echo "PDF generated at: dist/the-habit-os.pdf"

# Install dependencies
install:
	@echo "Installing dependencies..."
	@npm install
	@echo "Dependencies installed"

# Clean generated files
clean:
	@echo "Cleaning generated files..."
	@rm -rf dist/
	@rm -rf node_modules/
	@rm -f package-lock.json
	@echo "Cleaned"
