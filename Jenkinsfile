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
                cobertura autoUpdateHealth: false, autoUpdateStability: false, coberturaReportFile: '**/target/site/cobertura/coverage.xml', conditionalCoverageTargets: '70, 0, 0', failUnhealthy: false, failUnstable: false, lineCoverageTargets: '80, 0, 0', maxNumberOfBuilds: 0, methodCoverageTargets: '80, 0, 0', onlyStable: false, sourceEncoding: 'ASCII', zoomCoverageChart: false
            }
        }
           
           stage ('Code Review') {

            steps {
                withMaven(maven : 'maven_3_5_4') {
                    sh 'mvn pmd:pmd' 
                }
                pmd canComputeNew: false, defaultEncoding: '', healthy: '', pattern: ' **/pmd.xml', unHealthy: ''
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
