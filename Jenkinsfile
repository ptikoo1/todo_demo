pipeline {
    agent {
	label 'docker-agent'
    }

    stages {
	stage('Prepare') {
            steps {
                sh 'export PATH=$PATH:/usr/bin'
		sh '''
                    if ! which docker; then
                        apt-get update && apt-get install -y docker.io
                    fi
                '''
            }
        }
	stage('Build') {
            steps {
                // Build the Docker image
                sh 'docker build -t todo-list-image .'
            }
        }
        stage('Test') {
            steps {
                // Run tests (replace with your actual test command)
                sh 'docker run todo-list-image python manage.py test'
            }
        }
        stage('Deploy') {
            steps {
                // Deploy to Minikube (replace with your deployment logic)
                sh 'kubectl apply -f deployment.yml'
            }
        }
    }
}
