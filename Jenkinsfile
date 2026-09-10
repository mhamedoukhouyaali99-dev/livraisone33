pipeline {
    agent any

    stages {

        stage('Récupération du code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/mhamedoukhouyaali99-dev/livraisone33.git'
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

    post {
        success {
            echo 'Tous les tests ont réussi'
        }
        failure {
            echo 'Au moins un test a échoué'
        }
    }
}