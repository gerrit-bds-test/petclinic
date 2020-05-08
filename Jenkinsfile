pipeline {
  environment {
    registry = "bds1959/petclinic"
    registryCredential = 'Dockerhub'
    dockerImage = ''
  }
  agent {
        label "master"
    }
    tools {
        // Note: this should match with the tool name configured in your jenkins instance (JENKINS_URL/configureTools/)
        maven "maven"
    }
  stages {
    stage('Cloning Git') {
            steps {
                    git credentialsId: '3419ab79-7cb1-4c0b-93ce-27610ae8f815', url: 'https://github.com/bds1959/spring-petclinic.git'
                }
    }
    stage("mvn build") {
            steps {
                script {
                    // Since unit testing is out of the scope we skip them
                    sh "mvn package -DskipTests=true"
                }
            }
    }
    stage('Building image') {
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
    }
    stage('Deploy Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                    }
                }
            }
    }
    stage('Remove Unused docker image') {
            steps{
                script {
                    sh "docker rmi $registry:$BUILD_NUMBER"
                }
            }
    }
    stage('Deploying cookbook on Node'){
            steps{
                script {
                    sshPublisher(publishers: [sshPublisherDesc(configName: 'bds7@bds7-Devops', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'cd /home/bds7/Downloads/chef-repo/cookbooks; knife upload cookbook pet_game; knife node run_list add bds20 \'recipe[pet_game::default]\' ', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '.', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '***/petclinic')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
                }
            }
    }        
  }
}
