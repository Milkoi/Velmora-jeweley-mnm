<?php
// Kiểm tra vấn đề git sync và push
echo "KIỂM TRA VẤN ĐỀ GIT SYNC VÀ PUSH\n";
echo "=================================\n\n";

// 1. Kiểm tra git status
echo "🔍 Đang kiểm tra git status...\n";
$git_status = shell_exec('git status 2>&1');
echo "📋 Git status:\n";
echo $git_status . "\n";

// 2. Kiểm tra remote repository
echo "\n🌐 Đang kiểm tra remote repository...\n";
$git_remote = shell_exec('git remote -v 2>&1');
echo "📋 Remote repository:\n";
echo $git_remote . "\n";

// 3. Kiểm tra branch hiện tại
echo "\n🌿 Đang kiểm tra branch hiện tại...\n";
$git_branch = shell_exec('git branch -a 2>&1');
echo "📋 Branches:\n";
echo $git_branch . "\n";

// 4. Kiểm tra commits chờ push
echo "\n📤 Đang kiểm tra commits chờ push...\n";
$git_log = shell_exec('git log --oneline -5 2>&1');
echo "📋 5 commits gần nhất:\n";
echo $git_log . "\n";

// 5. Kiểm tra connection đến remote
echo "\n🔗 Đang kiểm tra connection đến remote...\n";
$git_remote_url = trim(shell_exec('git config --get remote.origin.url 2>&1'));
echo "📋 Remote URL: $git_remote_url\n";

// 6. Kiểm tra authentication
echo "\n🔐 Đang kiểm tra authentication...\n";
$git_config = shell_exec('git config --list 2>&1');
echo "📋 Git config:\n";
echo $git_config . "\n";

// 7. Kiểm tra file chưa commit
echo "\n📁 Đang kiểm tra files chưa commit...\n";
$git_status_porcelain = shell_exec('git status --porcelain 2>&1');
echo "📋 Files chưa commit:\n";
echo $git_status_porcelain . "\n";

// 8. Kiểm tra stash
echo "\n📦 Đang kiểm tra stash...\n";
$git_stash = shell_exec('git stash list 2>&1');
echo "📋 Stash list:\n";
echo $git_stash . "\n";

// 9. Tạo lệnh debug
echo "\n🔧 Đang tạo lệnh debug...\n";

$debug_commands = [
    "# Kiểm tra connection",
    "git ls-remote origin",
    "",
    "# Kiểm tra authentication", 
    "git config user.name",
    "git config user.email",
    "",
    "# Kiểm tra remote tracking",
    "git branch -vv",
    "",
    "# Kiểm tra push dry-run",
    "git push --dry-run origin main",
    "",
    "# Reset nếu cần",
    "git reset --soft HEAD~1",
    "",
    "# Force push (cẩn thận)",
    "git push --force-with-lease origin main"
];

file_put_contents('git-debug-commands.txt', implode("\n", $debug_commands));
echo "✅ Đã tạo git-debug-commands.txt\n";

// 10. Tạo script tự động fix
echo "\n🔧 Đang tạo script tự động fix...\n";
$fix_script = "#!/bin/bash\n";
$fix_script .= "# Script tự động fix git sync issues\n";
$fix_script .= "echo \"🚀 Bắt đầu fix git sync...\"\n\n";
$fix_script .= "# 1. Kiểm tra status\n";
$fix_script .= "echo \"📋 Kiểm tra status:\"\n";
$fix_script .= "git status\n\n";
$fix_script .= "# 2. Thêm tất cả files\n";
$fix_script .= "echo \"📁 Thêm files:\"\n";
$fix_script .= "git add .\n\n";
$fix_script .= "# 3. Commit\n";
$fix_script .= "echo \"💾 Commit:\"\n";
$fix_script .= "git commit -m \"Fix git sync issues and clean database file\n\n";
$fix_script .= "- Removed secrets from SQL file\n";
$fix_script .= "- Added .gitignore for sensitive files\n";
$fix_script .= "- Fixed authentication issues\n";
$fix_script .= "- Date: " . date('Y-m-d H:i:s') . "\"\n\n";
$fix_script .= "# 4. Kiểm tra remote\n";
$fix_script .= "echo \"🌐 Kiểm tra remote:\"\n";
$fix_script .= "git remote -v\n\n";
$fix_script .= "# 5. Push\n";
$fix_script .= "echo \"📤 Push:\"\n";
$fix_script .= "git push origin main\n\n";
$fix_script .= "# 6. Kiểm tra kết quả\n";
$fix_script .= "echo \"✅ Hoàn thành!\"\n";

file_put_contents('fix-git-sync.sh', $fix_script);
echo "✅ Đã tạo fix-git-sync.sh\n";

// 11. Phân tích vấn đề
echo "\n📊 PHÂN TÍCH VẤN ĐỀ:\n";
echo "====================\n";

$lines = explode("\n", trim($git_status));
$has_changes = false;
$has_untracked = false;

foreach ($lines as $line) {
    if (strpos($line, 'Changes to be committed') !== false) {
        $has_changes = true;
    }
    if (strpos($line, 'Untracked files') !== false) {
        $has_untracked = true;
    }
}

if ($has_changes) {
    echo "✅ Có changes cần commit\n";
} else {
    echo "❌ Không có changes cần commit\n";
}

if ($has_untracked) {
    echo "✅ Có files chưa theo dõi\n";
} else {
    echo "❌ Không có files chưa theo dõi\n";
}

if (strpos($git_status, 'Your branch is ahead') !== false) {
    echo "✅ Có commits chờ push\n";
} else {
    echo "❌ Không có commits chờ push\n";
}

echo "\n🎯 GIẢI PHÁP:\n";
echo "============\n";
echo "1. Chạy: bash fix-git-sync.sh\n";
echo "2. Hoặc thực hiện các lệnh thủ công\n";
echo "3. Kiểm tra authentication nếu cần\n";
echo "4. Xóa và thêm lại remote nếu lỗi\n\n";

echo "📝 CÁC LỆNH THỦ CÔNG:\n";
echo "====================\n";
echo "# 1. Thêm files\n";
echo "git add .\n\n";
echo "# 2. Commit\n";
echo "git commit -m \"Update project files\"\n\n";
echo "# 3. Push\n";
echo "git push origin main\n\n";

echo "🌐 Repository:\n";
echo "https://github.com/Milkoi/Velmora-jeweley-mnm.git\n";
?>
