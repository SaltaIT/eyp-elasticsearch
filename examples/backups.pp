class { 'java': }

class { 'elasticsearch':
  path_repo => [ '/mnt/backups' ],
}
