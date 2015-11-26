sudo -i

#ipconfig | find "IP Address" > \File.txt
#< \File.txt SET /P first_ip=
#ECHO %first_ip%> \File.txt

cat /etc/hosts > /etc/newFile
rm /etc/hosts
echo "192.168.1.98   master-VirtualBox.local  puppetmaster"  >> /etc/hosts
echo "192.168.1.97    agent1-VirtualBox.local        puppet"  >> /etc/hosts
echo "127.0.0.1       agent1-VirtualBox.local        puppet"  >> /etc/hosts

echo "127.0.1.1       agent1-VirtualBox.local        puppet"  >> /etc/hosts
cat /etc/newFile >> /etc/hosts

sed -i '14i\runinterval = 60' >> /etc/puppet/puppet.conf

apt-get update 

apt-get install –y openssh-client openssh-server 

apt-get install –y ssh

service ssh restart

apt-get install -y puppet 

puppet resource service puppet ensure=running enable=true

puppet agent --test --server=master-VirtualBox.local

service puppet stop

service puppet start

puppet agent --enable

puppet agent --test --server=master-VirtualBox.local