pipeline {
    agent any

    environment {
        IMAGE = "deeptiarora45/jenkins-docker-project"
    }

    stages {
        stage('git-clone') {
            steps {
                git 'https://github.com/deeptiaroraaaa/maven-project.git'
            }
        }

        stage('maven build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('docker build') {
            steps {
                sh 'docker build -t $IMAGE .'
            }
        }

        stage('docker push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker-jenkins',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh 'docker push $IMAGE'
                }
            }
        }
    }
}
