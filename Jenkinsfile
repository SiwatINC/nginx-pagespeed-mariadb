pipeline {
    agent any
  
    stages {
        stage('Clone') { 
            steps {
                git branch: 'main', url: 'https://github.com/SiwatINC/nginx-pagespeed-mariadb'
            }
        } 
        stage('Build Docker Image') {
            steps {
                script {
                    image = docker.build("siwatinc/nginx-pagespeed-mariadb:latest",'./ --no-cache')
                    
                }
            }
        }
        stage('Publish Docker Image') {
            steps {
                script {
                    docker.withRegistry("https://ghcr.io/v2") {
                        image.push()
                        image.push('php7.4')
                    }
                }
            }
        }
    }
}
