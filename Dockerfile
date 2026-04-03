FROM nginx:latest
WORKDIR /usr/share/nginx/html
RUN mkdir -p /var/cache/nginx /run && \
    chown -R nginx:nginx /var/cache/nginx /etc/nginx/conf.d /run
COPY default.conf /etc/nginx/conf.d/default.conf
COPY /build .
USER nginx
EXPOSE 80
CMD [ "nginx", "-g","daemon off;"  ]


