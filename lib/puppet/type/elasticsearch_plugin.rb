Puppet::Type.newtype(:elasticsearch_plugin) do
  @doc = 'Manage elasticsearch plugins'

  ensurable

  autorequire(:package) do
    'elasticsearch'
  end

  newparam(:name, :namevar => true) do
    desc 'plugin to manage'

    validate do |value|
      unless value.is_a?(String)
        raise Pupper::Error,
          "not a string, modafuca"
      end
    end
  end

  newparam(:basename, :namevar => true) do
    desc 'plugins basename to manage'

    validate do |value|
      unless value.is_a?(String)
        raise Pupper::Error,
          "not a string, modafuca"
      end
    end
  end

end
