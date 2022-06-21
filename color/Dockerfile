# quay.io/codefresh_sa/color-service
# docker build -t quay.io/codefresh_sa/color-service:hat .
# docker build -t quay.io/codefresh_sa/color-service:scarf . --build-arg IMAGE_ARG=color/img_scarf.jpeg

FROM nginx:1.22-alpine

# Notes: color/ is the path used for this app's K8s ingress URL rewrite.
#        Remove color/ when testing this image locally or running without URL rewriting.
ARG IMAGE_ARG=color/img_hat.jpeg

COPY 05-interpolation.sh /docker-entrypoint.d/
COPY index.html /usr/share/nginx/html/
COPY img_hat.jpeg /usr/share/nginx/html/
COPY img_scarf.jpeg /usr/share/nginx/html/

ENV IMAGE=$IMAGE_ARG
ENV COLOR1 Tomato
ENV COLOR2 DodgerBlue
ENV COLOR3 MediumSeaGreen
