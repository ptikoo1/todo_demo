pipeline {
    agent {
        docker {
            image 'docker:dind'
            args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
	stage('Prepare') {
            steps {
                sh 'echo $PATH' // This should list running containers within the dind container
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
