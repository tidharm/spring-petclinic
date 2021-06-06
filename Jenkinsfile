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
                bat 'mvn clean package dockerfile:build -DskipTests'
            }
            post {
                success {
                    bat '''
                        for /F "tokens=* USEBACKQ" %%F in (`docker image ls -f "reference=tidharm/spring-petclinic" -q`) do (set imageId=%%F)
                        docker image save %imageId% -o "tidharm_spring-petclinic_2.4.5.tar.gz"
                    '''
                    bat '''
                        echo "Run the petclinic container using the following command:"
                        echo "docker run -d --name petclinic -p 8888:8080 tidharm/spring-petclinic:2.4.5"
                    '''
                }
            }
        }
    }
}
