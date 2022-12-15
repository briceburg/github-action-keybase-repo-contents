FROM ghcr.io/briceburg/github-action-keybase-repo-contents:b7444d858f924fe1df337cfba50d86da7a825ca2
COPY copy-paths-from-repo /usr/bin/
CMD ["copy-paths-from-repo"]
