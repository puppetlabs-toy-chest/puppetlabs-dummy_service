require 'spec_helper'

describe 'dummy_service' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      it { should contain_class('dummy_service') }
      it { should contain_notify('All Service resources replaced with dummy provider') }
      it do
        should contain_file('/bin/systemctl').with_ensure('link')
          .with_target('/bin/true')
      end

      context 'with a service defined without a provider' do
        let(:pre_condition) do
          "
          service { 'implicit': ensure => running }
          "
        end
        it { should contain_service('implicit').with_provider('dummy') }
      end

      context 'with a service defined with an explicit systemd provider' do
        let(:pre_condition) do
          "
          service { 'explicit': ensure => running, provider => systemd }
          "
        end
        it { should contain_service('explicit').with_provider('dummy') }
      end
    end
  end
end
