class elasticsearch(
                      $manage_package        = true,
                      $package_ensure        = 'installed',
                      $manage_service        = true,
                      $manage_docker_service = true,
                      $service_ensure        = 'running',
                      $service_enable        = true,
                      $data                  = true,
                      $shards                = '1',
                      $master                = true,
                      $replicas              = '0',
                      $nodename              = $::hostname,
                      $clustername           = 'elasticsearchcluster',
                      $network_host          = undef,
                      $discovery_multicast   = false,
                      $discovery_unicast     = [ '127.0.0.1:9300' ],
                      $path_data             = '/var/lib/elasticsearch',
                      $path_logs             = '/var/log/elasticsearch',
                    ) inherits elasticsearch::params{

  class { '::elasticsearch::install': }
  -> class { '::elasticsearch::config': }
  ~> class { '::elasticsearch::service': }
  -> Class['::elasticsearch']

}
