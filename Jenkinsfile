pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        DOCKERHUB_REPO = 'YOUR_DOCKERHUB_USERNAME/petclinic'
        IMAGE_TAG = "${BUILD_NUMBER}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'staging',
                    url: 'https://github.com/samagyasapkota/DevOps-Spring-Project.git'
            }
        }
        
        stage('Build Maven Project') {
    steps {
        dir('JavaApp-CICD') {
            script {
                def mvnHome = tool name: 'Maven-3.9', type: 'maven'
                sh "${mvnHome}/bin/mvn clean package -DskipTests"
            }
        }
    }
}
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKERHUB_REPO}:${IMAGE_TAG} ."
                    sh "docker build -t ${DOCKERHUB_REPO}:latest ."
                }
            }
        }
        
        stage('Push to DockerHub') {
            steps {
                script {
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                    sh "docker push ${DOCKERHUB_REPO}:${IMAGE_TAG}"
                    sh "docker push ${DOCKERHUB_REPO}:latest"
                }
            }
        }
        
        stage('Cleanup') {
            steps {
                sh "docker rmi ${DOCKERHUB_REPO}:${IMAGE_TAG} || true"
                sh "docker rmi ${DOCKERHUB_REPO}:latest || true"
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
        success {
            echo "✅ Pipeline executed successfully!"
            echo "Docker image: ${DOCKERHUB_REPO}:${IMAGE_TAG}"
        }
        failure {
            echo "❌ Pipeline failed!"
        }
    }
}
