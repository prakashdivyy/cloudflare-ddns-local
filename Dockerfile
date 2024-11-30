FROM alpine:3.20.3

# Install required packages
RUN apk add --no-cache bash curl

# Copy the script
COPY ddns.sh /usr/local/bin/ddns.sh
RUN chmod +x /usr/local/bin/ddns.sh

# Add crontab file
RUN echo "*/15 * * * * /usr/local/bin/ddns.sh" > /etc/crontabs/root

# Run crond in foreground
CMD ["crond", "-f", "-d", "8"]
