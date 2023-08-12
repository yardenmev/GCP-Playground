pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh"""
                cd /var/lib/jenkins/workspace/webapp
                docker build .
                docker run webapp -p 80:80
                """
            }
        }
    }
}