# quay.io/codefresh_sa/color-service

FROM nginx:1.21.6

COPY 05-interpolation.sh /docker-entrypoint.d/
COPY index.html /usr/share/nginx/html/
COPY img_hat.jpeg /usr/share/nginx/html/
COPY img_scarf.jpeg /usr/share/nginx/html/

ENV IMAGE=img_hat.jpeg

ENV COLOR1 Tomato
ENV COLOR2 DodgerBlue
ENV COLOR3 MediumSeaGreen
