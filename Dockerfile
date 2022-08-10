FROM ghcr.io/coder/coder:latest
EXPOSE 8080
ENV CODER_ADDRESS=0.0.0.0:8080

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
