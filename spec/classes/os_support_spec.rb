require 'spec_helper'
describe 'elasticsearch' do

  context 'CentOS 6' do

    let (:params) { { 'nodename' => 'centos6' } }

    let :facts do
    {
      :osfamily => 'RedHat',
      :operatingsystem => 'CentOS',
      :operatingsystemrelease => '6.3',
    }
    end

    it { should contain_class('elasticsearch') }

    it { should contain_package('elasticsearch')}

    it { should contain_service('elasticsearch')}
  end

  context 'CentOS 7' do

    let (:params) { { 'nodename' => 'centos6' } }

    let :facts do
    {
      :osfamily => 'RedHat',
      :operatingsystem => 'CentOS',
      :operatingsystemrelease => '7.3',
    }
    end

    it { should contain_class('elasticsearch') }

    it { should contain_package('elasticsearch')}

    it { should contain_service('elasticsearch')}
  end

  context 'unsupported OS' do
    let :facts do
    {
            :osfamily => 'SOFriki',
    }
    end

    it {
      expect { should raise_error(Puppet::Error) }
    }
  end
end
