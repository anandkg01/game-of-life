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
           
           stage ('Code Review') {

            steps {
                withMaven(maven : 'maven_3_5_4') {
                    sh 'mvn pmd:pmd' 
                }
                
            }
        }


        stage ('Deployment Stage') {
            steps {
                withMaven(maven : 'maven_3_5_4') {
                    sh 'mvn deploy'
                }
            }
        }
    }
}
