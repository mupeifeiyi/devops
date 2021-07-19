FROM centos:7
MAINTAINER FeiYi
ENV HTTP_PROXY=http://child-prc.intel.com:913
ENV HTTPS_PROXY=http://child-prc.intel.com:913
ENV NGINX_DIR /usr/src/nginx-1.11.1
ADD http://nginx.org/download/nginx-1.11.1.tar.gz /usr/src
WORKDIR $NGINX_DIR
RUN yum -y install pcre-devel openssl-devel gcc gcc-c++ make zlib-devel \
    ./configure --prefix=/usr/local/nginx --user=nginx --group=nginx && make && make install \
    useradd nginx \
    ln -s /usr/local/nginx/sbin/nginx /usr/sbin/nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
