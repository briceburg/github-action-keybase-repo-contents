FROM keybaseio/client:6.0.2
RUN apt-get update && apt-get install -y \
    git \
  && rm -rf /var/lib/apt/lists/*
COPY copy-paths-from-repo /usr/bin/
COPY entrypoint.sh /usr/bin/
CMD ["copy-paths-from-repo"]
