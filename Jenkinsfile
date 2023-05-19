pipeline {
    agent any
    stages {
        stage("Increment Version") {
            steps {
                script {
                    dir("app") {
                        sh 'npm version minor'

                        def packageJson = readJSON file: 'package.json'
                        def version = packageJson.version

                        env.NEW_VERSION = "$version-$BUILD_NUMBER"
                    }
                }
            }

        }
        stage("Tests") {
            steps {
                dir("app") {
                    sh 'npm install && npm run test'
                }
            }

        }
        /*stage("Build Docker Image and push to Repository") {
            steps {
                sh 'docker build . -t garstiops/garstiges-secret-repo:node-app-$NEW_VERSION'
            }
        }*/
    }

}