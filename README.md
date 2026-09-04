# 🚀 Ultimate Mac Dev & Vibe Coding Setup

<div align="center">

**[English](#-english) | [Tiếng Việt](#-tiếng-việt)**

*A streamlined, AI-first developer environment setup guide optimized for macOS Apple Silicon (M1/M2/M3/M4).*

</div>

---

## 🇺🇸 English

### 🌟 Overview

The **Ultimate Mac Dev & Vibe Coding Setup** is a modern, step-by-step setup guide designed specifically for developers and AI-augmented coding ("Vibe Coding"). It features an interactive web guide, one-click terminal commands, direct tool links, and automated backup/restore scripts for macOS preferences.

### ✨ Key Features

- 🌐 **Bilingual Interactive Guide (`index.html`)**: Instant switching between English and Vietnamese.
- 📋 **1-Click Copy**: Copy terminal commands and shell configs with visual toast feedback.
- ⚡ **Vibe Coding & AI-First Stack**: Tailored for tools like Cursor, Zed, Claude Code, Starship, and MCP.
- 🔄 **macOS Settings Backup & Restore**: One-command export of your exact trackpad gestures, keyboard repeat rates, Finder, and Dock configurations into a standalone restore script.

### 📁 Project Structure

```text
setup-dev-mac/
├── index.html                           # Interactive bilingual web setup guide
├── README.md                            # Project documentation (EN & VI)
├── .gitignore                           # macOS and temporary file exclusions
├── scripts/                             # Automation scripts
│   ├── export-macos-settings.en.sh      # Settings exporter (English version)
│   └── export-macos-settings.vi.sh      # Settings exporter (Vietnamese version)
└── backups/                             # Auto-generated restore scripts
    ├── apply-my-settings.en.sh          # Settings restore script (English)
    └── apply-my-settings.vi.sh          # Settings restore script (Vietnamese)
```

### 🚀 Quick Start

#### 1. Open the Interactive Setup Guide
Launch the local web dashboard in your browser:
```bash
open index.html
```

#### 2. Export Your Current Mac Preferences
Scan and export all current macOS preferences (Trackpad 4-finger swipes, 2-finger click, key repeats, Finder, Dock) into the `backups/` directory:
```bash
bash scripts/export-macos-settings.en.sh
```

#### 3. Restore Preferences on Any New Mac
Transfer the generated script to your new Mac and run:
```bash
bash backups/apply-my-settings.en.sh
```

---

## 🇻🇳 Tiếng Việt

### 🌟 Giới thiệu

**Ultimate Mac Dev & Vibe Coding Setup** là cẩm nang thiết lập môi trường lập trình hiện đại từng bước, được tối ưu riêng cho Lập trình viên và phong cách làm việc AI-first ("Vibe Coding"). Dự án tích hợp giao diện web tương tác trực quan, lệnh sao chép 1-click, đường dẫn chính thức và bộ script tự động sao lưu/khôi phục cài đặt macOS.

### ✨ Tính năng nổi bật

- 🌐 **Giao diện web trực quan (`index.html`)**: Chuyển đổi ngôn ngữ Tiếng Anh / Tiếng Việt linh hoạt chỉ với 1 click.
- 📋 **Sao chép 1-Click**: Tích hợp nút copy cho mọi câu lệnh terminal và cấu hình shell kèm thông báo toast.
- ⚡ **Tối ưu Vibe Coding & AI**: Chuẩn hóa cấu hình cho Cursor, Zed, Claude Code, Starship prompt và MCP.
- 🔄 **Tự động sao lưu & Khôi phục Setting**: Trích xuất toàn bộ cử chỉ trackpad (vuốt 4 ngón, chạm 2 ngón), tốc độ phím, Finder, Dock thành script độc lập để khôi phục trên máy mới trong 2 giây.

### 📁 Cấu trúc thư mục

```text
setup-dev-mac/
├── index.html                           # Giao diện web hướng dẫn chi tiết từng bước
├── README.md                            # Tài liệu dự án (EN & VI)
├── .gitignore                           # Loại trừ file tạm hệ thống macOS
├── scripts/                             # Thư mục chứa script tự động hóa
│   ├── export-macos-settings.vi.sh      # Script trích xuất cài đặt (Bản Tiếng Việt)
│   └── export-macos-settings.en.sh      # Script trích xuất cài đặt (Bản Tiếng Anh)
└── backups/                             # Thư mục chứa file cấu hình đã xuất
    ├── apply-my-settings.vi.sh          # Script khôi phục cài đặt trên máy mới (VI)
    └── apply-my-settings.en.sh          # Script khôi phục cài đặt trên máy mới (EN)
```

### 🚀 Hướng dẫn sử dụng nhanh

#### 1. Mở giao diện hướng dẫn trực quan
Mở file `index.html` trực tiếp trên trình duyệt của bạn:
```bash
open index.html
```

#### 2. Trích xuất cài đặt máy Mac hiện tại
Chạy script để quét và trích xuất cấu hình hệ thống vào thư mục `backups/`:
```bash
bash scripts/export-macos-settings.vi.sh
```

#### 3. Khôi phục cài đặt trên máy Mac mới
Chuyển file khôi phục sang máy Mac mới và chạy:
```bash
bash backups/apply-my-settings.vi.sh
```

---

## 👤 Author / Tác giả

* **Author**: Hoang Hoa ([@hoangvanhoa1701](https://github.com/hoangvanhoa1701))
* **Email**: [hoangvanhoa1701@gmail.com](mailto:hoangvanhoa1701@gmail.com)
* **GitHub Repository**: [https://github.com/hoangvanhoa1701/setup-dev-mac](https://github.com/hoangvanhoa1701/setup-dev-mac)
