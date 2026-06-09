# Jellyfin Chinese Edition

A Jellyfin Docker image based on the official repository with built-in support for Chinese fonts and subtitle rendering.

## Features
- Based on official Jellyfin images.
- Built-in Noto CJK fonts for Chinese metadata and subtitle rendering.
- Bundles extra subtitle fonts from `fonts/` into `/usr/local/share/fonts/custom/` inside the image.
- Includes four small open-source Chinese fonts for danmaku-style subtitles: `ZCOOL KuaiLe`, `ZCOOL XiaoWei`, `Ma Shan Zheng`, and `Zhi Mang Xing`.
- Keeps bundled fallback fonts below Jellyfin's 20 MiB fallback-font transfer limit.
- Maps common ASS subtitle font names such as `黑体`, `宋体`, `楷体`, `SimHei`, `SimSun`, `KaiTi`, `微软雅黑`, and `Microsoft YaHei` to bundled Chinese fonts.
- Automated builds via GitHub Actions.

## Bundled fallback fonts
- `ZCOOLKuaiLe-Regular.ttf` — playful display font for danmaku.
- `ZCOOLXiaoWei-Regular.ttf` — softer Song-style display font.
- `MaShanZheng-Regular.ttf` — handwritten brush style.
- `ZhiMangXing-Regular.ttf` — cursive display style.

## Add your own subtitle fonts
Put `.ttf`, `.otf`, or `.ttc` files into the repository `fonts/` directory before building.
They will be copied into `/usr/local/share/fonts/custom/` in the image and indexed by `fc-cache` during build.
