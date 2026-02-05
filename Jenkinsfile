pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        DOCKERHUB_REPO = 'samagyasapkota/petclinic'
        IMAGE_TAG = "${BUILD_NUMBER}"
    }
    
    tools {
        maven 'Maven-3.9'
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Cloning repository from staging branch...'
                git branch: 'staging',
                    url: 'https://github.com/samagyasapkota/DevOps-Spring-Project.git'
            }
        }
        
        stage('Build Maven Project') {
         HEAD
            steps {
                dir('JavaApp-CICD') {
                    echo 'Building application with Maven...'
                    script {
                        def mvnHome = tool 'Maven-3.9'
                        bat "${mvnHome}\\bin\\mvn clean package -DskipTests"
                    }
                }

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
 HEAD
                echo 'Building Docker image...'

                dir('JavaApp-CICD') { 

                script {
                    bat "docker build -t ${DOCKERHUB_REPO}:${IMAGE_TAG} ."
                    bat "docker build -t ${DOCKERHUB_REPO}:latest ."
                }
            }
            }
        }
        
        stage('Push to DockerHub') {
            steps {
                echo 'Pushing Docker image to DockerHub...'
                script {
                    bat "docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}"
                    bat "docker push ${DOCKERHUB_REPO}:${IMAGE_TAG}"
                    bat "docker push ${DOCKERHUB_REPO}:latest"
                }
            }
        }
        
        stage('Cleanup') {
            steps {
                echo 'Cleaning up local Docker images...'
                script {
                    bat "docker rmi ${DOCKERHUB_REPO}:${IMAGE_TAG} || exit 0"
                    bat "docker rmi ${DOCKERHUB_REPO}:latest || exit 0"
                }
            }
        }
    }
    
    post {
        always {
            echo 'Cleaning workspace...'
            cleanWs()
        }
        success {
            echo '✅ Pipeline executed successfully!'
            echo "Docker image pushed: ${DOCKERHUB_REPO}:${IMAGE_TAG}"
        }
        failure {
            echo '❌ Pipeline failed!'
        }
    }
}
