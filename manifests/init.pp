class elasticsearch(
                            $manage_package        = true,
                            $package_ensure        = 'installed',
                            $manage_service        = true,
                            $manage_docker_service = true,
                            $service_ensure        = 'running',
                            $service_enable        = true,
                          ) inherits elasticsearch::params{

  class { '::elasticsearch::install': }
  -> class { '::elasticsearch::config': }
  ~> class { '::elasticsearch::service': }
  -> Class['::elasticsearch']

}
