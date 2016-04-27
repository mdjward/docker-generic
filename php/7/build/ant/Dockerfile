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

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && curl -o /usr/local/bin/apigen -L http://apigen.org/apigen.phar && chmod +x /usr/local/bin/apigen \
    && curl -o /usr/local/bin/phpunit -L https://phar.phpunit.de/phpunit.phar && chmod +x /usr/local/bin/phpunit \
    && curl -o /usr/local/bin/phpcs -L https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && chmod +x /usr/local/bin/phpcs \
    && curl -o /usr/local/bin/phpcbf -L https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar && chmod +x /usr/local/bin/phpcbf \
    && curl -o /usr/local/bin/phpmd -L http://static.phpmd.org/php/latest/phpmd.phar && chmod +x /usr/local/bin/phpmd \
    && curl -o /usr/local/bin/phpcpd -L https://phar.phpunit.de/phpcpd.phar && chmod +x /usr/local/bin/phpcpd \
    && curl -o /usr/local/bin/phploc -L https://phar.phpunit.de/phploc.phar && chmod +x /usr/local/bin/phploc \
    && curl -o /usr/local/bin/pdepend -L http://static.pdepend.org/php/latest/pdepend.phar && chmod +x /usr/local/bin/pdepend

