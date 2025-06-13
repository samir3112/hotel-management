FROM jenkins/jenkins:lts

USER root

# Install Docker
RUN apt-get update && \
    apt-get install -y curl apt-transport-https ca-certificates gnupg lsb-release && \
    curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh && \
    usermod -aG docker jenkins

# Install Python 3 and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3.11-venv

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/v1.29.0/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/kubectl

USER jenkins


# docker build -t custom-jenkins .
# docker volume create jenkins_data
#  docker run -d --name jenkins-new \
#   -p 8080:8080 -p 50000:50000 \
#   -v jenkins_data:/var/jenkins_home \
#   -v /var/run/docker.sock:/var/run/docker.sock \
#   custom-jenkins