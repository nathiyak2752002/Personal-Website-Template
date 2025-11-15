pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/nathiyak2752002/Personal-Website-Template.git'
            }
        }

        stage('Build React') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myfrontend:latest .'
            }
        }

        stage('Stop old container') {
            steps {
                sh 'docker rm -f myfrontend || true'
            }
        }

        stage('Run new container') {
            steps {
                sh 'docker run -d --name myfrontend -p 80:80 myfrontend:latest'
            }
        }
    }
}
