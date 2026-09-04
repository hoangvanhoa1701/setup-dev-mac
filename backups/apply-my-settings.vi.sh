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

echo "⚙️  Đang cấu hình: Bàn phím & Tốc độ gõ..."
defaults write -g "InitialKeyRepeat" -int 15
defaults write -g "KeyRepeat" -float 2
defaults write -g "ApplePressAndHoldEnabled" -bool false
defaults write -g "NSAutomaticSpellingCorrectionEnabled" -bool false
defaults write -g "NSAutomaticCapitalizationEnabled" -bool false
defaults write -g "NSAutomaticPeriodSubstitutionEnabled" -bool false

echo "⚙️  Đang cấu hình: Trackpad Cử chỉ & Cảm ứng..."
defaults write com.apple.AppleMultitouchTrackpad "Clicking" -bool true
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool true
defaults write com.apple.AppleMultitouchTrackpad "TrackpadRightClick" -bool true
defaults write com.apple.AppleMultitouchTrackpad "TrackpadCornerSecondaryClick" -int 0
defaults write com.apple.AppleMultitouchTrackpad "TrackpadScroll" -bool true
defaults write com.apple.AppleMultitouchTrackpad "TrackpadPinch" -int 1
defaults write com.apple.AppleMultitouchTrackpad "TrackpadRotate" -int 1
defaults write com.apple.AppleMultitouchTrackpad "TrackpadTwoFingerDoubleTapGesture" -int 1
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerTapGesture" -int 0
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerHorizSwipeGesture" -int 0
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerVertSwipeGesture" -int 0
defaults write com.apple.AppleMultitouchTrackpad "TrackpadFourFingerHorizSwipeGesture" -int 2
defaults write com.apple.AppleMultitouchTrackpad "TrackpadFourFingerVertSwipeGesture" -int 2
defaults write com.apple.AppleMultitouchTrackpad "TrackpadFourFingerPinchGesture" -int 2
defaults write com.apple.AppleMultitouchTrackpad "TrackpadFiveFingerPinchGesture" -int 2

echo "⚙️  Đang cấu hình: Bluetooth Trackpad..."
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "Clicking" -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadThreeFingerDrag" -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadRightClick" -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadCornerSecondaryClick" -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadFourFingerHorizSwipeGesture" -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadFourFingerVertSwipeGesture" -int 2

echo "⚙️  Đang cấu hình: Tốc độ di chuột & Trackpad..."
defaults write -g "com.apple.trackpad.scaling" -float 3
defaults write -g "com.apple.mouse.scaling" -float 3
defaults write -g "com.apple.scrollwheel.scaling" -float 1

echo "⚙️  Đang cấu hình: Cấu hình Finder..."
defaults write com.apple.finder "ShowPathbar" -bool true
defaults write com.apple.finder "ShowStatusBar" -bool true
defaults write com.apple.finder "_FXSortFoldersFirst" -bool true

echo "⚙️  Đang cấu hình: Hiển thị phần mở rộng file..."
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool true

echo "⚙️  Đang cấu hình: Cấu hình Dock & Mission Control..."
defaults write com.apple.dock "autohide" -bool false
defaults write com.apple.dock "tilesize" -float 36
defaults write com.apple.dock "largesize" -float 37
defaults write com.apple.dock "show-recents" -bool false

# Khởi động lại các service để áp dụng thay đổi ngay lập tức
echo "🔄 Đang khởi động lại Finder, Dock và SystemUIServer..."
killall Finder 2>/dev/null || true
killall Dock 2>/dev/null || true
killall SystemUIServer 2>/dev/null || true

echo "✅ Hoàn tất! Tất cả thiết lập cá nhân của bạn đã được khôi phục thành công."
