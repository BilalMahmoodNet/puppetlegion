class jira::install{
  Exec {
    path => [
      '/usr/local/bin',
      '/opt/local/bin',
      '/usr/bin',
      '/usr/sbin',
      '/bin',
      '/sbin'],
    logoutput => true,
  }

  #download the file
  exec { 'wget_jira':
    user    => root,
    cwd     => '/opt/',
    command => 'wget http://192.168.1.17/jira.bin',
    notify  => Exec['chmod_jira'],
    timeout => 0,
  }

  
 exec { 'chmod_jira':
   user    => root,
   cwd     => '/opt/',
   command => 'chmod a+x jira.bin',
   notify  => Exec['ran'],
 }
 
  exec {'ran':
    user    => root,
    cwd     => '/opt/',
    command =>'printf "\no\n2\n\n\n2\n8085\n8007\ny\n" | ./jira.bin',
  }
}

