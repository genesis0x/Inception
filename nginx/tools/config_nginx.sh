#!/bin/sh

# Define directory paths
certificates_dir="/etc/nginx/certs"
html_dir="/var/www/html"
wordpress_dir="/var/www/wordpress"

# Create directories if they don't exist
mkdir -p  "$html_dir" "$wordpress_dir"

# Generate SSL certificate
if [ ! -f "$certificates_dir/cert.pem" ] && [ ! -f "$certificates_dir/key.pem" ]; then
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 3650 -nodes\
			-subj "/C=MA/ST=TETOUANE/L=Martil/O=1337/OU=1337MED/CN=hahadiou"
fi

# Create default HTML page
if [ ! -f "$html_dir/index.html" ]; then
    echo "<h1>Inceptionne Mon Freeeeeere</h1>" > "$html_dir/index.html"
fi

# Create default WordPress page
if [ ! -f "$wordpress_dir/index.php" ]; then
    echo "<h1>Error Wordpress Not Found!</h1>" > "$wordpress_dir/index.php"
fi

nginx -g "daemon off;"