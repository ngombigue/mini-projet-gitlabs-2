ARG version="latest"
FROM nginx:${version}
LABEL maintainer="bigue NGOM"

# Installer git
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Supprimer le contenu par défaut de nginx et cloner le dépôt
RUN rm -rf /usr/share/nginx/html/* && \
    git clone https://github.com/ngombigue/static-website-example.git /usr/share/nginx/html/

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]
