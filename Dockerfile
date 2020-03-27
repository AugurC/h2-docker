FROM openjdk:8-jre

ENV RELEASE_DATE 2019-10-14
ENV H2_HOME /opt/h2
ENV H2_DATA /opt/h2/data

RUN mkdir -p ${H2_DATA} \
    && curl http://www.h2database.com/h2-$RELEASE_DATE.zip -o h2.zip \
    && unzip h2.zip -d /opt/ \
    && rm h2.zip

COPY conf/h2.server.properties /root/.h2.server.properties

EXPOSE 8082 9092

WORKDIR ${H2_HOME}

ENTRYPOINT ["java", "-cp", "/opt/h2/bin/h2-1.4.200.jar", "org.h2.tools.Server", "-properties", "~/.h2.server.properties", "-baseDir", "/opt/h2/data", "-ifNotExists"]
CMD ["-tcp", "-tcpAllowOthers", "-tcpPort", "9092"]