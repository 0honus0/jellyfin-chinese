FROM jellyfin/jellyfin:10.11.11

# Install CJK fonts for high-quality Chinese metadata and subtitle rendering
# Note: fonts-noto-cjk-extra provides multiple weights and full character coverage
RUN apt-get update && apt-get install -y --no-install-recommends \
    fontconfig \
    fonts-noto-cjk-extra \
    locales \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Bundle extra subtitle fonts directly into the image.
# Put .ttf/.otf/.ttc files under ./fonts/ in this repository.
COPY fonts/ /usr/local/share/fonts/custom/
COPY 90-jellyfin-danmaku-fonts.conf /etc/fonts/conf.d/90-jellyfin-danmaku-fonts.conf
RUN fc-cache -f -v /usr/local/share/fonts/custom

# Generate Chinese locale to ensure proper CJK sorting and character handling
RUN sed -i 's/# *zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen zh_CN.UTF-8 && \
    update-locale LANG=zh_CN.UTF-8

# Set environment variables for Chinese locale
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8
