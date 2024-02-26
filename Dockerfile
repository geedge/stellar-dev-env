FROM rockylinux/rockylinux:8
COPY el8.repo.internal.geedge.net.repo /tmp/repo.internal.geedge.net.repo
COPY netrc.conf /root/.netrc
COPY tsg_framework.sh /etc/profile.d/tsg_framework.sh

RUN cp /tmp/repo.internal.geedge.net.repo /etc/yum.repos.d/ && \
    yum install -y gcc gcc-c++ make epel-release patch wget socat automake autoconf libtool rpm-build git yum-utils && \
    wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-archive-8.repo && \
    sed -i 's/epel-archive/epel/g' /etc/yum.repos.d/epel.repo && \
    yum-config-manager --enable powertools && \
    dnf --enablerepo=powertools install -y libpcap-devel && \
    yum install -y cmake3 && \
    yum install -y python2 && \
    yum install -y python3-pip && \
    pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple httpie && \
    rpm -U https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/c/cppcheck-2.7-1.el7.x86_64.rpm && \
    yum install -y sudo && \
    yum install -y elfutils-libelf-devel libmnl-devel libnfnetlink-devel gtest-devel && \
    yum install -y net-tools psmisc iproute initscripts gperftools-libs gdb snappy && \
    yum install -y libunwind gperftools && \
    dnf --enablerepo=powertools install -y libnsl 

RUN yumdownloader --destdir=/tmp/ libMESA_prof_load-devel libMESA_prof_load \
                            libMESA_htable-devel libMESA_htable \
                            libMESA_handle_logger-devel libMESA_handle_logger \ 
                            libMESA_field_stat2-devel libMESA_field_stat2 \
                            libfieldstat3-devel libfieldstat3 libfieldstat4-devel libfieldstat4 \
                            libbreakpad_mini libMESA_jump_layer libcjson && \
    find /tmp/ -name "*.rpm" |xargs rpm --prefix=/opt/tsg/framework --force --nodeps -ivh

RUN yumdownloader --destdir=/tmp/ sapp stellar-c && \
    find /tmp/ -name "sapp*.rpm" |xargs rpm --prefix=/opt/tsg/sapp -ivh && \
    find /tmp/ -name "stellar-c*.rpm" | xargs rpm --prefix=/opt/tsg/  -ivh
    
RUN yum clean all && \
    rm -rf /var/cache/yum

CMD [ "/bin/bash" ]
