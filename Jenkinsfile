pipeline {
    agent {label 'agent-1'}

    stages {
        stage('Code') {
            steps {
                echo 'Cloning the code'
                git url: "https://github.com/arupsscet1-buff/python-mysql-db-proj-1.git", branch:"main"
                echo 'Cloning successful'
            }
        }
        stage('Build') {
            steps {
                echo 'Building the code'
                sh 'docker build -t python-sql-app:latest .'
                echo 'Image build successful'
            }
        }
        stage('Pushing the code to docker hub') {
            steps {
                withCredentials([usernamePassword(
                credentialsId: 'docker-hub-cred',
                usernameVariable: 'dockerHubUser',
                passwordVariable: 'dockerHubPass')])
                {
                sh '''#!/bin/bash
               
                docker login -u $dockerHubUser -p $dockerHubPass
                docker tag python-sql-app:latest $dockerHubUser/python-sql-app:latest
                docker push arupsscet1/python-sql-app:latest
                '''
                echo 'Image Push successful'
                }
            }
        }
        stage('Cleanup Old Containers') {
            steps {
                echo 'removing the old containers'
                sh 'docker rm -f python-sql-app || true'
                echo 'Image build successful'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the code'
                sh 'docker run -d -p 5000:5000 --name python-sql-app python-sql-app:latest'
                echo 'Deployment successful'
            }
        }
    }
}
