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
    command => 'apt-get install -y default-jdk default-jre',
	user    => root,
	timeout => 0,
  }
  

}