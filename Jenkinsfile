pipeline {
    agent {
        label 'agent-1'
    }
    options {
        timeout(time: 30, unit: 'MINUTES')  // abort the build if not done in 30 min.
        disableConcurrentBuilds()
        ansiColor('xterm')                  // plugin
    }
    environment{
        def appVersion = ''          // declare global variable to use it in multiple stages
        nexusUrl='nexus.practicedevops.online:8081'
    }
    parameters {   //pass as input before build
        string(name: 'appVersion', defaultValue: '1.0.0', description: 'What is the application version?')
    }
    stages {
        stage('print the version'){
            steps{
                script{
                    echo "Application version: ${params.appVersion}"
                }
            }
        }
        stage('Init'){
            steps{
                sh """
                    cd terraform
                    terraform init
                """
            }
        }
        stage('Plan'){
            steps{
                sh """
                    pwd
                    cd terraform
                    terraform plan -var="app_version=${params.appVersion}"
                """
            }
        }
        stage('Deploy'){
            steps{
                sh """
                    cd terraform
                    terraform apply -auto-approve -var="app_version=${params.appVersion}"
                """
            }
        }
    }
    post {         // post build activities
        always { 
            echo 'I will always say Hello again!'
            deleteDir()             // deletes workspace (/home/ec2-user/agent-1/workspace/...) once build is completed
        }
        success { 
            echo 'I will run when pipeline is success'
        }
        failure { 
            echo 'I will run when pipeline is failure'
        }
    }
}