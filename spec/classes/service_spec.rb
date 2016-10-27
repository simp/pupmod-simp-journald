require 'spec_helper'

describe 'journald' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context 'with defaults for all parameters' do
          it { should compile.with_all_deps() }
          it { should contain_class('journald::service') }
          it { should contain_service('systemd-journald').with({
            'ensure' => 'running',
            'enable' => 'true',
            }) }
        end
      end
    end
  end
end
