pipeline {
    agent any
    environment {
        IMAGE_NAME = 'samir3112/hotel-management:latest'
    }
    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/samir3112/hotel-management.git'
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME ./app'
            }
        }
        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
                    sh 'docker push $IMAGE_NAME'
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
