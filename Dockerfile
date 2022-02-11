# Choose the Base Image To get Started
FROM devopsedu/webapp

# Clean Website Root directory
RUN rm -rf /var/www/html/*

# Copy the website to container
COPY website /var/www/html

# Port Confirmation
EXPOSE 80

# Mandatory Command
CMD apachectl -D FOREGROUND
