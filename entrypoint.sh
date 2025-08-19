#!/bin/sh

umask ${UMASK}

if [ "$1" = "version" ]; then
  ./iNoi version
else
  # Define the target directory path for aria2 service
  ARIA2_DIR="/opt/service/start/aria2"
  
  if [ "$RUN_ARIA2" = "true" ]; then
   cp -a /opt/service/stop/aria2 /opt/service/start 2>/dev/null
  fi

  chown -R ${PUID}:${PGID} /opt/inoi/
  exec su-exec ${PUID}:${PGID} ./iNoi server --no-prefix
fi