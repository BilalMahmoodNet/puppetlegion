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
echo "include java"                    >> /etc/puppet/manifests/site.pp
#echo "include maven"                   >> /etc/puppet/manifests/site.pp
#echo "include jenkins"                 >> /etc/puppet/manifests/site.pp
#echo "include jira"                    >> /etc/puppet/manifests/site.pp
#echo "include git"                     >> /etc/puppet/manifests/site.pp
echo "include nexus"                   >> /etc/puppet/manifests/site.pp
echo '}'                               >> /etc/puppet/manifests/site.pp

apt-get update 

apt-get install –y ssh

service ssh restart

apt-get install -y puppetmaster 
apt-get install -y puppet 

puppet resource service puppetmaster ensure=running enable=true

apt-get install -y git

service puppetmaster restart 

cd /etc/puppet/
mkdir git
cd git

git clone https://github.com/BilalMahmoodNet/puppetlegion.git

cp -r puppetlegion/puppet/modules  /etc/puppet/




