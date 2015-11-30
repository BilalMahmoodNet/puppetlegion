class jira {

class { 'jira::install':} -> Class['jira']

}
