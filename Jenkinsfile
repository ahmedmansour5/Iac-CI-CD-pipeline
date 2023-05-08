pipeline {
    agent any

    tools {
        terraform 'terraform-v1'
    }
    environment {
        TF_VAR_region           = credentials('jenkins-terraform-region')
        TF_VAR_tenancy_ocid     = credentials('jenkins-terraform-tenancy')
        TF_VAR_compartment_ocid = credentials('jenkins-terraform-compartment')
        TF_VAR_user_ocid        = credentials('jenkins-terraform-user_ocid')
        TF_VAR_fingerprint      = credentials('jenkins-terraform-fingerprint')
        TF_VAR_private_key_path = credentials('jenkins-terraform-private_key_path')
    }
    stages {
        stage ("checkout from GIT") {
            steps {
                git branch: 'terraform', credentialsId: 'iac_git_hub', url: 'https://github.com/ahmedmansour5/CI-CD-pipeline.git'
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
                sh 'terraform plan -out plan'
            }
        }
        stage ("terraform action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh 'terraform ${action} --auto-approve'
            }
        }
    }
}
