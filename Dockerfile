FROM ubuntu:latest

ENTRYPOINT ["/bin/start.sh"]
EXPOSE 80
ENV CONSUL_URL consul:8500
RUN apt-get update
RUN apt-get install nginx
ADD start.sh /bin/start.sh
RUN rm -v /etc/nginx/conf.d/*.conf

ADD https://github.com/hashicorp/consul-template/releases/download/v0.7.0/consul-template_0.7.0_linux_amd64.tar.gz /usr/bin/
RUN tar -C /usr/local/bin --strip-components 1 -zxf /usr/bin/consul-template_0.7.0_linux_amd64.tar.gz
RUN mkdir /templates
ADD https://s3-eu-west-1.amazonaws.com/prova-cdmon/service1.ctmpl /templates/service.ctmpl

