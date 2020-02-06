pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }

    stage('Checkout') {
        git url: 'https://github.com/daizpuru/tallerAltia.git'
    }

    stage('Build') {
        sh 'mvn -B -DskipTests clean package'
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
