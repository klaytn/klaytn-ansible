# Copyright GroundX Co., Ltd. 2020 All Rights Reserved.
FROM ubuntu:18.04
LABEL MAINTAINER="jeff.kim@groundx.xyz"

# FIX update ubuntu apt repo
RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get upgrade -y && apt-get update
RUN apt-get install -y
RUN apt-get install net-tools software-properties-common -y
RUN apt-add-repository --yes ppa:ansible/ansible
RUN apt-get update
RUN apt-get install -y ansible python-pip python-dev build-essential groff

RUN pip install boto boto3
RUN pip install awscli

EXPOSE 22
CMD [ "ansible-playbook", "--version" ]
