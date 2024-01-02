pipeline {
    agent any
    stages {
        stage('Hello') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'master') {
                        echo 'Hello from main branch'
                    } else if (env.BUILD_USER == 'admin') {
                        echo 'Job run by admin user'
                    } else {
                        sh "echo 'Hello from ${env.BRANCH_NAME} branch!'"
                    }
                }
            }
        }
    }
}
