class elasticsearch::params {

  $package_name='elasticsearch'
  $service_name='elasticsearch'

  case $::osfamily
  {
    'redhat':
    {
      case $::operatingsystemrelease
      {
        /^7.*$/:
        {
          $package_url="https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.1.rpm"
          $package_provider = 'rpm'
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    'Debian':
    {
      case $::operatingsystem
      {
        'Ubuntu':
        {
          case $::operatingsystemrelease
          {
            default: { fail("Unsupported Ubuntu version! - ${::operatingsystemrelease}")  }
          }
        }
        'Debian': { fail('Unsupported')  }
        default: { fail('Unsupported Debian flavour!')  }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
