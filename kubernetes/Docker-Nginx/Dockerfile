FROM nginx:latest

RUN rm /etc/nginx/conf.d/* && rm /usr/share/nginx/html/

COPY nginx.conf /etc/nginx/conf.d/ 
COPY index.html /usr/share/nginx/html/

EXPOSE 80
