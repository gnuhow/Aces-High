FROM docker.io/redhat/ubi9:latest

RUN echo "Install Node"
RUN dnf module enable -y nodejs:20
RUN dnf install -y nodejs
RUN node --version

RUN npm init
RUN npm install express


EXPOSE 80
CMD ["node app/main.js"]