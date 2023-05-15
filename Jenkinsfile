pipeline {
    agent {
        any
    }
    stages {
        stage("Increment Version") {
            // Read Version from build.gradle
            def matcher = readFile('package.json') =~ '"version": "(.+)"'
            def version = matcher[0][1]
            def splitVersion = version.split("\\.")

            // Increment Patchversion
            int patchVersion = Integer.valueOf(splitVersion[2])
            patchVersion++

            // Update Version
            def incrementedVersion = splitVersion[0] + "." + splitVersion[1] + "." + patchVersion
            $VERSION = incrementedVersion
            echo incrementedVersion
            //def buildGradle = new File("")

        }
        stage("Tests") {
            steps {
                sh 'npm run test'
            }

        }
        /*stage("Build Docker Image and push to Repository") {
            steps {
                sh 'docker build . -t garstiops/garstiges-secret-repo:node-app-$VERSION'
            }
        }*/
    }

}