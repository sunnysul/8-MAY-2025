# Use Nginx as base image
FROM nginx:alpine

# Copy the HTML file to Nginx's default serving directory
COPY src/index.html /usr/share/nginx/html/index.html

# Expose port 80 for web traffic
EXPOSE 80

# Default command starts Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]

# Build the Docker image
# docker build -t html-app .

# Run the container
# docker run -p 80:80 html-app