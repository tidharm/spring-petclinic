# Spring PetClinic Sample Application [![Build Status](https://travis-ci.org/spring-projects/spring-petclinic.png?branch=main)](https://travis-ci.org/spring-projects/spring-petclinic/)

## Overview
PetClinic is a [Spring Boot](https://spring.io/guides/gs/spring-boot) application built using [Maven](https://spring.io/guides/gs/maven/) and packaged as a Docker image.

### Credit
This project is based on the <a href="https://github.com/spring-projects/spring-petclinic">spring-petclinic</a> project by <a href="https://github.com/spring-projects">spring-projects</a>.  
Please refer to the original repository for more details.

## Prerequisites
- JDK 8
- Maven 3.6.0 or later
- Docker 18.0 or later

## Building and running PetClinic locally
```
git clone https://github.com/tidharm/spring-petclinic.git
cd spring-petclinic
mvn clean package dockerfile:build
docker run -d --name petclinic -p 8080:8080 tidharm/spring-petclinic:2.4.5
```

You can then access petclinic here: http://localhost:8080/

<img width="1042" alt="petclinic-screenshot" src="https://cloud.githubusercontent.com/assets/838318/19727082/2aee6d6c-9b8e-11e6-81fe-e889a5ddfded.png">

(Source: <a href="https://github.com/spring-projects/spring-petclinic/blob/main/readme.md">spring-projects/spring-petclini</a>)  
  

> NOTE: The PetClinic application expects HTTP access over port 8080. The above `docker run` command shows how to map port 8080 on your host into port 8080 inside the container.  
If port 8080 is already taken on your host, you can choose any other port by modifying the `-p` argument:  
`docker run -d --name petclinic -p 9999:8080 tidharm/spring-petclinic:2.4.5`

## Building and running PetClinic using Jenkins
1. Create a new <a href="https://www.jenkins.io/doc/book/pipeline/">Jenkins pipeline</a>
1. In the **General** section, check `GitHub project` and specify the Project url `https://github.com/tidharm/spring-petclinic.git/`
1. _Optional_: In the **Build Triggers** section, check `GitHub hook trigger for GITScm polling` to trigger the build on every push.
1. In the **Pipeline** section:
    1. Click the **Definition** dropdown box and select `Pipeline script from SCM`
    1. Click the **SCM** dropdown box and select `Git`
    1. Under **Repositories**, enter the **Repository URL** `https://github.com/tidharm/spring-petclinic.git`
    1. Under **Credentials** enter (or add) your GitHub credentials set
    1. Under **Branches to build**, enter the **BRanch Specifier** `*/main`
    1. Under **Script Path**, enter `Jenkinsfile` (the Jenkinsfile is located in the repository root)
1. Click **Save**

### Accessing the image
TBD

# License

The Spring PetClinic sample application is released under version 2.0 of the [Apache License](https://www.apache.org/licenses/LICENSE-2.0).

[spring-petclinic]: https://github.com/spring-projects/spring-petclinic
[spring-framework-petclinic]: https://github.com/spring-petclinic/spring-framework-petclinic
[spring-petclinic-angularjs]: https://github.com/spring-petclinic/spring-petclinic-angularjs 
[javaconfig branch]: https://github.com/spring-petclinic/spring-framework-petclinic/tree/javaconfig
[spring-petclinic-angular]: https://github.com/spring-petclinic/spring-petclinic-angular
[spring-petclinic-microservices]: https://github.com/spring-petclinic/spring-petclinic-microservices
[spring-petclinic-reactjs]: https://github.com/spring-petclinic/spring-petclinic-reactjs
[spring-petclinic-graphql]: https://github.com/spring-petclinic/spring-petclinic-graphql
[spring-petclinic-kotlin]: https://github.com/spring-petclinic/spring-petclinic-kotlin
[spring-petclinic-rest]: https://github.com/spring-petclinic/spring-petclinic-rest
