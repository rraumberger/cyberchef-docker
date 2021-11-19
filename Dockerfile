FROM alpine as build

ARG CYBERCHEF_VERSION

RUN wget -q https://github.com/gchq/CyberChef/releases/download/v${CYBERCHEF_VERSION}/CyberChef_v${CYBERCHEF_VERSION}.zip \
    && mkdir /cyberchef \
    && unzip -d /cyberchef CyberChef_v${CYBERCHEF_VERSION}.zip \
    && mv /cyberchef/CyberChef_v${CYBERCHEF_VERSION}.html /cyberchef/index.html

FROM nginxinc/nginx-unprivileged:stable-alpine
MAINTAINER Richard Raumberger <richard@raumberger.net>

COPY --from=build /cyberchef /usr/share/nginx/html
