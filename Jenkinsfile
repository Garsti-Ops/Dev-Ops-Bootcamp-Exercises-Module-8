pipeline {
    agent any
    stages {
        stage("Increment Version") {
            steps {
                script {
                    // Read Version from build.gradle
                    def matcher = readFile('./app/package.json') =~ '"version": "(.+)"'
                    def version = matcher[0][1]
                    def splitVersion = version.split("\\.")

                    // Increment Patchversion
                    int patchVersion = Integer.valueOf(splitVersion[2])
                    patchVersion++

                    // Update Version
                    def incrementedVersion = splitVersion[0] + "." + splitVersion[1] + "." + patchVersion
                    $VERSION = incrementedVersion

                    def fileContent = new File('./app/package.json')
                    fileContent.replaceAll('"version": "${splitVersion[0] + "." + splitVersion[1] + splitVersion[2]}"')
//                    withAnt(installation: 'ant-1.10.13') {
//                        ant.replaceregexp(file: './app/package.json', match: '"version": "(.+)"', value: '"version": "${incrementedVersion}"')
//                    }
                }
            }

        }
        stage("Tests") {
            steps {
                sh 'cd ./app && npm run test'
            }

        }
        /*stage("Build Docker Image and push to Repository") {
            steps {
                sh 'docker build . -t garstiops/garstiges-secret-repo:node-app-$VERSION'
            }
        }*/
    }

}