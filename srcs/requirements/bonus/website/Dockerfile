FROM alpine:3.19.1
MAINTAINER ggualerz@student.42nice.fr

# Update package repository and install busybox
RUN apk update && apk upgrade && apk add --no-cache busybox-extras

# Create directory structure
RUN mkdir -p /var/www/html

# Copy index.html to the document root
COPY ./conf/index.html /var/www/html/

# Set working directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80

# Run busybox httpd to serve the files
CMD ["httpd", "-f", "-p", "80", "-h", "/var/www/html"]