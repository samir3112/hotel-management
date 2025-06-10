FROM jenkins/jenkins:lts

USER root
RUN apt-get update -y
RUN curl https://get.docker.com/ > dockerinstall \
    && chmod 777 dockerinstall \
    && ./dockerinstall

RUN usermod -aG docker jenkins

RUN apt-get update -y \
    && apt-get install python3 -y \
    && apt-get install python3-pip -y \
    && apt install python3.11-venv -y \
    && rm -rf /usr/lib/python3.11/rm EXTERNALLY-MANAGED


USER jenkins