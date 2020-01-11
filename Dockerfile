FROM centos:7

MAINTAINER Alvin alvincy@qq.com

RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

RUN yum makecache

RUN yum update -y

RUN yum install python3

ADD pip.conf /root/.pip/

RUN pip3 install django

WORKDIR /root/test

ADD docker /root/test/

EXPOSE 80 443

CMD ["python3", "manage.py", "runserver", "0.0.0.0:80"]






