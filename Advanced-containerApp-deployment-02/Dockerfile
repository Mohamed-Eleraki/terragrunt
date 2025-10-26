# Use the official Nginx image as the base image
FROM nginx:alpine

# Copy custom configuration file (optional)
# COPY nginx.conf /etc/nginx/nginx.conf

# Copy static content (optional)
# COPY static /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
