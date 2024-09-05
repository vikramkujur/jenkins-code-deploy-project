pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1' // Replace with your AWS region
        S3_BUCKET_NAME = 'code-deploy-frontend-artifacts' // Replace with your S3 bucket name
        APPLICATION_NAME = 'frontend' // Replace with your CodeDeploy application name
        DEPLOYMENT_GROUP_NAME = 'Frontend-deploy-grp' // Replace with your CodeDeploy deployment group name
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout code from GitHub
                git branch: 'main', url: 'https://github.com/vikramkujur/jenkins-code-deploy-project.git' // Replace with your repository URL
            }
        }

        stage('Package Artifacts') {
            steps {
                script {
                    // Create a zip file of the web content
                    sh 'zip -r Frontend.zip *'
                }
            }
        }

        stage('Upload to S3') {
            steps {
                script {
                    // Upload the zip file to S3
                    sh """
                    aws s3 cp Frontend.zip s3://${S3_BUCKET_NAME}/Frontend.zip
                    """
                }
            }
        }

        stage('Deploy with CodeDeploy') {
            steps {
                script {
                    // Deploy the application using AWS CodeDeploy
                    sh """
                    aws deploy create-deployment \
                        --application-name ${APPLICATION_NAME} \
                        --deployment-group-name ${DEPLOYMENT_GROUP_NAME} \
                        --s3-location bucket=${S3_BUCKET_NAME},bundleType=zip,key=Frontend.zip \
                        --region ${AWS_DEFAULT_REGION}
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
