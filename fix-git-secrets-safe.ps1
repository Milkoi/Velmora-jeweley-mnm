# PowerShell script để fix secret trong commits cũ
Write-Host "🛡️ Bắt đầu fix secret an toàn..." -ForegroundColor Green

# 1. Backup branch hiện tại
Write-Host "💾 Backup branch hiện tại..." -ForegroundColor Yellow
git branch backup-with-secrets

# 2. Reset về commit sạch
Write-Host "🔄 Reset về commit sạch..." -ForegroundColor Yellow
git reset --hard 766ad698

# 3. Thêm file SQL sạch
Write-Host "📁 Thêm file SQL sạch..." -ForegroundColor Yellow
git add database/velmora_jewelry.sql

# 4. Commit mới
Write-Host "💾 Commit mới không có secret..." -ForegroundColor Yellow
git commit -m "feat: add clean database dump for Velmora Jewelry

- Added velmora_jewelry.sql database dump
- Removed all sensitive data and secrets
- Clean version without OAuth tokens
- Date: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

# 5. Test push dry-run
Write-Host "🧪 Test push dry-run..." -ForegroundColor Yellow
git push --dry-run origin main

# 6. Hỏi người dùng
Write-Host "❓ Bạn có muốn force push không? (y/n)" -ForegroundColor Cyan
$response = Read-Host

if ($response -match '^[yY]') {
    Write-Host "📤 Force push..." -ForegroundColor Green
    git push --force-with-lease origin main
    Write-Host "✅ Hoàn thành!" -ForegroundColor Green
    git log --oneline -3
} else {
    Write-Host "❌ Đã hủy force push" -ForegroundColor Red
    Write-Host "🔄 Bạn có thể restore: git checkout backup-with-secrets" -ForegroundColor Yellow
}
