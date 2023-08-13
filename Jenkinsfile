pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                script{
                sh """ 
                cd /var/lib/jenkins/workspace/webapp
                sudo docker build . -t webapp
                sudo docker run  --rm -p 80:80 webapp
                """
                }
            }
        }
    }
}