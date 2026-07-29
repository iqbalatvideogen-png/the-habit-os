#!/usr/bin/env node
/**
 * The Habit OS - PDF Generation Script
 * Converts markdown to beautiful PDF
 */

const fs = require('fs');
const path = require('path');
const puppeteer = require('puppeteer');
const marked = require('marked');

async function main() {
  const browser = await puppeteer.launch({ headless: true });
  const page = await browser.newPage();
  
  const bookDir = path.join(__dirname, '..', 'book');
  const files = [];
  
  function walkDir(dir) {
    const entries = fs.readdirSync(dir);
    for (const entry of entries) {
      const fullPath = path.join(dir, entry);
      if (fs.statSync(fullPath).isDirectory()) {
        walkDir(fullPath);
      } else if (entry.endsWith('.md')) {
        files.push(fullPath);
      }
    }
  }
  
  walkDir(bookDir);
  files.sort();
  
  let html = '<!DOCTYPE html><html><head><meta charset="UTF-8"><title>The Habit OS</title>';
  html += '<style>body{font-family:Inter,sans-serif;line-height:1.6;color:#2c3e50;max-width:800px;margin:0 auto;padding:2rem}h1,h2,h3{color:#2c3e50;font-weight:700}a{color:#4e79a7;text-decoration:none}code{font-family:Fira Code,monospace;background:#f1f5f9;padding:.2rem .4rem;border-radius:.375rem}pre{background:#1e293b;color:#e2e8f0;padding:1rem;border-radius:.5rem;overflow-x:auto}blockquote{border-left:4px solid #4e79a7;padding-left:1rem;margin-left:0;color:#64748b;font-style:italic}table{width:100%;border-collapse:collapse;margin:1rem 0}th,td{padding:.75rem;border:1px solid #e2e8f0;text-align:left}th{background:#f1f5f9;font-weight:600}.alert{padding:1rem;border-radius:.5rem;margin:1rem 0;border-left:4px solid}.alert-primary{background:#eff6ff;border-color:#4e79a7}.alert-success{background:#f0fdf4;border-color:#59a14f}.alert-warning{background:#fef2f2;border-color:#e15759}.alert-info{background:#f0fdfa;border-color:#76b7b2}@page{size:A4;margin:20mm}</style>';
  html += '</head><body><h1 style="text-align:center;color:#4e79a7">The Habit OS</h1>';
  html += '<p style="text-align:center;color:#64748b">Build a Life That Runs on Great Habits</p>';

  for (const file of files) {
    const markdown = fs.readFileSync(file, 'utf8');
    const relativePath = path.relative(bookDir, file);
    const chapterName = relativePath.replace(/\.md$/, '').replace(/\//g, '-');
    html += '<section id="' + chapterName + '">';
    html += marked(markdown);
    html += '</section><div style="page-break-after:always"></div>';
  }

  html += '<div style="text-align:center;margin-top:2rem;color:#64748b"><p>Generated: ' + new Date().toLocaleDateString() + '</p><p>Licensed under CC BY-NC-SA 4.0</p></div>';
  html += '</body></html>';

  await page.setContent(html);
  await page.pdf({
    path: path.join(__dirname, '..', 'the-habit-os.pdf'),
    format: 'A4',
    margin: { top: '20mm', right: '20mm', bottom: '20mm', left: '20mm' },
    printBackground: true
  });

  await browser.close();
  console.log('PDF generated: the-habit-os.pdf');
}

main().catch(console.error);