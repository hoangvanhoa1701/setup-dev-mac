# 🚀 Ultimate Mac Dev & Vibe Coding Setup

> Hướng dẫn thiết lập môi trường Lập trình & Vibe Coding (AI-First) tối ưu cho macOS Apple Silicon (M1/M2/M3/M4).  
> *Streamlined step-by-step developer environment setup with bilingual support, one-click copy terminal commands, and automated settings backup.*

---

## 🌟 Tính năng chính / Key Features

- 🇻🇳 / 🇺🇸 **Bilingual Support (Song ngữ)**: Chuyển đổi linh hoạt giữa Tiếng Việt và Tiếng Anh chỉ với 1 click.
- 📋 **1-Click Copy**: Sao chép nhanh mọi lệnh terminal và cấu hình shell kèm hiệu ứng thông báo trực quan.
- ⚡ **Vibe Coding & AI-First Ready**: Tối ưu riêng cho quy trình lập trình tốc độ cao cùng AI (Cursor, Zed, Claude Code, Starship, MCP).
- 🔄 **Settings Backup & Restore**: Tự động trích xuất cài đặt máy Mac hiện tại (Trackpad cử chỉ 2/3/4 ngón, tốc độ bàn phím, Finder, Dock) thành script `.sh` độc lập để khôi phục trên máy mới trong 2 giây.

---

## 📁 Cấu trúc thư mục / Project Structure

```text
setup-dev-mac/
├── index.html                           # Giao diện web hướng dẫn chi tiết từng bước
├── README.md                            # Tài liệu dự án
├── .gitignore                           # Loại bỏ file tạm macOS
├── scripts/                             # Thư mục chứa các script tự động hóa
│   ├── export-macos-settings.vi.sh      # Script trích xuất setting (Bản Tiếng Việt)
│   └── export-macos-settings.en.sh      # Script trích xuất setting (Bản Tiếng Anh)
└── backups/                             # Thư mục chứa file cấu hình đã trích xuất
    ├── apply-my-settings.vi.sh          # Script khôi phục setting trên máy mới (VI)
    └── apply-my-settings.en.sh          # Script khôi phục setting trên máy mới (EN)
```

---

## 🚀 Hướng dẫn sử dụng / Quick Start

### 1. Mở giao diện hướng dẫn trực quan (Interactive Guide)
Bạn chỉ cần mở trực tiếp file `index.html` bằng trình duyệt:
```bash
open index.html
```

### 2. Trích xuất cài đặt máy Mac hiện tại (Export Settings)
Chạy script để quét và trích xuất toàn bộ cấu hình máy của bạn vào thư mục `backups/`:

* **Tiếng Việt:**
  ```bash
  bash scripts/export-macos-settings.vi.sh
  ```
* **English:**
  ```bash
  bash scripts/export-macos-settings.en.sh
  ```

### 3. Khôi phục cài đặt trên máy Mac mới (Import / Restore)
Copy file khôi phục sang máy Mac mới và chạy:

* **Tiếng Việt:**
  ```bash
  bash backups/apply-my-settings.vi.sh
  ```
* **English:**
  ```bash
  bash backups/apply-my-settings.en.sh
  ```

---

## 👤 Author

* **Author**: Hoang Hoa ([@hoangvanhoa1701](https://github.com/hoangvanhoa1701))
* **Email**: [hoangvanhoa1701@gmail.com](mailto:hoangvanhoa1701@gmail.com)
* **GitHub**: [github.com/hoangvanhoa1701/setup-dev-mac](https://github.com/hoangvanhoa1701/setup-dev-mac)
