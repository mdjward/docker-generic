FROM mdjw866/php-build-ant:latest
MAINTAINER M.D.Ward <dev@mattdw.co.uk>

# Install and configure a basic SSH server
RUN apt-get update &&\
    apt-get install -y openssh-server &&\
    apt-get clean -y && rm -rf /var/lib/apt/lists/* &&\
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd &&\
    mkdir -p /var/run/sshd

# Set user jenkins to the image
RUN adduser --quiet jenkins &&\
    echo "jenkins:jenkins" | chpasswd

# Standard SSH port
EXPOSE 22

# Set work directory
WORKDIR /home/jenkins

# Volumise Jenkins home directory
VOLUME /home/jenkins

CMD ["/usr/sbin/sshd", "-D"]
