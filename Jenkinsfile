pipeline {
    agent any

    stages {

        stage('Vérification environnement') {
            steps {
                bat 'where python'
                bat 'python --version'
                bat 'python -m pip --version'
            }
        }

        stage('Tests unitaires') {
            steps {
                bat '.\\run_unitaire.bat'
            }
        }

        stage('Tests API') {
            steps {
                bat '.\\run_api.bat'
            }
        }

        stage('Tests IHM') {
            steps {
                bat '.\\run_ihm.bat'
            }
        }
    }

    post {
        success {
            echo 'Tous les tests ont réussi'
        }

        failure {
            echo 'Au moins un test a échoué'
        }
    }
}

