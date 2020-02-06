node {
    withMaven(maven:'maven') {
        stage('Checkout') {
            git url: 'https://github.com/daizpuru/tallerAltia.git'
        }

        stage('Build') {
            sh 'mvn clean install'

            def pom = readMavenPom file:'pom.xml'
            print pom.version
            env.version = pom.version
        }

        stage('Image') {
            dir ('tallerAltia') {
                def app = docker.build "localhost:5000/testAltia:1.0"
                app.push()
            }
        }

        stage ('Run') {
            docker.image("localhost:5000/testAltia:1.0").run('-p 3333:3333 --name mi_app')
        }
    }
}
