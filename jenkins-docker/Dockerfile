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

# Install kubectl (v1.30)
RUN curl -LO "https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && mv kubectl /usr/local/bin/kubectl

# Allow Jenkins user to use kubectl and docker
RUN chown -R jenkins:jenkins /usr/local/bin/kubectl

USER jenkins



# docker build -t jenkins-custom-k8s .
# docker volume create jenkins_data
#  docker run -d --name jenkins \
#  -p 8080:8080 -p 50000:50000 \
#  -v /var/run/docker.sock:/var/run/docker.sock \
#  -v jenkins_home:/var/jenkins_home \
#  --group-add $(getent group docker | cut -d: -f3) \
#  samir3112/jenkins-custom:v1

# docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
# Login to jenins via port forwarding (localhost:8080)
# mkdir -p ~/.kube   --> Onces
# nano ~/.kube/config --> Onces
# kubectl get nodes --> check everytime in docker
# chmod +x scripts/deploy.sh --> to execute deploy.sh
# kubectl create configmap mysql-init --from-file=init.sql
