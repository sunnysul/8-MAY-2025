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
                echo 'Docker and Docker Compose installed successfully';

                sh 'systemctl start docker';
                sh 'systemctl enable docker';
                echo 'Docker service started and enabled successfully';
                
                sh 'pwd';
                sh 'ls -l';
                sh 'docker build -t myapp:latest .';
                sh 'docker run -d -p 80:80 myapp:latest';
            }
        }
    }
}