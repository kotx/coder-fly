FROM ghcr.io/coder/coder:v0.8.15 AS cache

ENV CODER_CACHE_DIRECTORY=/var/cache/coder
ENV CODER_DEV_MODE=true

USER root
RUN mkdir /.config && chown coder:coder /.config
RUN mkdir -p ${CODER_CACHE_DIRECTORY} && chown coder:coder ${CODER_CACHE_DIRECTORY}

USER coder
COPY make-cache.sh /
RUN /make-cache.sh

FROM ghcr.io/coder/coder:v0.8.15
EXPOSE 8080
ENV CODER_ADDRESS=0.0.0.0:8080
ENV CODER_CACHE_DIRECTORY=/var/cache/coder

COPY --from=cache ${CODER_CACHE_DIRECTORY} ${CODER_CACHE_DIRECTORY}
USER root
RUN chown -R coder:coder ${CODER_CACHE_DIRECTORY}

#USER coder # this is set in entrypoint with su-exec
RUN apk add --no-cache su-exec

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
