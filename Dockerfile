FROM cgr.dev/chainguard/nginx:latest

COPY site/ /usr/share/nginx/html/

EXPOSE 8080