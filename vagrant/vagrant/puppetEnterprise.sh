#monolithic

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
echo "include maven"                   >> /etc/puppet/manifests/site.pp
echo "include jenkins"                 >> /etc/puppet/manifests/site.pp
echo "include jira"                    >> /etc/puppet/manifests/site.pp
echo "include git"                     >> /etc/puppet/manifests/site.pp
echo "include nexus"                   >> /etc/puppet/manifests/site.pp
echo '}'                               >> /etc/puppet/manifests/site.pp






echo 'q_all_in_one_install=n' >> /etc/my_answers.txt
echo 'q_install=y' >> /etc/my_answers.txt
echo 'q_pe_database=n' >> /etc/my_answers.txt
echo 'q_database_install=y' >> /etc/my_answers.txt
echo 'q_puppet_symlinks_install=y' >> /etc/my_answers.txt
echo 'q_vendor_packages_install=y' >> /etc/my_answers.txt
echo 'q_run_updtvpkg=n' >> /etc/my_answers.txt

 echo 'q_puppetmaster_install=y' >> /etc/my_answers.txt
 echo 'q_puppetdb_hostname=master-virtualbox.local' >> /etc/my_answers.txt
 echo 'q_puppetdb_install=y' >> /etc/my_answers.txt
 echo 'q_puppetdb_port=8081' >> /etc/my_answers.txt
 echo 'q_puppet_enterpriseconsole_install=n' >> /etc/my_answers.txt
 echo 'q_puppetagent_install=y' >> /etc/my_answers.txt
 echo 'q_puppet_cloud_install=n' >> /etc/my_answers.txt

echo 'q_puppetmaster_certname=master-virtualbox.local' >> /etc/my_answers.txt
echo 'q_puppetmaster_dnsaltnames=master-virtualbox.local' >> /etc/my_answers.txt
echo 'q_puppetmaster_enterpriseconsole_hostname=master-virtualbox.local' >> /etc/my_answers.txt
echo 'q_puppetmaster_enterpriseconsole_port=3000' >> /etc/my_answers.txt

echo 'q_puppetagent_certname=agent1-virtualbox.local' >> /etc/my_answers.txt
echo 'q_puppetagent_server=master-virtualbox.local' >> /etc/my_answers.txt
echo 'q_fail_on_unsuccessful_master_lookup=y' >> /etc/my_answers.txt
echo 'q_skip_master_verification=n' >> /etc/my_answers.txt

echo 'q_database_host=master-virtualbox.local' >> /etc/my_answers.txt
echo 'q_database_port=8081' >> /etc/my_answers.txt
echo 'q_database_root_password=' >> /etc/my_answers.txt
echo 'q_database_root_user=' >> /etc/my_answers.txt
echo 'q_puppetdb_database_name=' >> /etc/my_answers.txt
echo 'q_puppetdb_database_password=' >> /etc/my_answers.txt
echo 'q_puppet_enterpriseconsole_auth_database_name=' >> /etc/my_answers.txt
echo 'q_puppet_enterpriseconsole_auth_database_user=' >> /etc/my_answers.txt
echo 'q_puppet_enterpriseconsole_auth_database_password=' >> /etc/my_answers.txt
 
echo 'q_pe_check_for_updates=y' >> /etc/my_answers.txt
 
 apt-get update 

 apt-get install –y openssh-client openssh-server 

 apt-get install –y ssh

 service ssh restart

 wget http://192.168.1.15/puppetEnterprise.tar.gz

 tar -xzvf puppetEnterprise.tar.gz

 cd puppet-enterprise-2015.2.3-ubuntu-14.04-amd64/

 sudo ./puppet-enterprise-installer -a /etc/my_answers.txt
 
 service puppetmaster restart
 
 cd /etc/puppet/
 mkdir git
 cd git

 git clone https://github.com/BilalMahmoodNet/puppetlegion.git

 cp -r puppetlegion/puppet/modules  /etc/puppet/