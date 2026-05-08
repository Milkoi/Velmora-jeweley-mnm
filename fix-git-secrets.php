<?php
// Fix secret issues trong commits cũ
echo "FIX SECRET ISSUES TRONG COMMITS CŨ\n";
echo "==================================\n\n";

echo "🔧 Đang tạo giải pháp cho secret trong commits cũ...\n";

// 1. Kiểm tra commits có vấn đề
echo "\n📋 Đang kiểm tra commits có vấn đề...\n";
$git_log = shell_exec('git log --oneline -5 2>&1');
echo "5 commits gần nhất:\n";
echo $git_log . "\n";

// 2. Tạo script để xóa commits có secret
echo "\n🗑️ Đang tạo script để xóa commits có secret...\n";

$fix_script = "#!/bin/bash\n";
$fix_script .= "# Script để xóa commits có secret và tạo lại\n";
$fix_script .= "echo \"🚀 Bắt đầu fix secret trong commits...\"\n\n";

$fix_script .= "# 1. Reset về commit trước khi có secret\n";
$fix_script .= "echo \"🔄 Reset về commit sạch...\"\n";
$fix_script .= "git reset --hard 766ad698\n\n";

$fix_script .= "# 2. Thêm file SQL sạch\n";
$fix_script .= "echo \"📁 Thêm file SQL sạch...\"\n";
$fix_script .= "git add database/velmora_jewelry.sql\n\n";

$fix_script .= "# 3. Commit mới không có secret\n";
$fix_script .= "echo \"💾 Commit mới không có secret...\"\n";
$fix_script .= "git commit -m \"feat: add clean database dump for Velmora Jewelry\n\n";
$fix_script .= "- Added velmora_jewelry.sql database dump\n";
$fix_script .= "- Removed all sensitive data and secrets\n";
$fix_script .= "- Clean version without OAuth tokens\n";
$fix_script .= "- Date: " . date('Y-m-d H:i:s') . "\"\n\n";

$fix_script .= "# 4. Force push\n";
$fix_script .= "echo \"📤 Force push để ghi đè commits cũ...\"\n";
$fix_script .= "git push --force-with-lease origin main\n\n";

$fix_script .= "# 5. Kiểm tra kết quả\n";
$fix_script .= "echo \"✅ Hoàn thành!\"\n";
$fix_script .= "git log --oneline -3\n";

file_put_contents('fix-git-secrets.sh', $fix_script);
echo "✅ Đã tạo fix-git-secrets.sh\n";

// 3. Tạo script an toàn hơn (interactive)
echo "\n🛡️ Đang tạo script an toàn hơn...\n";

$safe_script = "#!/bin/bash\n";
$safe_script .= "# Script an toàn để fix secret\n";
$safe_script .= "echo \"🛡️ Bắt đầu fix secret an toàn...\"\n\n";

$safe_script .= "# 1. Backup branch hiện tại\n";
$safe_script .= "echo \"💾 Backup branch hiện tại...\"\n";
$safe_script .= "git branch backup-with-secrets\n\n";

$safe_script .= "# 2. Reset về commit sạch\n";
$safe_script .= "echo \"🔄 Reset về commit sạch...\"\n";
$safe_script .= "git reset --hard 766ad698\n\n";

$safe_script .= "# 3. Thêm file SQL sạch\n";
$safe_script .= "echo \"📁 Thêm file SQL sạch...\"\n";
$safe_script .= "git add database/velmora_jewelry.sql\n\n";

$safe_script .= "# 4. Commit mới\n";
$safe_script .= "echo \"💾 Commit mới không có secret...\"\n";
$safe_script .= "git commit -m \"feat: add clean database dump for Velmora Jewelry\n\n";
$safe_script .= "- Added velmora_jewelry.sql database dump\n";
$safe_script .= "- Removed all sensitive data and secrets\n";
$safe_script .= "- Clean version without OAuth tokens\n";
$safe_script .= "- Date: " . date('Y-m-d H:i:s') . "\"\n\n";

$safe_script .= "# 5. Test push dry-run\n";
$safe_script .= "echo \"🧪 Test push dry-run...\"\n";
$safe_script .= "git push --dry-run origin main\n\n";

$safe_script .= "# 6. Hỏi người dùng\n";
$safe_script .= "echo \"❓ Bạn có muốn force push không? (y/n)\"\n";
$safe_script .= "read -r response\n";
$safe_script .= "if [[ \"\$response\" =~ ^([yY][eE][sS]|[yY])\$ ]]\n";
$safe_script .= "then\n";
$safe_script .= "    echo \"📤 Force push...\"\n";
$safe_script .= "    git push --force-with-lease origin main\n";
$safe_script .= "    echo \"✅ Hoàn thành!\"\n";
$safe_script .= "else\n";
$safe_script .= "    echo \"❌ Đã hủy force push\"\n";
$safe_script .= "    echo \"🔄 Bạn có thể restore: git checkout backup-with-secrets\"\n";
$safe_script .= "fi\n";

file_put_contents('fix-git-secrets-safe.sh', $safe_script);
echo "✅ Đã tạo fix-git-secrets-safe.sh\n";

// 4. Tạo lệnh thủ công
echo "\n📝 LỆNH THỦ CÔNG:\n";
echo "==================\n";
echo "# Option 1: Reset và tạo lại commits\n";
echo "git reset --hard 766ad698\n";
echo "git add database/velmora_jewelry.sql\n";
echo "git commit -m \"feat: add clean database dump for Velmora Jewelry\"\n";
echo "git push --force-with-lease origin main\n\n";

echo "# Option 2: Interactive (an toàn hơn)\n";
echo "bash fix-git-secrets-safe.sh\n\n";

echo "# Option 3: Xóa file SQL khỏi commits\n";
echo "git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch database/velmora_jewelry.sql' --prune-empty --tag-name-filter cat -- --all\n";
echo "git push --force-with-lease origin main\n\n";

// 5. Giải thích vấn đề
echo "\n📋 GIẢI THÍCH VẤN ĐỀ:\n";
echo "====================\n";
echo "❌ GitHub phát hiện secret trong commits cũ\n";
echo "❌ Không thể push khi có secret trong history\n";
echo "❌ Cần xóa hoặc sửa commits có secret\n\n";

echo "✅ Giải pháp:\n";
echo "1. Reset về commit trước khi có secret\n";
echo "2. Thêm file SQL sạch\n";
echo "3. Commit mới không có secret\n";
echo "4. Force push để ghi đè history\n\n";

echo "⚠️  Lưu ý:\n";
echo "- Force push sẽ thay đổi history\n";
echo "- Cần thông báo cho team nếu có\n";
echo "- Backup branch trước khi thực hiện\n\n";

echo "🎯 KHUYẾN NGHỊ:\n";
echo "================\n";
echo "Chạy: bash fix-git-secrets-safe.sh\n";
echo "Script này sẽ:\n";
echo "- Backup branch hiện tại\n";
echo "- Test push trước khi thực hiện\n";
echo "- Hỏi xác nhận trước khi force push\n\n";

echo "🌐 Repository:\n";
echo "https://github.com/Milkoi/Velmora-jeweley-mnm.git\n";
?>
