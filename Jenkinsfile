pipeline {
    agent any
<<<<<<< HEAD
=======
    
>>>>>>> 53d315c (Update project files)
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        DOCKERHUB_REPO = 'samagyasapkota/petclinic'
        IMAGE_TAG = "${BUILD_NUMBER}"
    }
<<<<<<< HEAD
=======
    
<<<<<<< HEAD
    tools {
        maven 'Maven-3.9'
    }
    
    stages {
        stage('Build Maven Project') {
            steps {
                dir('JavaApp-CICD') {
                    sh 'mvn clean package -DskipTests'
=======
>>>>>>> 53d315c (Update project files)
    stages {
        stage('Checkout') {
            steps {
                git branch: 'staging',
                    url: 'https://github.com/samagyasapkota/DevOps-Spring-Project.git'
            }
        }
<<<<<<< HEAD
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
        stage('Check Docker') {
    steps {
        sh 'docker --version'
        sh 'docker ps'
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
=======
        
        stage('Build Maven Project') {
            steps {
                dir('JavaApp-CICD') {
                    sh 'docker run --rm -v $(pwd):/app -w /app maven:3.9.9-eclipse-temurin-17 mvn clean package -DskipTests'
>>>>>>> 95341043b8332c6e95893808cd46456d429b9691
                }
            }
        }
        
        stage('Check Docker') {
            steps {
                sh 'docker --version'
                sh 'docker ps'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKERHUB_REPO}:${IMAGE_TAG} ."
                sh "docker tag ${DOCKERHUB_REPO}:${IMAGE_TAG} ${DOCKERHUB_REPO}:latest"
            }
        }
        
        stage('Push to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh "docker push ${DOCKERHUB_REPO}:${IMAGE_TAG}"
                sh "docker push ${DOCKERHUB_REPO}:latest"
            }
        }
        
>>>>>>> 53d315c (Update project files)
        stage('Cleanup') {
            steps {
                sh "docker rmi ${DOCKERHUB_REPO}:${IMAGE_TAG} || true"
                sh "docker rmi ${DOCKERHUB_REPO}:latest || true"
            }
        }
    }
<<<<<<< HEAD
    post {
        always {
            cleanWs()
        }
=======
    
    post {
>>>>>>> 53d315c (Update project files)
        success {
            echo "✅ Pipeline executed successfully!"
            echo "Docker image: ${DOCKERHUB_REPO}:${IMAGE_TAG}"
        }
        failure {
            echo "❌ Pipeline failed!"
        }
    }
}
