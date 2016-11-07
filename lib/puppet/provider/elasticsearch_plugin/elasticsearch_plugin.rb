Puppet::Type.type(:elasticsearch_plugin).provide(:elasticsearch_plugin) do
  desc 'elasticsearch plugin provider'

  # Installed plugins:
  #     - No plugin detected in /usr/share/elasticsearch/plugins
  # [root@dnsm ~]# /usr/share/elasticsearch/bin/plugin --install mobz/elasticsearch-head
  # -> Installing mobz/elasticsearch-head...
  # Trying https://github.com/mobz/elasticsearch-head/archive/master.zip...
  # Downloading ..................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................DONE
  # Installed mobz/elasticsearch-head into /usr/share/elasticsearch/plugins/head
  # [root@dnsm ~]# /usr/share/elasticsearch/bin/plugin -l
  # Installed plugins:
  #     - head

  commands :plugin => '/usr/share/elasticsearch/bin/plugin'

  def self.instances
    plugin(['-l']).scan(/ - ([a-z]+)$/).collect do |package|
      debug "instance \""+package[0]+"\""
      new(
        :ensure => :present,
        :name => package[0]
        )
    end
  end

  def self.prefetch(resources)
    resources.keys.each do |name|
      if provider = instances.find{ |db| db.name == name }
        resources[name].provider = provider
      end
    end
  end

  def exists?
    @property_hash[:ensure] == :present || false
  end

  def create
    debug "call create()"+resource[:basename]+"-"+resource[:name]
    plugin(['--install', resource[:basename]+"-"+resource[:name] ])
  end

  def destroy
    debug "call destroy()"
    npm(['--remove', resource[:name] ])
  end

end
