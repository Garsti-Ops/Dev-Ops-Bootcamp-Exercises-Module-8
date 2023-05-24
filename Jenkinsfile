@Library('my-awesome-library') _

pipeline {
    agent any
    stages {
        stage("Increment Version") {
            steps {
                script {
                    dir("app") {
                        inreaseVersion env
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
                    sh 'docker build . -t garstiops/garstiges-secret-repo:node-app-${NEW_VERSION}'
                    sh 'echo ${PASSWORD} | docker login -u ${UNAME} --password-stdin'
                    sh 'docker push garstiops/garstiges-secret-repo:node-app-${NEW_VERSION}'
                }
            }
        }
        stage("Commit Version increment") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'github-cli', usernameVariable: 'UNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'git config --global user.email "jenkins@example.com"'
                    sh 'git config --global user.name "jenkins"'

                    sh "git remote set-url origin https://${UNAME}:${PASSWORD}@github.com/Garsti-Ops/Dev-Ops-Bootcamp-Exercises-Module-8.git"
                    sh 'git add .'
                    sh 'git commit -m "ci: version increment"'
                    sh 'git push origin HEAD:${BRANCH_NAME}'
                }

            }
        }
    }

}