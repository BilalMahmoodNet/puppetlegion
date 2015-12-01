#monolithic

echo 'q_install=y'                 >> /etc/my_answers.txt
echo 'q_vendor_packages_install=y' >> /etc/my_answers.txt
echo 'q_run_updtvpkg=n'            >> /etc/my_answers.txt

echo 'q_puppetmaster_install=y'             >> /etc/my_answers.txt
echo 'q_all_in_one_install=y'               >> /etc/my_answers.txt
echo 'q_puppet_enterpriseconsole_install=y' >> /etc/my_answers.txt
echo 'q_puppetagent_install=y'              >> /etc/my_answers.txt
echo 'q_database_install=y'                 >> /etc/my_answers.txt

echo 'q_puppetmaster_certname=master-virtualbox.local'    >> /etc/my_answers.txt
echo 'q_puppetmaster_dnsaltnames=master-virtualbox.local' >> /etc/my_answers.txt
echo 'q_pe_check_for_updates=y'                           >> /etc/my_answers.txt
echo 'q_puppetmaster_enterpriseconsole_port=443'          >> /etc/my_answers.txt

echo 'q_puppet_enterpriseconsole_auth_password=netbuilder' >> /etc/my_answers.txt
echo 'q_public_hostname=master-virtualbox.local'           >> /etc/my_answers.txt

echo 'q_puppetagent_certname=agent1-virtualbox.local'      >> /etc/my_answers.txt

echo 'q_puppetdb_database_name=puppetDB'       >> /etc/my_answers.txt
echo 'q_puppetdb_database_password=netbuilder' >> /etc/my_answers.txt
echo 'q_puppetdb_database_user=root'           >> /etc/my_answers.txt



 apt-get update 

 apt-get install –y openssh-client openssh-server 

 apt-get install –y ssh

 service ssh restart

 wget http://192.168.1.15/puppetEnterprise.tar.gz

 tar -xzvf puppetEnterprise.tar.gz

 cd puppet-enterprise-2015.2.3-ubuntu-14.04-amd64/

 sudo ./puppet-enterprise-installer -a /etc/my_answers.txt
 
echo 'path  /resource_type'                               >> /etc/puppetlabs/puppet/auth.conf
echo 'method find, search'                                >> /etc/puppetlabs/puppet/auth.conf
echo 'auth yes'                                           >> /etc/puppetlabs/puppet/auth.conf
echo 'allow pe-internal-dashboard,pe-internal-classifier' >> /etc/puppetlabs/puppet/auth.conf

 puppet resource service puppet master ensure=running enable=true
 
 apt-get install -y git
  
 puppet master 
 
 cd /etc/puppet/
 mkdir git
 cd git

 git clone https://github.com/BilalMahmoodNet/puppetlegion.git

 cp -r puppetlegion/puppet/modules  /etc/puppet/