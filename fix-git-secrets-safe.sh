#!/bin/bash
# Script an toàn để fix secret
echo "🛡️ Bắt đầu fix secret an toàn..."

# 1. Backup branch hiện tại
echo "💾 Backup branch hiện tại..."
git branch backup-with-secrets

# 2. Reset về commit sạch
echo "🔄 Reset về commit sạch..."
git reset --hard 766ad698

# 3. Thêm file SQL sạch
echo "📁 Thêm file SQL sạch..."
git add database/velmora_jewelry.sql

# 4. Commit mới
echo "💾 Commit mới không có secret..."
git commit -m "feat: add clean database dump for Velmora Jewelry

- Added velmora_jewelry.sql database dump
- Removed all sensitive data and secrets
- Clean version without OAuth tokens
- Date: 2026-05-07 17:07:45"

# 5. Test push dry-run
echo "🧪 Test push dry-run..."
git push --dry-run origin main

# 6. Hỏi người dùng
echo "❓ Bạn có muốn force push không? (y/n)"
read -r response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "📤 Force push..."
    git push --force-with-lease origin main
    echo "✅ Hoàn thành!"
else
    echo "❌ Đã hủy force push"
    echo "🔄 Bạn có thể restore: git checkout backup-with-secrets"
fi
