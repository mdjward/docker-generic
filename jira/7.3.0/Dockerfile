FROM ubuntu:16.04

ENV JIRA_VERSION 7.3.0
ENV JIRA_SYSTEM_ARCH x64

ADD ./response.varfile /tmp

RUN apt-get update && \
    apt-get install -fy curl && \
    curl https://downloads.atlassian.com/software/jira/downloads/atlassian-jira-software-$JIRA_VERSION-$JIRA_SYSTEM_ARCH.bin -o /tmp/jira.bin && \
    chmod 755 /tmp/jira.bin && \
    /tmp/jira.bin -q -varfile /tmp/response.varfile && \
    rm -f /tmp/jira.bin /tmp/response.varfile && \
    apt-get purge -fy curl && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8080 8005

VOLUME /var/atlassian/application-data/jira

CMD ["/opt/atlassian/jira/bin/catalina.sh", "run"]
