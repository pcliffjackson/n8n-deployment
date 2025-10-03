FROM n8nio/n8n:latest

# Ensure data dir exists and is writable
USER root
RUN mkdir -p /home/node/.n8n \
  && chown -R node:node /home/node/.n8n
USER node

# Expose default n8n port (Railway will set PORT; you map via N8N_PORT env)
ENV N8N_PORT=8080
EXPOSE 8080



