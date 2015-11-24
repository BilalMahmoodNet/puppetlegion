class nexus{

  Exec {
    path => [
	  '/usr/local/bin',
	  '/opt/local/bin',
	  '/usr/bin',
	  '/bin',
	  '/sbin'],
	logoutput => true,
  }
  
  exec{ 'nexus_down':
	command => 'wget http://www.sonatype.org/downloads/nexus-latest-bundle.tar.gz',
	notify  => Exec['nexus_move'],
  }
  
  exec{ 'nexus_move':
    command => 'cp nexus-2.11.4-01-bundle.tar.gz /usr/local',
	user    => root,
	notify  => Exec['nexus_tar'],
  
  exec { 'nexus_tar':
    cwd     => '/usr/local',
	command => 'tar xzvf nexus-2.11.4-01-bundle.tar.gz',
    user    => 'root',	
	notify  => Exec['ln_nexus'],
  }
  
  exec { 'ln_nexus':
    cwd     => '/usr/local',
	user    => root,
	command => 'ln -s nexus2.11.4-01 nexus',
  }
  
  
  
}