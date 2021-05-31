pipeline {
    agent any
    tools {
        maven 'Maven 3.6.2'
        jdk 'jdk8'
    }
    stages {
        stage ('Environment') {
            steps {
                sh '''
                    echo "PATH: ${PATH}"
                    echo "M2_HOME: ${M2_HOME}"
                    echo "JAVA_HOME: ${JAVA_HOME}"
                '''
            }
        }

        stage ('Build') {
            steps {
                sh 'mvn clean package dockerfile:build'
            }
            post {
                success {
                    sh '''
					              echo "Run the petclinic container using the following command:"
						            echo "docker run -d --name petclinic -p 8888:8080 tidharm/spring-petclinic:2.4.5"
					          '''
                }
            }
        }
    }
}
