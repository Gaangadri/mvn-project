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
    }
}
