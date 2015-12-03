#monolithic
sudo -i 



cat /etc/hosts > /etc/newFile
rm /etc/hosts
echo '127.0.0.1       master.local master puppet'  >> /etc/hosts
echo '192.168.1.95    master.local puppet'               >> /etc/hosts
echo '192.168.1.95    master.local'               >> /etc/hosts
cat /etc/newFile               >> /etc/hosts

echo 'autosign = true'         >> /etc/puppet/puppet.conf
echo '*.local'                 >> /etc/puppet/autosign.conf
echo 'agent1.local' >> /etc/puppet/autosign.conf

echo '[master]'        >> /usr/share/doc/puppet-common/examples/hiera/etc/puppet/puppet.conf
echo 'autosign = true' >> /usr/share/doc/puppet-common/examples/hiera/etc/puppet/puppet.conf

echo "node 'agent1.local'{" >> /etc/puppet/manifests/site.pp
echo "include java"                    >> /etc/puppet/manifests/site.pp
echo "include maven"                   >> /etc/puppet/manifests/site.pp
echo "include jenkins"                 >> /etc/puppet/manifests/site.pp
echo "include jira"                    >> /etc/puppet/manifests/site.pp
echo "include git"                     >> /etc/puppet/manifests/site.pp
echo "include nexus"                   >> /etc/puppet/manifests/site.pp
echo '}' 


echo 'q_install=y'                 >> /etc/my_answers.txt
echo 'q_vendor_packages_install=y' >> /etc/my_answers.txt
echo 'q_run_updtvpkg=y'            >> /etc/my_answers.txt

echo 'q_puppetmaster_install=y'             >> /etc/my_answers.txt
echo 'q_all_in_one_install=y'               >> /etc/my_answers.txt
echo 'q_puppet_enterpriseconsole_install=y' >> /etc/my_answers.txt
echo 'q_puppetagent_install=y'              >> /etc/my_answers.txt
echo 'q_database_install=y'                 >> /etc/my_answers.txt

echo 'q_puppetmaster_certname=master.local'    >> /etc/my_answers.txt
echo 'q_puppetmaster_dnsaltnames=pe-puppet,pe-puppet.local,master.local' >> /etc/my_answers.txt
echo 'q_pe_check_for_updates=y'                           >> /etc/my_answers.txt
echo 'q_puppetmaster_enterpriseconsole_port=3000'          >> /etc/my_answers.txt

echo 'q_puppet_enterpriseconsole_auth_password=netbuilder' >> /etc/my_answers.txt
echo 'q_public_hostname=master.local'           >> /etc/my_answers.txt

echo 'q_puppetagent_certname=master.local'      >> /etc/my_answers.txt
echo "q_puppetagent_server=master.local"      >> /etc/my_answers.txt

echo 'q_puppetdb_database_name=puppetDB'       >> /etc/my_answers.txt
echo 'q_puppetdb_database_password=netbuilder' >> /etc/my_answers.txt
echo 'q_puppetdb_database_user=root'           >> /etc/my_answers.txt



 apt-get update 

 apt-get install –y openssh-client openssh-server 

 apt-get install –y ssh

 service ssh restart
 
 mkdir -p /opt/puppetlabs/server/data/staging/pe_repo

 cd /opt/puppetlabs/server/data/staging/pe_repo
 
 wget http://192.168.1.15/puppetEnterprise.tar.gz
 
 tar -xzvf puppetEnterprise.tar.gz

 cd puppet-enterprise-2015.2.3-ubuntu-14.04-amd64/
 
 sudo ./puppet-enterprise-installer -a /etc/my_answers.txt
 
echo 'path  /resource_type'                               >> /etc/puppetlabs/puppet/auth.conf
echo 'method find, search'                                >> /etc/puppetlabs/puppet/auth.conf
echo 'auth yes'                                           >> /etc/puppetlabs/puppet/auth.conf
echo 'allow pe-internal-dashboard,pe-internal-classifier' >> /etc/puppetlabs/puppet/auth.conf

 apt-get install -y git
  
 cd /etc/puppet/
 mkdir git
 cd git

 git clone https://github.com/BilalMahmoodNet/puppetlegion.git

 cp -r puppetlegion/puppet/modules  /etc/puppet/