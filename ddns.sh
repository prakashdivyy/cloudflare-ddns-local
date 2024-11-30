#!/bin/bash

# Get current public IP address
current_ip=$(curl -4 -s https://ifconfig.me)

if [ -z "$current_ip" ]; then
    echo "Failed to get current IP address"
    exit 1
fi

# Update DNS record
update_response=$(curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID" \
     -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json" \
     --data "{\"type\":\"A\",\"name\":\"$RECORD_NAME\",\"content\":\"$current_ip\",\"ttl\":1,\"proxied\":false}")

# Check if update was successful
if echo "$update_response" | grep -q '"success":true'; then
    echo "DNS record updated successfully to $current_ip"
else
    echo "Failed to update DNS record"
    echo "Response: $update_response"
    exit 1
fi
