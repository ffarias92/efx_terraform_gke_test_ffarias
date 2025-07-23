pipeline {
    agent any

    environment {
        GCP_CREDENTIALS_FILE = "${env.WORKSPACE}/credenciales.json"
        PROJECT_ID = "efx-terraform-test-1-ffarias"
        REGION = "us-central1"
        GKE_CLUSTER_NAME = "efx-gke-ffarias"
    }

    stages {
        stage('Docker Build') {
            steps {
                script {
                    dir('kb8s/Docker - Nginx Files' ) {
                        sh 'docker build -t nginx_efx:1.0 .'
                        sh 'docker push efx_docker_ffarias/nginx_efx:1.0'  #Simulamos el push a un dockerhub ficticio
                        echo 'Dockerfile creado y subido al repositorio exitosamente'
                    }
                }
            }
        }

        stage('Terraform Instalacion y Verificacion') {
            steps {
                script {
                    withCredentials([file(credentialsId: 'gcp-credentials', variable: 'GCP_SERVICE_ACCOUNT_KEY')]) {
                        sh "echo \"$GCP_SERVICE_ACCOUNT_KEY\" > ${GCP_CREDENTIALS_FILE}"
                    }

                    dir('terraform') { 
                        sh 'terraform init'
                        sh 'terraform plan -out=tfplan'
                    }
                }
            }
        }

        stage('Terraform Apply - crear cluster de Kubernetes') {
            steps {
                script {
                    dir('terraform') {
                        sh 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }

        stage('Obtener credenciales de kubernetes') {
            steps {
                script {
                    sh "gcloud container clusters get-credentials ${GKE_CLUSTER_NAME} --region ${REGION} --project ${PROJECT_ID}"
                }
            }
        }

        stage('Realizar el deployment') {
            steps {
                script {
                    dir('kb8s') {
                        sh 'kubectl apply -f namespace.yaml'
                        sh 'kubectl apply -f deployment.yaml'
                        sh 'kubectl apply -f loadbalancer.yaml' 
                }
            }
        }

        stage('Verificar el deployment') {
            steps {
                script {
                    sh 'kubectl get pods -n ns-nginx'
                    sh 'kubectl get services -n ns-nginx'
                    sh 'kubectl get deployments -n ns-nginx'
                }
            }
        }
    }

    post {
        always {
            cleanWs() 
        }
        failure {
            echo 'El Deployment ha fallado'
        }
        success {
            echo 'El Pipeline se ha ejecutado correctamente'
            }
        }
    }
}