FROM registry.access.redhat.com/ubi8/ubi

RUN yum upgrade -y \
    && yum install -y java \
    && sed -i 's/jdk.tls.disabledAlgorithms=/jdk.tls.disabledAlgorithms=SSLv2Hello, DES40_CBC, RC4_40, SSLv2, TLSv1, TLSv1.1, /g' /etc/alternatives/jre/lib/security/java.security \
    && useradd admin \
    && yum clean -y all

USER admin
WORKDIR /home/admin
