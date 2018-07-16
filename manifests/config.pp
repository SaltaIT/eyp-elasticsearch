class elasticsearch::config inherits elasticsearch {

  file { '/etc/elasticsearch/elasticsearch.yml':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/elasticsearch.erb"),
    backup  => '.back',
  }
}
