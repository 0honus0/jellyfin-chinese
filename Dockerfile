FROM jellyfin/jellyfin:10.11.11

# Install CJK fonts and fontconfig so libass can resolve common Chinese ASS font names
RUN apt-get update && apt-get install -y --no-install-recommends \
    fontconfig \
    fonts-noto-cjk-extra \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Map common Chinese subtitle font names to installed Noto CJK fonts.
# This fixes ASS subtitles that explicitly request fonts like "黑体".
RUN mkdir -p /etc/fonts/local.conf.d
COPY 90-jellyfin-chinese-fonts.conf /etc/fonts/conf.d/90-jellyfin-chinese-fonts.conf
RUN fc-cache -f -v

# Generate Chinese locale to ensure proper CJK sorting and character handling
RUN sed -i 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen

# Set environment variables for Chinese locale
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8
