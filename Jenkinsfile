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

        stage('Maven Package') {
            steps {
                sh 'mvn clean package'
                archiveArtifacts artifacts: '**/target/*.jar, **/target/*.war', fingerprint: true
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
