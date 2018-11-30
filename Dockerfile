FROM centos

RUN yum install -y epel-release
RUN yum install -y python-pip
RUN pip install -U pip

RUN yum install -y python-devel libffi-devel gcc openssl-devel libselinux-python
RUN yum install -y ansible
RUN pip install -U ansible

RUN echo "host_key_checking=False" >> /etc/ansible/ansible.cfg
RUN echo "pipelining=True" >> /etc/ansible/ansible.cfg
RUN echo "forks=100" >> /etc/ansible/ansible.cfg

RUN pip install kolla-ansible --ignore-installed
RUN cp -r /usr/share/kolla-ansible/etc_examples/kolla /etc/
RUN cp /usr/share/kolla-ansible/ansible/inventory/* ~

RUN kolla-genpwd
