define elasticsearch::plugin(
                              $esplugin=$name,
                              $ensure = 'present',
                            ) {

  validate_re($ensure, [ '^present$', '^absent$'], 'Not a supported ensure: present/absent')

  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  if($ensure=='present')
  {
    exec { "ES plugin install ${esplugin}":
      cwd     => '/usr/share/elasticsearch/',
      command => "bin/plugin install ${esplugin}",
    }
  }
  else
  {
    #absent

  }


}
