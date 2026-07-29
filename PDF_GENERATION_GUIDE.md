# PDF Generation Guide

## Quick Start

1. Clone the repository:
   git clone https://github.com/iqbalatvideogen-png/the-habit-os.git

2. Install dependencies:
   npm install

3. Generate PDF:
   npm run generate-pdf

## Output
PDF will be created in dist/the-habit-os.pdf

## Troubleshooting
- If npm install fails: Delete node_modules and package-lock.json, retry
- If script not found: Check package.json, ensure you are in correct directory
- If images missing: Verify image paths in markdown files

## Alternative Methods
- Pandoc: pandoc book/**/*.md -o output.pdf
- VS Code: Install Markdown PDF extension, export manually

## Customization
Edit assets/css/styles.css for styling changes
Edit scripts/generate-pdf.js for generation options

Last Updated: July 29, 2026