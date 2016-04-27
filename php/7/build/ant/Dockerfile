FROM mdjw866/php-build:latest
MAINTAINER M.D.Ward <dev@mattdw.co.uk>

ENV ANT_VERSION 1.9.7
ENV ANT_PARALLEL_APPLY_VERSION 1.0.1

RUN echo deb "http://httpredir.debian.org/debian jessie-backports main" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -fy openjdk-8-jdk openjdk-8-jre \
    && mkdir -p /opt/ant \
    && curl -o /tmp/ant.tar.gz http://mirror.catn.com/pub/apache/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz \
    && tar xzf /tmp/ant.tar.gz --directory /opt/ant --strip-components 1 \
    && rm -f /tmp/ant.tar.gz \
    && curl -o /opt/ant/lib/AntParallelApply.jar https://github.com/mdjward/ant-parallel-apply-task/releases/download/${ANT_PARALLEL_APPLY_VERSION}/AntParallelApply-${ANT_PARALLEL_APPLY_VERSION}.jar \
    && ln -s /opt/ant/bin/ant /usr/local/bin/ant

ENV ANT_HOME /opt/ant

