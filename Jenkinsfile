pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                script{
                sh """ 
                cd /var/lib/jenkins/workspace/webapp
                docker build . -t webapp
                docker run  --rm -p 80:80 webapp
                """
                }
            }
        }
    }
}