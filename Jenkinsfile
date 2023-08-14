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
                def curl = sh script: 'curl --silent --fail -I localhost:80', returnStdout: true
                if (curl.contains("HTTP/1.1 200 OK")) {
                    echo "webpage alive"
                    } else {
                    error " webpage down"
                    }
                }
            }
        }

        stage('push image') {
                steps {
                    sh """
                    aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 644435390668.dkr.ecr.us-east-2.amazonaws.com
                    docker build -t ${IMAGE_NAME}:${tag} .
                    docker tag ${IMAGE_NAME}:${tag} 644435390668.dkr.ecr.us-east-2.amazonaws.com/yarden-todo:${tag}
                    docker push 644435390668.dkr.ecr.us-east-2.amazonaws.com/yarden-todo:${tag}
                    """
                } 
            }
    }

     post {
        always {
            // Brings containers down.
            sh 'docker stop $(docker ps -q)'
        }
    }
}