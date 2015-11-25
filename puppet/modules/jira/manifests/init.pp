class jira {

#$install = $jira::manifests::install,
#$config  = $jira::manifests::config,

class { 'jira::install':} -> Class['jira']

}
