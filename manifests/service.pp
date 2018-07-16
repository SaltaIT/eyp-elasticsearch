class elasticsearch::service inherits elasticsearch {

  #
  validate_bool($elasticsearch::manage_docker_service)
  validate_bool($elasticsearch::manage_service)
  validate_bool($elasticsearch::service_enable)

  validate_re($elasticsearch::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${elasticsearch::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $elasticsearch::manage_docker_service)
  {
    if($elasticsearch::manage_service)
    {
      service { $elasticsearch::params::service_name:
        ensure => $elasticsearch::service_ensure,
        enable => $elasticsearch::service_enable,
      }
    }
  }
}
