pipeline {
    agent any

    tools {
        terraform 'terraform-v1'
    }
    stages {
        stage ("checkout from GIT") {
            steps {
                git branch: 'main', credentialsId: 'iac_git_hub', url: 'https://github.com/ahmedmansour5/terraform-oci.git'
            }
        }
        stage ("terraform init") {
            steps {
                sh 'terraform init'
            }
        }
        stage ("terraform fmt") {
            steps {
                sh 'terraform fmt'
            }
        }
        stage ("terraform validate") {
            steps {
                sh 'terraform validate'
            }
        }
        stage ("terrafrom plan") {
            steps {
                sh 'terraform plan'
            }
        }
        stage ("terraform destroy") {
            steps {
                sh 'terraform destroy --auto-approve'
            }
        }
    }
}
