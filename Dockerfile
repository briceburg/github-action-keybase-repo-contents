FROM keybaseio/client:6.0.2-alpine
RUN apk add --no-cache bash git
COPY copy-paths-from-repo /usr/bin/
COPY entrypoint.sh /usr/bin/
CMD ["copy-paths-from-repo"]
