FROM ghcr.io/coder/coder:v0.9.5
EXPOSE 8080
ENV CODER_ADDRESS=0.0.0.0:8080

#USER coder # this is set in entrypoint with su-exec
USER root
RUN apk add --no-cache su-exec

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
