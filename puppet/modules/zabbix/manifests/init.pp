class zabbix {

  Exec {
    path => [
	  '/usr/local/bin',
	  '/opt/local/bin',
	  '/usr/bin',
	  '/bin',
	  '/sbin'],
	logoutput => on_failure,
    }
	
  exec { 'update_zab':
    command => 'apt-get update',
    user    => 'root',
    before  => Exec['get_zab'],
  }
  
  
  exec { 'get_zab':
    command => 'sudo apt-get install zabbix-agent',
    user    => 'root',
    before  => Exec['change_server'],
  }
  
  exec { 'change_server':
    command => "sed -i '85i/.*/Server=192.168.1.28' /etc/zabbix/zabbix_agentd.conf",
	user    => 'root',
	before  => Exec['change_host'],
	}
	
	exec { 'change_host':
    command => "sed -i '137i/.*/Hostname=master-VirtualBox.local' /etc/zabbix/zabbix_agentd.conf",
	user    => 'root',
	before  => Exec['restart_zabbix'],
	}
  
  
  exec { 'restart_zabbix':
    command => 'service zabbix-agent restart',
	user    => 'root',
	}
	
}

  