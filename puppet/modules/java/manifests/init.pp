class java {
  
  Exec {
    path => [
	  '/usr/local/bin',
	  '/opt/local/bin',
	  '/usr/bin',
	  '/bin',
	  '/sbin'],
	logoutput => on_failure,
  }
  
  
  exec { 'install_java':
    command => 'apt-get install -y default-jdk',
	user    => root,
	timeout => 0,
	before  => Exec['install_jre'],
  }
  
  exec { 'install_jre':
    command => 'apt-get install -y default-jre',
	user    => root,
	timeout => 0,
  }

}