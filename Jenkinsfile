pipeline {
    agent any
    
       stages {
        stage ('Compile Stage') {

            steps {
                withMaven(maven : 'maven_3_5_4') {
                    sh 'mvn clean compile'
                }
            }
        }

        stage ('Testing Stage') {

            steps {
                withMaven(maven : 'maven_3_5_4') {
                    sh 'mvn test'
                }
            }
        }
           
        stage ('Report Generation') {

            steps {
                withMaven(maven : 'maven_3_5_4') {
                    sh 'mvn cobertura:cobertura'
                  }
                
            }
        }
           
        stage ('Package archieve') {

            steps {
                withMaven(maven : 'maven_3_5_4') {
                    sh 'mvn package'
                  }
                archive '**/target/gameoflife.war'
            }
        }
           
       /* In order to push the image to DockerHub:
         * First build it, and push it */   
           
        stage('Build the image') {
            steps {
                    echo 'Building image..'
                
                    script {
                    def app = docker.build("game-of-life:${env.BUILD_ID}")
                    }
                }
        }

        stage('Deploy to Docker Hub') {
            
            steps {
                    echo 'Deploy to Docker Hub...'
                
                    script {
            
                        docker.withRegistry('https://registry.hub.docker.com', 'dockerHubCredential') {
                            app.push("${env.BUILD_NUMBER}")
                            app.push("latest")
                        }
                    }
                }
        }
    }
}
