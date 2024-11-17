# Simple Nginx Onion Site

## Requirements

- Install Docker

## Startup Commands

Build: `docker build -t nginx-onion .`
Run: `docker run -d -p 8100:80 nginx-onion`

The site will be available locally at `localhost:8100`.

To connect over Tor, get the hostname with `docker exec -it <container-id> cat /var/lib/tor/hidden_service/hostname`.
