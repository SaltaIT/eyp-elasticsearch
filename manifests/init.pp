#
class elasticsearch (
                      $data                = true,
                      $shards              = '1',
                      $master              = true,
                      $replicas            = '0',
                      $nodename            = $::hostname,
                      $clustername         = 'elasticsearchcluster',
                      $network_host        = undef,
                      $disable_dynamic     = true,
                      $discovery_multicast = false,
                      $discovery_unicast   = [ '127.0.0.1:9300' ],
                    ) inherits elasticsearch::params {

  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  exec { 'check java elasticsearch':
    command => 'which java',
    unless  => 'which java',
  }

  yumrepo { 'elasticsearch-1.7':
    baseurl  => 'http://packages.elasticsearch.org/elasticsearch/1.7/centos',
    descr    => 'Elasticsearch repository',
    enabled  => '1',
    gpgcheck => '0',
    gpgkey   => 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch',
  }

  package { 'elasticsearch':
    ensure  => 'installed',
    require => [ Yumrepo['elasticsearch-1.7'], Exec['check java elasticsearch']],
  }

  file { '/etc/elasticsearch/elasticsearch.yml':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/elasticsearch.erb"),
    require => Package['elasticsearch'],
    backup  => '.back',
    notify  => Service['elasticsearch'],
  }

  service { 'elasticsearch':
    ensure  => 'running',
    enable  => true,
    require => [ Package['elasticsearch'], File['/etc/elasticsearch/elasticsearch.yml'] ],
  }

}
