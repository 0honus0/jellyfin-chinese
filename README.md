# Jellyfin Chinese Edition

A Jellyfin Docker image based on the official repository with built-in support for Chinese fonts and subtitle rendering.

## Features
- Based on official Jellyfin images.
- Built-in Noto CJK fonts for Chinese metadata and subtitle rendering.
- Bundles extra subtitle fonts from `fonts/` into `/usr/local/share/fonts/custom/` inside the image.
- Automated builds via GitHub Actions.

## Add your own subtitle fonts
Put `.ttf`, `.otf`, or `.ttc` files into the repository `fonts/` directory before building.
They will be copied into `/usr/local/share/fonts/custom/` in the image and indexed by `fc-cache` during build.
