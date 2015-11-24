sudo -i
cat /etc/hosts > /etc/newFile
rm /etc/hosts
echo '127.0.0.1       master-VirtualBox.local puppetmaster puppet'  >> /etc/hosts
echo '192.168.1.60    agent1-VirtualBox.local puppet'               >> /etc/hosts
echo /etc/newFile > /etc/hosts

sed -i -e '127.0.0.1       master-VirtualBox.local puppetmaster puppet' /etc/newFile


apt-get update 

apt-get install –y ssh

service ssh restart

apt-get install -y puppetmaster 

puppet resource service puppetmaster ensure=running enable=true

#apt-get install -y git

#git config --global user.name "Your Name"
#git config --global user.email "youremail@domain.com"

#git config --list





#puppet cert list --all

#puppet cert sign --all



