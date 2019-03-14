class elasticsearch(
                      $manage_package        = true,
                      $package_ensure        = 'installed',
                      $manage_service        = true,
                      $manage_docker_service = true,
                      $service_ensure        = 'running',
                      $service_enable        = true,
                      $clustername           = 'elasticsearchcluster',
                      $nodename              = $::hostname,
                      $network_host          = undef,
                      $discovery_unicast     = [ '127.0.0.1:9300' ],
                      $path_data             = '/var/lib/elasticsearch',
                      $path_logs             = '/var/log/elasticsearch',
                      $path_repo             = undef,
                      $use_eypjava           = true,
                    ) inherits elasticsearch::params{

  class { '::elasticsearch::install': }
  -> class { '::elasticsearch::config': }
  ~> class { '::elasticsearch::service': }
  -> Class['::elasticsearch']

}
