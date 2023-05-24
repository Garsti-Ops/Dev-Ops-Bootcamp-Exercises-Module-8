@Library('my-awesome-library') _

pipeline {
    agent any
    stages {
        stage("Increment Version") {
            steps {
                script {
                    dir("app") {
                        inreaseVersion(env)
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
        stage("Build Docker Image and push to Repository") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'UNAME', passwordVariable: 'PASSWORD')]) {
                    buildAndPushImage UNAME PASSWORD NEW_VERSION
                }
            }
            stage("Commit Version increment") {
                steps {
                    withCredentials([usernamePassword(credentialsId: 'github-cli', usernameVariable: 'UNAME', passwordVariable: 'PASSWORD')]) {
                        commitVersionIncrease UNAME PASSWORD BRANCH_NAME
                    }

                }
            }
        }
    }
}