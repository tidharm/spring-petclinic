pipeline {
    agent any
    tools {
        maven 'Maven362'
        jdk 'JDK8'
    }
    stages {
        stage ('Build') {
            steps {
                sh 'mvn clean package dockerfile:build -DskipTests'
            }
            post {
                success {
                    sh '''
                        imageId="$(docker image ls -f "reference=tidharm/spring-petclinic" -q)"
                        docker image save $imageId -o "tidharm-spring-petclinic-2.4.5.tar.gz"
                        echo "Run the petclinic container using the following command:"
                        echo "docker run -d --name petclinic -p 8888:8080 tidharm/spring-petclinic:2.4.5"
                    '''
                }
            }
        }
    }
}
