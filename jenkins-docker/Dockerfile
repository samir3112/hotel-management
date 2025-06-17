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


# ( Docker_ENV)
#  docker build -t jenkins-custom-k8s .
#  docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home -v ~/.kube:/var/jenkins_home/.kube --group-add $(getent group docker | cut -d: -f3) jenkins-custom-k8s
# docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
# Login to jenins via port forwarding (localhost:8080)

# ( For connection between Docker_ENV to Kuber_ENV )
# On Kuber_ENV 
#  cat ~/.kube/config

# On Docker_ENV (1st)
# mkdir -p ~/.kube   --> Onces
# nano ~/.kube/config --> Onces  then 
# Press Ctrl + O (to write) → Enter   then  Press Ctrl + X (to exit)
# kubectl get nodes --> check everytime in docker

# On Docker_ENV (2nd)
# docker exec -it jenkins bash ( Inside container)
#  curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
#  chmod +x kubectl
#  mv kubectl /usr/local/bin/
# kubectl version --client
# kubectl get nodes

# (Outside container)
# chmod +x scripts/deploy.sh --> to execute deploy.sh

#  (Kuber_VM)
# kubectl create configmap mysql-init --from-file=init.sql
# kubectl get pods
# kubectl get svc
