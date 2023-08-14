pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                script{
                sh """ 
                cd /var/lib/jenkins/workspace/webapp
                sudo docker build . -t webapp
                sudo docker run -d --rm -p 80:80 webapp
                """
                }
            }
        }

        stage('test ') {
            steps {
                script{
                def curl = sh script: 'curl -IsSf localhost:80
                if (curl.contains("HTTP/1.1 200 OK")) {
                    echo "webpage alive"
                    } else {
                    error " webpage down"
                    }
                }
            }
        }
    }
}