# 🚀 CI/CD Pipeline Project (Jenkins + Maven + Docker)

## 📌 Project Overview

This project demonstrates a complete CI/CD pipeline using Jenkins.

The pipeline automatically:

* Clones code from GitHub
* Builds the application using Maven
* Creates a Docker image
* Pushes the image to Docker Hub

---

## 🛠️ Technologies Used

* Jenkins
* Maven
* Docker
* GitHub

---

## ⚙️ Pipeline Workflow

1. Git Clone
2. Maven Build (`mvn clean package`)
3. Docker Build
4. Docker Push to Docker Hub

---

## 🐳 Docker Image

https://hub.docker.com/r/deeptiarora45/jenkins-docker-project

---

## 🔐 Security

Used Jenkins Credentials to securely store Docker Hub username and Personal Access Token.

---

## 📸 Screenshots

<img width="1374" height="631" alt="image" src="https://github.com/user-attachments/assets/9ae7eb9b-4645-4f72-b96b-dad57aeccfde" />
<img width="881" height="378" alt="image" src="https://github.com/user-attachments/assets/70776016-6686-4380-b340-986f316baf3c" />

---

## 🎯 Key Learning

* Learned CI/CD pipeline creation
* Integrated Jenkins with Docker
* Automated build and deployment workflow


## 📜 Jenkins Pipeline Code

```groovy
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
```


