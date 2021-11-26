FROM openeuler/openeuler:20.03-lts-sp1
MAINTAINER Shgm

#ADD nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum -y install nginx && yum clean all -y

ADD nginx.conf /

RUN chmod ugo+r /nginx.conf

USER 997
EXPOSE 8080
CMD ["/usr/sbin/nginx", "-c", "/nginx.conf", "-g", "daemon off;"]

# Set labels used in OpenShift to describe the builder images
LABEL io.k8s.description="Platform for migrating sites to openshift proxies http/https" \
      io.k8s.display-name="nginx openEuler epel" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,html,nginx" \
      io.openshift.min-memory="1Gi" \
      io.openshift.min-cpu="1" \
      io.openshift.non-scalable="false"
