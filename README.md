A Puppet Legion Project

To run open the command line and navigate to the folder puppetlegion/vagrant/vagrant
Then run the command vagrant up.

To ensure nexus works you have to run the following commands from the terminal. It can be found on http://192.168.1.195:8081

  sudo reboot

  echo "RUN_AS_USER=root" >> /usr/local/nexus-2.11.4-01/bin/nexus

  cd /usr/local/nexus-2.11.4-01/

  ./bin/nexus start

Puppet Enterprise can be found in the browser at https://192.168.1.195

Jenkins can be found at http://192.168.1.195:8080

Jira can be found at http://192.168.1.195:8085

Zabbix can be found in the browser at http://192.168.1.195/zabbix
Zabbix requires manual hosts to be added in the GUI, by going to configuration -> hosts

The dockerfile is located in the docker folder however it does not work due to an issue with virtual box