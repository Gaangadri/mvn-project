pipeline {
    agent any

    stages {
        stage('maven-build') {
            when {
                branch "developer"
            }
            steps {
                sh "mvn clean package"
            }
        }
        stage('Tomcat-deploy-dev') {
            when {
                branch "developer"
            }
            steps {
               echo "deploying to developer"
            }
        }
        stage ('any name') {
            when {
                branch "main"
            }
            steps {
                echo "deploying to main"
         }
       }
    }
}
