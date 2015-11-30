class nexus {

  Exec {
    path => [
	  '/usr/local/bin',
	  '/opt/local/bin',
	  '/usr/bin',
	  '/bin',
	  '/sbin'],
	logoutput => true,
  }
   
  #this downloads the file 
  
  exec{ 'nexus_down':
	command => 'wget http://192.168.1.15/nexus-latest-bundle.tar.gz',
	notify  => Exec['nexus_move'],
	timeout => 0,
  }
  
  exec { 'nexus_move':
    command => 'cp nexus-latest-bundle.tar.gz /usr/local',
	user    => root,
	notify  => Exec['nexus_tar'],
  }
  
  exec { 'nexus_tar':
    cwd     => '/usr/local',
	command => 'tar xzvf nexus-latest-bundle.tar.gz',
    user    => 'root',	
	notify  => Exec['ln_nexus'],
  }
  
  exec { 'ln_nexus':
    cwd     => '/usr/local',
	user    => root,
	command => 'ln -s nexus-2.11.4-01 nexus',
  }
  
  
  
}