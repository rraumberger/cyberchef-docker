FROM alpine as build

ARG CYBERCHEF_VERSION=v9.32.3

RUN wget -q https://github.com/gchq/CyberChef/releases/download/${CYBERCHEF_VERSION}/CyberChef_${CYBERCHEF_VERSION}.zip \
    && mkdir /cyberchef \
    && unzip -d /cyberchef CyberChef_${CYBERCHEF_VERSION}.zip \
    && mv /cyberchef/CyberChef_${CYBERCHEF_VERSION}.html /cyberchef/index.html

FROM nginxinc/nginx-unprivileged:stable-alpine
MAINTAINER Richard Raumberger <richard@raumberger.net>

COPY --from=build /cyberchef /usr/share/nginx/html
