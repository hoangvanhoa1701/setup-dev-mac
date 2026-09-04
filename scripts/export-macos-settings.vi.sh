#!/usr/bin/env bash
# ==============================================================================
# scripts/export-macos-settings.vi.sh (Phiên bản Tiếng Việt)
# Tự động trích xuất các setting macOS hiện tại (Trackpad, Bàn phím, Finder, Dock...)
# và tạo ra file `backups/apply-my-settings.vi.sh` để dễ dàng khôi phục trên máy Mac mới.
# ==============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
BACKUP_DIR="$PROJECT_ROOT/backups"

mkdir -p "$BACKUP_DIR"
OUTPUT_FILE="$BACKUP_DIR/apply-my-settings.vi.sh"

echo "🔍 Đang đọc các cấu hình hệ thống hiện tại trên máy Mac của bạn..."

cat << 'EOF' > "$OUTPUT_FILE"
#!/usr/bin/env bash
# ==============================================================================
# apply-my-settings.vi.sh (Phiên bản Tiếng Việt)
# Script tự động áp dụng lại các cấu hình cá nhân hóa macOS.
# Tự động sinh bởi scripts/export-macos-settings.vi.sh
# ==============================================================================

echo "🚀 Đang áp dụng các thiết lập macOS cá nhân của bạn..."

# Đóng System Settings nếu đang mở để tránh bị ghi đè cài đặt
osascript -e 'tell application "System Settings" to quit' 2>/dev/null || true
osascript -e 'tell application "System Preferences" to quit' 2>/dev/null || true

EOF

# Hàm xuất giá trị `defaults` an toàn
export_domain_keys() {
    local domain="$1"
    local title="$2"
    shift 2
    local keys=("$@")

    echo "echo \"⚙️  Đang cấu hình: $title...\"" >> "$OUTPUT_FILE"
    for key in "${keys[@]}"; do
        if val=$(defaults read "$domain" "$key" 2>/dev/null); then
            type=$(defaults read-type "$domain" "$key" 2>/dev/null | awk '{print $NF}' || echo "string")
            case "$type" in
                boolean)
                    if [ "$val" = "1" ] || [ "$val" = "true" ]; then
                        echo "defaults write $domain \"$key\" -bool true" >> "$OUTPUT_FILE"
                    else
                        echo "defaults write $domain \"$key\" -bool false" >> "$OUTPUT_FILE"
                    fi
                    ;;
                integer)
                    echo "defaults write $domain \"$key\" -int $val" >> "$OUTPUT_FILE"
                    ;;
                float)
                    echo "defaults write $domain \"$key\" -float $val" >> "$OUTPUT_FILE"
                    ;;
                string)
                    echo "defaults write $domain \"$key\" -string \"$val\"" >> "$OUTPUT_FILE"
                    ;;
                *)
                    ;;
            esac
        fi
    done
    echo "" >> "$OUTPUT_FILE"
}

# 1. Bàn phím & Tốc độ gõ
export_domain_keys "-g" "Bàn phím & Tốc độ gõ" \
    "InitialKeyRepeat" \
    "KeyRepeat" \
    "ApplePressAndHoldEnabled" \
    "NSAutomaticSpellingCorrectionEnabled" \
    "NSAutomaticCapitalizationEnabled" \
    "NSAutomaticPeriodSubstitutionEnabled"

# 2. Trackpad cử chỉ & Chạm
export_domain_keys "com.apple.AppleMultitouchTrackpad" "Trackpad Cử chỉ & Cảm ứng" \
    "Clicking" \
    "TrackpadThreeFingerDrag" \
    "TrackpadRightClick" \
    "TrackpadCornerSecondaryClick" \
    "TrackpadScroll" \
    "TrackpadPinch" \
    "TrackpadRotate" \
    "TrackpadTwoFingerDoubleTapGesture" \
    "TrackpadThreeFingerTapGesture" \
    "TrackpadThreeFingerHorizSwipeGesture" \
    "TrackpadThreeFingerVertSwipeGesture" \
    "TrackpadFourFingerHorizSwipeGesture" \
    "TrackpadFourFingerVertSwipeGesture" \
    "TrackpadFourFingerPinchGesture" \
    "TrackpadFiveFingerPinchGesture"

export_domain_keys "com.apple.driver.AppleBluetoothMultitouch.trackpad" "Bluetooth Trackpad" \
    "Clicking" \
    "TrackpadThreeFingerDrag" \
    "TrackpadRightClick" \
    "TrackpadCornerSecondaryClick" \
    "TrackpadFourFingerHorizSwipeGesture" \
    "TrackpadFourFingerVertSwipeGesture"

# 3. Tốc độ chuột & Trackpad (Tracking Speed)
export_domain_keys "-g" "Tốc độ di chuột & Trackpad" \
    "com.apple.trackpad.scaling" \
    "com.apple.mouse.scaling" \
    "com.apple.scrollwheel.scaling"

# 4. Finder & Hiển thị file
export_domain_keys "com.apple.finder" "Cấu hình Finder" \
    "ShowPathbar" \
    "ShowStatusBar" \
    "_FXSortFoldersFirst" \
    "FXDefaultSearchScope" \
    "FXEnableExtensionChangeWarning" \
    "AppleShowAllFiles"

export_domain_keys "NSGlobalDomain" "Hiển thị phần mở rộng file" \
    "AppleShowAllExtensions"

# 5. Dock & Mission Control
export_domain_keys "com.apple.dock" "Cấu hình Dock & Mission Control" \
    "autohide" \
    "autohide-delay" \
    "autohide-time-modifier" \
    "tilesize" \
    "magnification" \
    "largesize" \
    "show-recents" \
    "mru-spaces"

# Thêm lệnh khởi động lại các tiến trình liên quan
cat << 'EOF' >> "$OUTPUT_FILE"
# Khởi động lại các service để áp dụng thay đổi ngay lập tức
echo "🔄 Đang khởi động lại Finder, Dock và SystemUIServer..."
killall Finder 2>/dev/null || true
killall Dock 2>/dev/null || true
killall SystemUIServer 2>/dev/null || true

echo "✅ Hoàn tất! Tất cả thiết lập cá nhân của bạn đã được khôi phục thành công."
EOF

chmod +x "$OUTPUT_FILE"

echo "========================================================================"
echo "✅ ĐÃ XUẤT THÀNH CÔNG FILE CẤU HÌNH!"
echo "📁 Vị trí file: backups/apply-my-settings.vi.sh"
echo "👉 Cách khôi phục trên máy Mac mới: Chỉ cần chạy lệnh:"
echo "   bash backups/apply-my-settings.vi.sh"
echo "========================================================================"
