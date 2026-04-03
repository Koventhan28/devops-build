pipeline {
    agent any 
    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/Koventhan28/devops-build.git', branch: 'master'
            }
        }
           stage('Building docker images'){
               steps {
                sh "bash -x build.sh"       
           } 
           } 
           stage('Pushing docker images'){
                steps {
                sh "bash -x deploy.sh"       
           } 
           } 
    }
}
