include 'docker'

file { '/usr/local/tomcat/webapps':
          ensure => present,
          source => ".",
}
