# elasticsearch

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with elasticsearch](#setup)
    * [What elasticsearch affects](#what-elasticsearch-affects)
    * [Beginning with elasticsearch](#beginning-with-elasticsearch)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

elasticsearch 6.3 management

## Module Description

This module installs elasticsearch 6.3

## Setup

### What elasticsearch affects

* Manages:
  - elasticsearch package
  - elasticsearch configuration file: **/etc/elasticsearch/elasticsearch.yml**
  - elasticsearch service

### Beginning with elasticsearch

Basic standalone server:

```puppet
class { 'elasticsearch': }
```

## Usage

TODO

## Reference

### elasticsearch

* **manage_package**:        = true,
* **package_ensure**:        = 'installed',
* **manage_service**:        = true,
* **manage_docker_service**: = true,
* **service_ensure**:        = 'running',
* **service_enable**:        = true,
* **data**:                  = true,
* **shards**:                = '1',
* **master**:                = true,
* **replicas**:              = '0',
* **nodename**:              = $::hostname,
* **clustername**:           = 'elasticsearchcluster',
* **network_host**:          = undef,
* **disable_dynamic**:       = true,
* **discovery_multicast**:   = false,
* **discovery_unicast**:     = [ '127.0.0.1:9300' ],
* **path_data**:             = '/var/lib/elasticsearch',
* **path_logs**:             = '/var/log/elasticsearch',

## Limitations

CentOS 7 (and compatibles) only

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
