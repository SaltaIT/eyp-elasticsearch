class elasticsearch::curatorjob(
                              $command='close',
                              $older_than='7',
                              $cron_hour='7',
                              $cron_minute='02'
                            ) inherits elasticsearch::params {

  # # Curator
  #   package { "python-pip":
  #     ensure            => latest,
  #   }->
  #   exec { "pip-curator":
  #     command	=> "pip-python install -q --upgrade elasticsearch-curator",
  #     path	=> "/usr/bin/",
  #     unless	=> "/usr/bin/pip-python list | /bin/grep -c elasticsearch-curator",
  #   }->
  #   class { 'curator': }
  #   curator::job { 'logstash_close':
  #     command	=> 'close',
  #     older_than	=> $cns::profiles::cns_elk::curator_retain,
  #     cron_hour	=> 7,
  #     cron_minute	=> 02,
  #   }

  include python

  pythonpip { 'elasticsearch-curator':
    ensure  => 'present',
    require => Class['python'],
  }

  ->

  class { 'curator': }

  ->

  curator::job { 'logstash_close':
    command	=> $command,
    older_than	=> $older_than,
    cron_hour	=> $cron_hour,
    cron_minute	=> $cron_minute,
  }

}
