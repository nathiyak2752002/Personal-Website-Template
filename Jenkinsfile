pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git url: 'https://github.com/nathiyak2752002/Personal-Website-Template.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t my-frontend-app .'
                }
            }
        }

        stage('Stop Old Container') {
            steps {
                script {
                    sh '''
                    docker rm -f my-frontend-app || true
                    '''
                }
            }
        }

        stage('Run New Container') {
            steps {
                script {
                    sh '''
                    docker run -d -p 3000:3000 --name my-frontend-app my-frontend-app
                    '''
                }
            }
        }
    }
}
