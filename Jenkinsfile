env.UNIX = isUnix()
def genSh(cmd) {
    if (Boolean.valueOf(env.UNIX)) {
        sh cmd
    }
    else {
        bat cmd
   }
}

pipeline {
    agent { label 'main' }
    tools {
        maven 'Maven362'
        jdk 'JDK8'
    }
    stages {
        stage ('Environment') {
            steps {
                genSh '''
                    echo "PATH: ${PATH} %PATH%"
                    echo "M2_HOME: ${M2_HOME} %M2_HOME%"
                    echo "JAVA_HOME: ${JAVA_HOME} %JAVA_HOME%"
                '''
            }
        }

        stage ('Build') {
            steps {
                genSh 'mvn clean package dockerfile:build'
            }
            post {
                success {
                    genSh '''
                        echo "Run the petclinic container using the following command:"
                        echo "docker run -d --name petclinic -p 8888:8080 tidharm/spring-petclinic:2.4.5"
                    '''
                }
            }
        }
    }
}
