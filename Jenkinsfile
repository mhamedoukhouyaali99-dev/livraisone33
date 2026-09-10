pipeline {
    agent any

    environment {
        PYTHON_HOME = "C:\\Users\\M'hamed\\AppData\\Local\\Programs\\Python\\Python311"
        PATH = "${PYTHON_HOME};${PYTHON_HOME}\\Scripts;${env.PATH}"
    }

    stages {

        stage('Vérification environnement') {
            steps {
                bat '''
                    echo ========================================
                    echo VERIFICATION ENVIRONNEMENT
                    echo ========================================

                    echo PATH :
                    echo %PATH%

                    echo Python :
                    "%PYTHON_HOME%\\python.exe" --version

                    echo Pip :
                    "%PYTHON_HOME%\\Scripts\\pip.exe" --version
                '''
            }
        }

        stage('Tests unitaires') {
            steps {
                bat 'run_unitaire.bat'
            }
        }

        stage('Tests API') {
            steps {
                bat 'run_api.bat'
            }
        }

        stage('Tests IHM') {
            steps {
                bat 'run_ihm.bat'
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