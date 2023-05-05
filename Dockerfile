FROM alpine:3.17

LABEL org.opencontainers.image.authors="gambol99@gmail.com"

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add --no-cache ca-certificates bash

RUN adduser -D vault

ADD --chmod=755 bin/vault-sidekick /vault-sidekick

USER vault

ENTRYPOINT [ "/vault-sidekick" ]
