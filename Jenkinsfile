pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/cmonthe2/Inadev'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t cmonthe8/weather-service .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    sh 'docker push cmonthe8/weather-service'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh """
                    kubectl apply -f k8s/deployment.yaml
                    kubectl apply -f k8s/service.yaml
                    """
                }
            }
        }
    }
}
