pipeline {
    agent any
        stages {
            stage('Build & Push') {
                steps {
                    script {
                        //if (env.BRANCH_NAME == 'dev') {
                        echo $env
                        echo $BRANCH_NAME
                        sh "./build.sh koventhan/ecommercedev latest"
                       // docker.withRegistry('', 'dockerregistry') {
                        sh "docker push koventhan/ecommercedev:latest"
                //}
              /*  } else if (env.BRANCH_NAME == 'master') {
                        sh "./build.sh koventhan/ecommerceprod latest"
                        docker.withRegistry('', 'dockerregistry') {
                        sh "docker push koventhan/ecommerceprod:latest"
                */}
            }
        }
    }
}


