pipeline {
    agent any
        environment { 
            tag = ${BUILD_NUMBER}
        }
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
                    docker tag webapp us-central1-docker.pkg.dev/gcp-devops-training-389818/nginx-playground/webapp:${tag}
                    docker push us-central1-docker.pkg.dev/gcp-devops-training-389818/nginx-playground/webapp:${tag}
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