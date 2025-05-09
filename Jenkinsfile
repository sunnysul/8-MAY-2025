pipeline {
    agent any
    
    environment {
        // Define EC2 instance public IP or DNS
        EC2_PUBLIC_IP = credentials('EC2_PUBLIC_IP')
        // Define port for application
        APP_PORT = '80'
        // Define host port to map
        HOST_PORT = '8080'
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Get code from repository
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t html-app:${BUILD_NUMBER} .'
                    // Tag as latest
                    sh 'docker tag html-app:${BUILD_NUMBER} html-app:latest'
                }
            }
        }
        
        stage('Run Tests') {
            steps {
                // Basic validation test - could be expanded for more complex testing
                sh 'docker run --rm html-app:${BUILD_NUMBER} ls -la /usr/share/nginx/html/'
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    // Stop existing container if running
                    sh 'docker stop html-app-container || true'
                    sh 'docker rm html-app-container || true'
                    
                    // Run new container with proper network configuration for EC2
                    sh 'docker run -d --network=host -p ${HOST_PORT}:${APP_PORT} --name html-app-container html-app:${BUILD_NUMBER}'
                    
                    // Optional: Check if container is running
                    sh 'docker ps -a | grep html-app-container'
                }
            }
        }
        
        stage('Security Setup') {
            steps {
                echo 'Make sure your EC2 security group allows inbound traffic on port ${HOST_PORT}'
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline completed successfully! The HTML application is now running.'
            echo 'Access the application at http://${EC2_PUBLIC_IP}:${HOST_PORT}'
            echo 'If you cannot access the application, ensure your EC2 security group allows inbound traffic on port ${HOST_PORT}'
        }
        failure {
            echo 'Pipeline failed. Please check the logs for more details.'
        }
    }
}