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

  
  exec { 'nexus_down':
        user    => root,
        cwd     => '/usr/local',
	command => 'wget http://192.168.1.15/nexus-latest-bundle.tar.gz',
	notify  => Exec['nexus_tar'],
	timeout => 0,
       } 
  
  exec { 'nexus_tar':
        cwd     => '/usr/local',
       command => 'tar -xvzf nexus-latest-bundle.tar.gz',
        user    => 'root',
        before  => Exec['ln_nexus'],
       }

  exec { 'ln_nexus':
        cwd     => '/usr/local/',
	user    => root,
	command => 'ln -s nexus-2.11.4-01/ nexus',
        notify  => File['/etc/profile'],
       }

 file { '/etc/profile':
        owner  => root,
        source => 'puppet:///modules/nexus/profile',
        notify => File['/usr/local/nexus-2.11.4-01/bin/nexus'],
      }

 file { '/usr/local/nexus-2.11.4-01/bin/nexus':
        owner  => root,
        source => 'puppet:///modules/nexus/nexus',
        notify => File['/etc/init.d/nexus'],      
      }
 
 file { '/etc/init.d/nexus':
         owner   => root,
         source => 'puppet:///modules/nexus/nexus2',
         before => Exec['chmod_nexus'],
      }
 
 exec { 'chmod_nexus':
        user => root,
        cwd  => '/usr/local/nexus-2.11.4-01/bin',
        command => 'chmod 755 /etc/init.d/nexus',
      }
}
