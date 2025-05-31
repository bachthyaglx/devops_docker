FROM docker:24.0-cli

# Install Git
RUN apk add --no-cache git

# Copy the script into the container
COPY builder.sh /usr/local/bin/builder.sh

# Make the script executable
RUN chmod +x /usr/local/bin/builder.sh

# Default entrypoint
ENTRYPOINT ["builder.sh"]
