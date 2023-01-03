pipeline {
    agent any

    stages {
        stage('maven-build') {
            steps {
                sh "mvn clean package"
            }
        }
        stage('Docker Build') {
            steps {
              sh "docker build -t medavamsi/mvn-project:0.0.2 ."
            }
        }
        stage ('Docker push') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub', variable: 'hubpwd')]) {
                    sh "docker login -u medavamsi -p ${hubpwd}"
                    sh "docker push medavamsi/mvn-project:0.0.2"
             }
         }
       }
        stage('Docker Deploy') {
            steps {
                sshagent(['docker-host']) {
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.85.80 docker run -d -p 8080:8080 --name mvn-project medavamsi/mvn-project:0.0.2"
        }
    }
}
