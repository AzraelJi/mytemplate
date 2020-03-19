FROM ascdc/jdk8
MAINTAINER jy jy@originaltek.com
RUN mkdir -p /var/botgo \
 && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
 && echo "Asia/Shanghai" > /etc/timezone
COPY target/*.jar /var/botgo/app.jar
WORKDIR /var/botgo
ENTRYPOINT ["java","-jar","app.jar"]
EXPOSE 9090:9090
CMD ["--spring.profiles.active=prod"]
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8