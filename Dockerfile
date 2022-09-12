FROM oraclelinux:8.5
RUN yum update -y
RUN yum update -y --sec-severity=Low && \
    yum install -y hostname && \
    yum install -y wget
RUN yum install -y java-11-openjdk-devel
RUN yum install -y tar
RUN yum install -y cronie
RUN groupadd -r documentum && useradd -r -g documentum dmadmin
RUN mkdir -p /usr/src/DoclinkingUtility
RUN mkdir -p /usr/src/DoclinkingUtility/logs
RUN mkdir -p /opt/dctm
COPY ./DoclinkingUtility  /usr/src/DoclinkingUtility/
RUN chown dmadmin:documentum /usr/src/DoclinkingUtility
RUN chown dmadmin:documentum /usr/src/DoclinkingUtility/logs
RUN chown dmadmin:documentum /opt/dctm
RUN chown dmadmin:documentum /usr/src/DoclinkingUtility/*
USER dmadmin
WORKDIR /usr/src/DoclinkingUtility/
ENV BulkUpdateConfigFile=/usr/src/DoclinkingUtility/config.properties
ENTRYPOINT ["tail", "-f", "/dev/null"]