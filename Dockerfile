FROM ghcr.io/coder/coder:latest
EXPOSE 8080
ENV CODER_HTTP_ADDRESS=0.0.0.0:8080

#USER coder # this is set in entrypoint with su-exec
#hadolint ignore=DL3002
USER root
RUN apk add --no-cache su-exec

COPY --chmod=0755 entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
