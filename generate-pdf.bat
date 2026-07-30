@echo off
REM =============================================================================
REM The Habit OS - PDF Generation Script (Windows)
REM =============================================================================
REM This script generates the PDF version of "The Habit OS: Build a Life That 
REM Runs on Great Habits" from the markdown source files.
REM 
REM Usage: generate-pdf.bat
REM 
REM Author: MD Iqbal Bajmi
REM Date: July 29, 2026
REM Repository: https://github.com/iqbalatvideogen-png/the-habit-os
REM =============================================================================

echo ===========================================
echo The Habit OS - PDF Generation Script (Windows)
echo ===========================================
echo.

REM Check if we are in the correct directory
if not exist package.json (
    echo ERROR: Not in the project root directory.
    echo Please cd to the-habit-os directory first.
    pause
    exit /b 1
)

echo Working directory: %cd%
echo.

REM Check for Node.js
where node >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo ERROR: Node.js is not installed.
    echo Please install Node.js (version 14 or higher) from https://nodejs.org/
    pause
    exit /b 1
)

for /f "delims=" %%v in ('node -v') do set NODE_VERSION=%%v
echo Node.js version: %NODE_VERSION%
echo.

REM Check for npm
where npm >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo ERROR: npm is not installed.
    echo npm is typically installed with Node.js.
    pause
    exit /b 1
)

for /f "delims=" %%v in ('npm -v') do set NPM_VERSION=%%v
echo npm version: %NPM_VERSION%
echo.

REM Install dependencies
echo Installing dependencies...
if exist node_modules (
    echo node_modules directory exists. Skipping installation.
    echo To force reinstall, delete node_modules and package-lock.json
) else (
    npm install
    if %ERRORLEVEL% neq 0 (
        echo ERROR: Failed to install dependencies
        echo Check the error messages above for details
        pause
        exit /b 1
    )
    echo Dependencies installed successfully
)
echo.

REM Check if PDF generation script exists
if not exist scriptsgenerate-pdf.js (
    echo ERROR: PDF generation script not found at scripts/generate-pdf.js
    pause
    exit /b 1
)

echo PDF generation script found
echo.

REM Create output directory
if not exist dist (
    mkdir dist
    echo Created dist/ directory
) else (
    echo dist/ directory already exists
)
echo.

REM Run PDF generation
echo Generating PDF...
echo This may take several minutes for a book of this size
echo.

npm run generate-pdf
if %ERRORLEVEL% neq 0 (
    echo.
    echo ERROR: PDF generation failed
    echo Check the error messages above for details
    pause
    exit /b 1
)

echo.
echo ===========================================
echo PDF GENERATION COMPLETE!
echo ===========================================
echo.
echo Output file: dist	he-habit-os.pdf
echo.
echo Next steps:
echo 1. Review the PDF: open dist	he-habit-os.pdf
echo 2. Check for any formatting issues
echo 3. Replace SVG assets with PNG if needed
echo 4. Publish your book!
echo.
pause
