FROM debian:stable-slim
RUN apt update && apt install -y nginx tor \
    --no-install-recommends && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/lib/tor/hidden_service && \
    chown -R root:root /var/lib/tor/hidden_service && \
    chmod 700 /var/lib/tor/hidden_service
COPY website /var/www/html
RUN echo "\
HiddenServiceDir /var/lib/tor/hidden_service\n\
HiddenServicePort 80 127.0.0.1:80\n" \
    > /etc/tor/torrc
EXPOSE 80
CMD service nginx start && tor
