# Jellyfin Chinese Edition

A Jellyfin Docker image based on the official repository with built-in support for Chinese fonts and subtitle rendering.

## Features
- Based on official Jellyfin images.
- Built-in Noto CJK fonts for Chinese metadata and subtitle rendering.
- Scans external fonts from `/usr/local/share/fonts/custom` for ASS subtitle rendering.
- Fontconfig aliases for common ASS subtitle font names such as `黑体`, `宋体`, `微软雅黑`, `Microsoft YaHei`, and `SimHei`.
- Generic fallback aliases for `sans-serif`, `serif`, and `monospace` to reduce missing-glyph boxes when subtitles request unknown fonts.
- Automated builds via GitHub Actions.
