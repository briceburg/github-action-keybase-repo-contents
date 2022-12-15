FROM ghcr.io/briceburg/github-action-keybase-repo-contents:05edf021f83678389211faae55c387b6f3199ac9
COPY copy-paths-from-repo /usr/bin/
CMD ["copy-paths-from-repo"]
