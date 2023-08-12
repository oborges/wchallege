# Use a base image with both git and nginx
FROM nginx:alpine

# Install git
RUN apk add --no-cache git

# Clone the repository
RUN git clone https://github.com/oborges/wchallege.git /tmp/wchallege

# Copy the specified files to the Nginx default directory
COPY /tmp/wchallege/index.html /usr/share/nginx/html/index.html
COPY /tmp/wchallege/styles.css /usr/share/nginx/html/styles.css

# Expose port 80 for the web server
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]

