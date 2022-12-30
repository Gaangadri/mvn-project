pipeline {
    agent any

    stages {
        stage('git-checkout') {
            steps {
                echo 'Hello World'
                git branch: 'main', credentialsId: 'git-creds', url: 'https://github.com/Gaangadri/mvn-project/'
            }
        }
        stage('maven-build') {
            steps {
                sh "mvn clean package"
            }
        }
        stage('Tomcat-deploy') {
            steps {
                sshagent(['Tomcat']) {
                    sh "scp -o StrictHostKeyChecking=no target/*.war ec2-user@172.31.93.222:/opt/tomcat09/webapps"
                    sh "ssh ec2-user@172.31.93.222 /opt/tomcat09/bin/shutdown.sh"
                    sh "ssh ec2-user@172.31.93.222 /opt/tomcat09/bin/startup.sh"
              }
            }
        }
    }
}
