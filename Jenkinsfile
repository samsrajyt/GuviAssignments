pipeline {   
  agent any 
  environment {
      DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
      
  stages {         
    stage("Delivery for Development Branch"){
        when {
            expression { env.BRANCH_NAME == 'Dev'}
        }
            steps{
                checkout([$class: 'GitSCM', branches: [[name: "Dev"]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'jenkins-testing', url: 'https://github.com/samsrajyt/GuviAssignments']]])
                output message: 'Git Checkout Completed'
                output message: 'Building Docker Image'
                sh 'docker build -t dockerhubusername/dockerhubreponame:$BUILD_NUMBER .'
                output message: 'logging in to Docker Hub'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                output message:  'Pushing Image'
                sh 'docker push samsraj/dev:reactapp_$BUILD_NUMBER'
                
                
                
            }
        }
    stage("Delivery for Production branch"){
        when {
            expression { env.BRANCH_NAME == 'master'}
        }
            steps{
                checkout([$class: 'GitSCM', branches: [[name: "master"]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'jenkins-testing', url: 'https://github.com/samsrajyt/GuviAssignments']]])
                output message: 'Git Checkout Completed'
                output message: 'Building Docker Image'
                sh 'docker build -t samsraj/prod:reactapp_final_$BUILD_NUMBER .'
                output message: 'logging in to Docker Hub'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                output message:  'Pushing Image'
                sh 'docker push samsraj/prod:reactapp_final_$BUILD_NUMBER'
                
            }
        }
    }
      
    

  
    post{
        always{
            sh 'docker logout'
        }
    }
  }
  
