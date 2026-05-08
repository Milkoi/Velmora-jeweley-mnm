#!/bin/bash
# Script để xóa commits có secret và tạo lại
echo "🚀 Bắt đầu fix secret trong commits..."

# 1. Reset về commit trước khi có secret
echo "🔄 Reset về commit sạch..."
git reset --hard 766ad698

# 2. Thêm file SQL sạch
echo "📁 Thêm file SQL sạch..."
git add database/velmora_jewelry.sql

# 3. Commit mới không có secret
echo "💾 Commit mới không có secret..."
git commit -m "feat: add clean database dump for Velmora Jewelry

- Added velmora_jewelry.sql database dump
- Removed all sensitive data and secrets
- Clean version without OAuth tokens
- Date: 2026-05-07 17:07:45"

# 4. Force push
echo "📤 Force push để ghi đè commits cũ..."
git push --force-with-lease origin main

# 5. Kiểm tra kết quả
echo "✅ Hoàn thành!"
git log --oneline -3
