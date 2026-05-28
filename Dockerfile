FROM jellyfin/jellyfin:latest

# Install Noto CJK fonts for high-quality Chinese metadata and subtitle rendering
# Note: fonts-noto-cjk-extra provides multiple weights and full character coverage
RUN apt-get update && apt-get install -y --no-install-recommends \
    fonts-noto-cjk \
    fonts-noto-cjk-extra \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables for Chinese locale
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8
