# Cloudflare Local Network Dynamic DNS Updater

A streamlined Bash script that automatically keeps your Cloudflare DNS records synchronized with your local network's IP address, serving as an Dynamic DNS (DDNS) solution.

## Main Features

- Automatically synchronizes Cloudflare DNS A records with your current public IP
- Easy configuration using environment variables
- Docker-based deployment with automatic updates every 15 minutes

## Prerequisites

- Docker runtime environment
- Cloudflare account with active status
- Domain name set up on Cloudflare
- Valid Cloudflare API Token with DNS modification rights

## Installation and Usage

1. Download the repository:
```
git clone https://github.com/prakashdivyy/cloudflare-ddns-local.git
cd cloudflare-ddns-local
```

2. Build the Docker image:
```
docker build -t cloudflare-ddns .
```

3. Deploy the container:
```
docker run -d \
    -e ZONE_ID=your_zone_id \
    -e RECORD_ID=your_record_id \
    -e TOKEN=your_cloudflare_token \
    -e RECORD_NAME=your_record_name \
    --name cloudflare-ddns cloudflare-ddns
```