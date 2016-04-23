FROM mdjward/php-build:latest
MAINTAINER M.D.Ward <dev@mattdw.co.uk>

ENV ANT_PARALLEL_APPLY_VERSION 1.0.1

RUN echo deb "http://httpredir.debian.org/debian jessie-backports main" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -fy openjdk-8-jdk openjdk-8-jre \
    && mkdir -p /opt/ant \
    && curl -o /usr/share/ant/lib/AntParallelApply-${ANT_PARALLEL_APPLY_VERSION}.jar https://github.com/mdjward/ant-parallel-apply-task/releases/download/${ANT_PARALLEL_APPLY_VERSION}/AntParallelApply-${ANT_PARALLEL_APPLY_VERSION}.jar
