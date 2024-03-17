#!/bin/bash

# File to check for existence
lock_file="/var/www/html/.wp_lock_init_script"

# echo $SQL_USR
# echo $SQL_PASSW
# echo $FDQN
sleep 5
# Check if the lock file exists
if [ ! -f "$lock_file" ]; then
    # If the lock file doesn't exist, execute WP commands
	
    wp core download --allow-root --path="/var/www/html" && \
	cp /wp-config.php /var/www/html/wp-config.php &&\
    wp core install --allow-root --url="${FDQN}" --title="Biopic de Rachid Abarki" --admin_user="${WP_ADMIN_USR}" --admin_password="${WP_ADMIN_PASSW}" --admin_email="${WP_ADMIN_EMAIL}" --path="/var/www/html" --skip-email && \
    wp user create "${WP_NORMAL_USR}" "${WP_NORMAL_EMAIL}" --allow-root --role="author" --user_pass="${WP_NORMAL_PASSW}" --path="/var/www/html"
    
	#If redis is there
	wp plugin install redis-cache --activate --allow-root --path="/var/www/html"
	wp plugin update --all --allow-root --path="/var/www/html"
	wp redis enable --allow-root --path="/var/www/html"

    # Create the lock file
    touch "$lock_file"
fi

# Start PHP-FPM
exec php-fpm82 -F