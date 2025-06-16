pipeline {
    agent any

    environment {
        IMAGE_NAME = 'samir3112/hotel-management:latest'
        KUBECONFIG = '/var/jenkins_home/.kube/config' 
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/samir3112/hotel-management.git'
            }
        }

        stage('Build Image') {
            steps {
                dir('app') {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh '''
                        echo $PASSWORD | docker login -u $USERNAME --password-stdin
                        docker push $IMAGE_NAME
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'bash scripts/deploy.sh'
            }
        }
    }
}
