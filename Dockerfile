FROM jellyfin/jellyfin:10.11.10

# Generate Chinese locale to ensure proper CJK sorting and character handling
RUN sed -i 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen

# Set environment variables for Chinese locale
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8
