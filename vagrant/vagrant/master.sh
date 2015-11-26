sudo -i

cat /etc/hosts > /etc/newFile
rm /etc/hosts
echo '127.0.0.1       master-VirtualBox.local puppetmaster puppet'  >> /etc/hosts
echo '192.168.1.98    master-VirtualBox.local puppet'               >> /etc/hosts
echo '192.168.1.98    master-VirtualBox.local'               >> /etc/hosts
cat /etc/newFile               >> /etc/hosts

echo 'autosign = true'         >> /etc/puppet/puppet.conf
echo '*.local'                 >> /etc/puppet/autosign.conf
echo 'agent1-VirtualBox.local' >> /etc/puppet/autosign.conf

echo '[master]'        >> /usr/share/doc/puppet-common/examples/hiera/etc/puppet/puppet.conf
echo 'autosign = true' >> /usr/share/doc/puppet-common/examples/hiera/etc/puppet/puppet.conf

echo "node 'agent1-VirtualBox.local'{" >> /etc/puppet/manifests/site.pp
echo '}'                               >> /etc/puppet/manifests/site.pp

apt-get update 

apt-get install –y ssh

service ssh restart

apt-get install -y puppetmaster 
apt-get install -y puppet 

puppet resource service puppetmaster ensure=running enable=true

apt-get install -y git

git config --global user.name "Your Name"
git config --global user.email "youremail@domain.com"

git config --list

service puppetmaster restart 




