#!/bin/bash
# Script tự động fix git sync issues
echo "🚀 Bắt đầu fix git sync..."

# 1. Kiểm tra status
echo "📋 Kiểm tra status:"
git status

# 2. Thêm tất cả files
echo "📁 Thêm files:"
git add .

# 3. Commit
echo "💾 Commit:"
git commit -m "Fix git sync issues and clean database file

- Removed secrets from SQL file
- Added .gitignore for sensitive files
- Fixed authentication issues
- Date: 2026-05-07 17:04:54"

# 4. Kiểm tra remote
echo "🌐 Kiểm tra remote:"
git remote -v

# 5. Push
echo "📤 Push:"
git push origin main

# 6. Kiểm tra kết quả
echo "✅ Hoàn thành!"
