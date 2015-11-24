sudo -i

apt-get update 

apt-get install –y openssh-client openssh-server 

apt-get install –y ssh

service ssh restart

apt-get install -y puppet 

#puppet resource service puppet ensure=running enable=true

#apt-get install -y facter 

#apt-get install -y tree

echo "10.0.2.15    master-VirtualBox.local  puppetmaster"  >> /etc/hosts
echo "192.168.1.60    agent1-VirtualBox.local        puppet"  >> /etc/hosts
echo "127.0.0.1       agent1-VirtualBox.local        puppet"  >> /etc/hosts

#puppet agent --test --server=master-VirtualBox.local


#puppet agent --test --server=master-VirtualBox.local
