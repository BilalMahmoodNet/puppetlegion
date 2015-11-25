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

#  exec { 'wget_jira':
 #  user => root,
 #  cwd  => '/opt/',
 #  command => 'wget http://192.168.1.17/jira.bin',
 #   notify => Exec['chmod_jira'],
 # }

# exec { 'chmod_jira':
 #  user => root,
  # cwd  => '/opt/',
  # command => 'chmod +x jira.bin',
  # notify => Exec['execute'],
# }
  exec { 'execute':
    user => root,
    path => '/opt/',
    command => './jira.bin',
    notify => Exec['exc1'],
  }

   exec {'exc1':
     user => root,
     command => 'printf "\y\no\n2\n\opt/jira\n/var/atlassian/application-data/jira\n1\ny\n"',

    }
}
