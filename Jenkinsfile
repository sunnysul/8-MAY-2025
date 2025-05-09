pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                echo 'This is simple test file';
                sh 'whoami';
                sh 'apt update && apt upgrade -y';
                sh 'apt install sudo -y';
                sh 'sudo apt install docker.io -y && apt install docker-compose -y';
                sh 'docker --version';
                sh 'docker-compose --version';
            }
        }
    }
}