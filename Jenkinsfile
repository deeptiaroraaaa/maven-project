pipeline {
    agent any

    environment {
        APP_NAME = "maven-project"
        BUILD_INFO = "Job_Name: ${APP_NAME}\nBuild_Number: ${BUILD_NUMBER}"
    }

    tools {
        maven 'maven'
    }

    stages {

        stage('Git Clone') {
            steps {
                git 'https://github.com/deeptiaroraaaa/maven-project.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }

    post {
        success {
            echo "Build Successful: ${BUILD_INFO}"
        }

        failure {
            echo "Build Failed: ${BUILD_INFO}"
        }
    }
}
