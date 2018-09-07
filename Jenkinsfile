pipeline {
    
    environment {
    registry = "anandgupta01/game_of_life"
    registryCredential = 'dockerHubCredential'
    dockerImage = ''
  }
    
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
                sh 'COPY /var/jenkins_home/workspace/Build_Pipeline/gameoflife-web/target/gameoflife.war  /etc/puppet/modules/tomcat/gameoflife.war'
            }
        }
           
       /* In order to push the image to DockerHub:
         * First build it, and push it */   
           
        stage('Build the image') {
            steps {
                    echo 'Building image..'
                
                    script {
                    dockerImage  = docker.build registry + ":$BUILD_NUMBER"
                    }
                }
        }

        stage('Deploy to Docker Hub') {
            
            steps {
                    echo 'Deploy to Docker Hub...'
                
                    script {
            
                        docker.withRegistry('', registryCredential) {
                            dockerImage.push("${env.BUILD_NUMBER}")
                            dockerImage.push("latest")
                        }
                    }
                }
        }
    }
}
