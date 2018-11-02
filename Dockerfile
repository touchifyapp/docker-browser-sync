FROM node:11-alpine
LABEL maintainer="Touchify <dev@touchify.co> (@touchify)"

RUN npm -g install browser-sync

WORKDIR /source

ENTRYPOINT ["browser-sync"]