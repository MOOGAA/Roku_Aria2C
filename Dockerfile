FROM ubuntu:latest as build

WORKDIR /home/app
COPY package.json .
COPY --chown=Scripts/* .
RUN \
  chmod
  bash setup.sh
###
COPY yarn.lock .
RUN yarn
COPY . .
ENV PORT=8080
EXPOSE 8080
CMD ["bash", "start.sh"]
