node 'test02.edureka.com'{

# install OpenJDK 8 
class {'java':
        distribution => 'jdk',
        package => 'openjdk-8-jdk',
      }

# reference the tomcat instance.. 
class {'tomcat':}

# install tomcat 8 from URL. This will download the file from the specified URL and install the same. 

tomcat::install { '/opt/tomcat':
                   source_url => 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.23/bin/apache-tomcat-8.0.23.tar.gz',
                }
# set the instance directory and CATALINE_HOME/CATALINA_BASE directories. 
tomcat::instance { 'default':
                   catalina_home => '/opt/tomcat',
                   catalina_base => '/opt/tomcat',
                 }

# install a war addressbook.war. The file addressbook.war is located in 
# /etc/puppet/modules/tomcat/files. (Assuming default module path in Puppet 3.7.x)
# If this file does not exist, create it manually or use a file resource to create the same. 
tomcat::war { 'addressbook.war':
               catalina_base => '/opt/tomcat',
               war_source => 'puppet:///modules/tomcat/mycode.war',
            }
            
}
