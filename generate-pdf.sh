#!/bin/bash

# The Habit OS - PDF Generation Script
# This script generates the PDF version of The Habit OS book
# Usage: ./generate-pdf.sh
# Author: MD Iqbal Bajmi
# Date: July 29, 2026

echo "=========================================="
echo "The Habit OS - PDF Generation Script"
echo "=========================================="
echo ""

# Check if we are in the correct directory
if [ ! -f "package.json" ]; then
    echo "ERROR: Not in the project root directory."
    echo "Please cd to the-habit-os directory first."
    exit 1
fi

echo "Working directory: $(pwd)"
echo ""

# Check for Node.js
echo "Checking Node.js installation..."
if ! command -v node >/dev/null 2>&1; then
    echo "ERROR: Node.js is not installed."
    echo "Please install Node.js (version 14 or higher) from https://nodejs.org/"
    exit 1
fi

echo "Node.js version: $(node -v)"
echo ""

# Check for npm
echo "Checking npm installation..."
if ! command -v npm >/dev/null 2>&1; then
    echo "ERROR: npm is not installed."
    echo "npm is typically installed with Node.js."
    exit 1
fi

echo "npm version: $(npm -v)"
echo ""

# Install dependencies
echo "Installing dependencies..."
if [ -d "node_modules" ]; then
    echo "node_modules directory exists. Skipping installation."
    echo "To force reinstall, delete node_modules and package-lock.json"
else
    if npm install; then
        echo "Dependencies installed successfully"
    else
        echo "ERROR: Failed to install dependencies"
        echo "Check the error messages above for details"
        exit 1
    fi
fi
echo ""

# Check if PDF generation script exists
echo "Checking PDF generation script..."
if [ ! -f "scripts/generate-pdf.js" ]; then
    echo "ERROR: PDF generation script not found at scripts/generate-pdf.js"
    exit 1
fi

echo "PDF generation script found"
echo ""

# Create output directory
if [ ! -d "dist" ]; then
    mkdir -p dist
    echo "Created dist/ directory"
else
    echo "dist/ directory already exists"
fi
echo ""

# Run PDF generation
echo "Generating PDF..."
echo "This may take several minutes for a book of this size"
echo ""

if npm run generate-pdf; then
    echo ""
    echo "=========================================="
    echo "PDF GENERATION COMPLETE!"
    echo "=========================================="
    echo ""
    echo "Output file: dist/the-habit-os.pdf"
    echo ""
    echo "Next steps:"
    echo "1. Review the PDF: open dist/the-habit-os.pdf"
    echo "2. Check for any formatting issues"
    echo "3. Replace SVG assets with PNG if needed"
    echo "4. Publish your book!"
    echo ""
else
    echo ""
    echo "ERROR: PDF generation failed"
    echo "Check the error messages above for details"
    exit 1
fi
