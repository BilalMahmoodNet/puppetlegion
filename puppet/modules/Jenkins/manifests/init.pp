class jenkins {
  Exec {
    path => [
	  '/usr/local/bin',
	  '/opt/local/bin',
	  '/usr/bin',
	  '/bin',
	  '/sbin'],
	logoutput => true,
  }
  
  exec { 'jenkins_down':
    cwd     => '/opt/',
	command => 'wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -',
	notify  => Exec['jenkins_write'],
  }
  
  exec { 'jenkins_write':
    command => "sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'",
	notify  => Exec['jenkins_update'],
	user    => root,
  }
  
  exec { 'jenkins_update':
    command => 'apt-get update',
	user    => root,
	notify  => Exec['jenkins_install'],
  }
  
  package { 'jenkins':
    ensure => installed,
  }
	

}