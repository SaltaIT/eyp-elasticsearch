class elasticsearch::install inherits elasticsearch {

  if($elasticsearch::manage_package)
  {
    package { $elasticsearch::params::package_name:
      ensure   => $elasticsearch::package_ensure,
      source   => $elasticsearch::params::package_url,
      provider => $elasticsearch::params::package_provider,
    }

    if($elasticsearch::use_eypjava)
    {
      Package[$elasticsearch::params::package_name] {
        require => Class['::java'],
      }
    }
  }

}
