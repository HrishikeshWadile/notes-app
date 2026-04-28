🚀 Student Feedback Form - DevOps CI/CD Pipeline

This project demonstrates an end-to-end DevOps workflow using:

🟢 GitHub (Version Control)
🟡 Jenkins (CI/CD Automation)
🔵 Docker (Containerization)
🔴 Flask (Web Application)
📁 Project Structure
student-feedback-form/
│── app.py
│── requirements.txt
│── Dockerfile
│── Jenkinsfile
│── README.md
│
└── templates/
    ├── form.html
    └── responses.html
⚙️ Tech Stack
Python (Flask)
Docker
Jenkins
GitHub
HTML/CSS
🚀 1. Run Flask App Locally
Install dependencies
pip install -r requirements.txt
Run application
python app.py
Open in browser
http://localhost:5000
🐳 2. Docker Setup
Build Docker Image
docker build -t feedback-app .
Run Container
docker run -d -p 5000:5000 --name feedback-app feedback-app
Access App
http://localhost:5000
⚡ 3. Jenkins Setup (CI/CD)
Run Jenkins using Docker
Windows (PowerShell)
docker run -d `
  -p 8080:8080 `
  -p 50000:50000 `
  -v jenkins_home:/var/jenkins_home `
  -v /var/run/docker.sock:/var/run/docker.sock `
  --name jenkins-container `
  jenkins/jenkins:lts
Linux / Mac
docker run -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --name jenkins-container \
  jenkins/jenkins:lts
Open Jenkins
http://localhost:8080
Get Admin Password
docker exec jenkins-container cat /var/jenkins_home/secrets/initialAdminPassword
🔁 4. CI/CD Pipeline (Jenkinsfile)
pipeline {
    agent any

    environment {
        IMAGE_NAME = 'feedback-app'
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'YOUR_GITHUB_REPO_LINK'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Remove Old Container') {
            steps {
                sh "docker rm -f ${IMAGE_NAME} || true"
            }
        }

        stage('Run Container') {
            steps {
                sh "docker run -d -p 5000:5000 --name ${IMAGE_NAME} ${IMAGE_NAME}"
            }
        }

        stage('Test Application') {
            steps {
                sh "curl http://localhost:5000"
            }
        }
    }
}
🔄 5. CI/CD Workflow
GitHub Push
     ↓
Jenkins Trigger (Poll SCM / Manual / Webhook)
     ↓
Clone Repository
     ↓
Docker Build Image
     ↓
Remove Old Container
     ↓
Run New Container
     ↓
Test Application
🧪 6. Testing
curl http://localhost:5000

Or open in browser:

http://localhost:5000
⭐ Features Demonstrated
✔ Flask Web App
✔ GitHub Version Control
✔ Jenkins CI Pipeline
✔ Docker Containerization
✔ Automated Build & Deploy
✔ Basic API Testing (curl)
🎯 Outcome

After GitHub push:

✔ Jenkins automatically triggers build
✔ Docker image is created
✔ Old container is removed
✔ New container is deployed
✔ Application runs successfully on port 5000
✔ Build status is shown in Jenkins dashboard

🧠 Viva Points (Important)
Why Docker? → Consistent environment
Why Jenkins? → Automation of CI/CD
Why Flask? → Lightweight web framework
Why EXPOSE 5000? → Container networking
Why remove old container? → Avoid port conflicts