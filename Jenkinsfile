pipeline {
    agent any

    stages {
       stage('Build React') {
    steps {
        sh '''
            npm install
            CI=false npm run build
        '''
    }
}


        stage('Build Docker Image') {
            steps {
                sh 'docker build -t frontend-app .'
            }
        }

        stage('Stop old container') {
            steps {
                sh 'docker stop frontend-app || true'
                sh 'docker rm frontend-app || true'
            }
        }

        stage('Run new container') {
            steps {
                sh 'docker run -d -p 80:80 --name frontend-app frontend-app'
            }
        }
    }
}
