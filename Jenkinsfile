pipeline {
    agent any
    tools {
        maven 'Maven362'
        jdk 'JDK8'
    }
    stages {
        stage ('Environment') {
            steps {
                bat '''
                    echo "PATH: ${PATH} %PATH%"
                    echo "M2_HOME: ${M2_HOME} %M2_HOME%"
                    echo "JAVA_HOME: ${JAVA_HOME} %JAVA_HOME%"
                '''
            }
        }

        stage ('Build') {
            steps {
                bat 'mvn clean package dockerfile:build'
            }
            post {
                success {
                    bat '''
                        echo "Run the petclinic container using the following command:"
                        echo "docker run -d --name petclinic -p 8888:8080 tidharm/spring-petclinic:2.4.5"
                    '''
                }
            }
        }
    }
}
