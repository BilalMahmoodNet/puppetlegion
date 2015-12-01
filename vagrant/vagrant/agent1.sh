sudo -i

#ipconfig | find "IP Address" > \File.txt
#< \File.txt SET /P first_ip=
#ECHO %first_ip%> \File.txt

cat /etc/hosts > /etc/newFile
rm /etc/hosts
echo "192.168.1.95    master-VirtualBox.local  puppetmaster"  >> /etc/hosts
echo "192.168.1.94    agent1-VirtualBox.local        puppet"  >> /etc/hosts
echo "127.0.0.1       agent1-VirtualBox.local        puppet"  >> /etc/hosts

echo "127.0.1.1       agent1-VirtualBox.local        puppet"  >> /etc/hosts
cat /etc/newFile >> /etc/hosts

sed -i '14i ' 

echo "[agent]" >> /etc/puppet/puppet.conf
echo "runinterval = 3000" >> /etc/puppet/puppet.conf

apt-get update 

#apt-get install –y openssh-client openssh-server 

#apt-get install –y ssh

service ssh restart

curl -k https://192.168.1.95/packages/current/install.bash | sudo bash

puppet resource service puppet ensure=running enable=true


#to ensure nexus works
sudo reboot

echo "RUN_AS_USER=root" >> /usr/local/nexus-2.11.4-01/bin/nexus

cd /usr/local/nexus-2.11.4-01/

./bin/nexus start