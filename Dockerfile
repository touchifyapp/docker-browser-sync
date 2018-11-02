FROM node:11-alpine
LABEL maintainer="Touchify <dev@touchify.co> (@touchify)"

# Install Browsersync globally
RUN npm -g install browser-sync

# Set working directory to host the files
WORKDIR /source

# Use entrypoint to allow arguments customization on runtime
ENTRYPOINT ["browser-sync"]