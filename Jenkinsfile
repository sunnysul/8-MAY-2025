pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                echo 'This is simple test file';
                sh 'whoami'
                sh 'sudo apt update'
            }
        }
    }
}