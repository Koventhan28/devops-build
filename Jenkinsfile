pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh './build.sh'
            }
        }
        stage('Push') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh 'docker push koventhan/ecommercedev:latest'
                    } else if (env.BRANCH_NAME == 'master') {
                        sh 'docker push koventhan/ecommerceprod:latest'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}