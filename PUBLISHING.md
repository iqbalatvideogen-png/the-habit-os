# Publishing Guide for The Habit OS

> How to publish, share, and contribute to The Habit OS

---

## Publishing to GitHub

### Steps to Publish

1. **Initialize Git Repository**
   cd the-habit-os
   git init
   git add .
   git commit -m "Initial commit"

2. **Create GitHub Repository**
   - Go to github.com/new
   - Repository name: the-habit-os
   - Add description and choose visibility

3. **Connect and Push**
   git remote add origin https://github.com/username/the-habit-os.git
   git branch -M main
   git push -u origin main

---

## Repository Structure

Complete 13 parts with 51 chapters, 5 appendices, and supporting files.

---

## PDF Generation

### Generate PDF Locally

npm install
npm run generate-pdf

PDF will be created at: the-habit-os.pdf

---

## Update Process

1. Edit markdown files
2. Update documentation as needed
3. Test PDF generation
4. Commit and push changes

---

## Versioning

Semantic Versioning:
- MAJOR: Breaking changes
- MINOR: New chapters or major content
- PATCH: Bug fixes, minor updates

---

## Contact

- Author: MD Iqbal Bajmi
- GitHub: iqbalatvideogen-png/the-habit-os
- Email: contact@thehabitos.com