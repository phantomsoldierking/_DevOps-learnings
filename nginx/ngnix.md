1. Web Server (Serving Static & Dynamic Content)

This configuration serves static files from /var/www/html and forwards PHP requests to a backend.

    Listens on port 80 for requests to example.com.

    Serves files from the /var/www/html directory.

    If a user visits the site, Nginx will look for index.html, index.htm, or index.php as the default page.

    Use this setup if you are hosting a PHP-based website like WordPress.
```
server {
    listen 80;
    server_name example.com;

    root /var/www/html;
    index index.html index.htm index.php;

# Tries to serve the requested file or directory.
# If the file doesn't exist, it returns a 404 Not Found error.

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_pass unix:/run/php/php-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
```

2. Reverse Proxy (Forwarding Requests to Backend Server)

This configuration forwards requests to a backend application running on a port 5000.

```
server {
    listen 80;
    server_name api.example.com;
# Listens on port 80 for api.example.com.

    location / {
        proxy_pass http://127.0.0.1:5000;   # Forwards all requests to a backend application running on port 5000
        proxy_set_header Host $host;        # Pass important headers like the real IP and scheme to the backend.
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

3. Load Balancer (Distributing Traffic Among Multiple Servers)

This setup distributes traffic among three backend servers.

Nginx uses Below load-balancing method
```
Round Robin (Default)

    Requests are distributed sequentially across all available servers.

    Forwards requests to one of the backend servers in a round-robin manner.

upstream backend_servers {
    server 192.168.1.101;
    server 192.168.1.102;
    server 192.168.1.103;
}

server {
    listen 80;
    server_name app.example.com;

    location / {
        proxy_pass http://backend_servers;  
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

Each backend (192.168.1.101, 192.168.1.102, 192.168.1.103) must have Nginx installed and serving content.

upstream block defines a group of backend servers that can be used for load balancing and proxying requests.

Without sticky sessions, requests from a single user might be routed to different backend servers, leading to inconsistent session behavior.
```
upstream backend_servers {
    ip_hash;     # Basic Sticky Session
    server 192.168.1.101;
    server 192.168.1.102;
    server 192.168.1.103;
}
```
Types of Routing in Nginx (With Examples)

1. Path-Based Routing

Route different paths to different backends.
```
location /api/ { proxy_pass http://backend_api; }
location /admin/ { proxy_pass http://backend_admin; }
```
2. Host-Based Routing

Route based on domain name.
```
server { server_name api.example.com; proxy_pass http://backend_api; }
server { server_name www.example.com; proxy_pass http://backend_web; }
```
3. Header-Based Routing

Route based on HTTP headers (e.g., User-Agent).
```
if ($http_user_agent ~* "Mobile") { proxy_pass http://backend_mobile; }
```
4. Load Balancing Routing

Distribute traffic across multiple servers.
```
upstream backend_servers {
    least_conn;
    server 192.168.1.101;
    server 192.168.1.102;
    server 192.168.1.103;
}
location / { proxy_pass http://backend_servers; }
```
5. Geolocation Routing

Route users based on country.
```
if ($geo_country = "US") { proxy_pass http://backend_us; }
```
6. Cookie-Based Routing

A/B testing, feature rollouts.
```
if ($cookie_experiment_group = "beta") { proxy_pass http://backend_beta; }
```

7. Rate-Based Routing

Limit API calls to prevent abuse.
```
limit_req_zone $binary_remote_addr zone=api_limit:10m rate=10r/s;
```
8. Query Parameter Routing

Route based on URL parameters.
```
if ($arg_version = "beta") { proxy_pass http://backend_beta; }
```

9. File Extension-Based Routing

Serve static files separately.
```
location ~* \.(jpg|css|js)$ { root /var/www/static; }
```