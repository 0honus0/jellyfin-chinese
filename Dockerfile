FROM jellyfin/jellyfin:latest

# Install fonts for Chinese characters display in metadata and subtitles
RUN apt-get update && apt-get install -y --no-install-recommends \
    fonts-wqy-microhei \
    fonts-wqy-zenhei \
    xfonts-intl-chinese \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables for Chinese locale (optional but helpful)
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8
