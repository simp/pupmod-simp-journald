require 'spec_helper'

describe 'journald' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end
    context "with defaults on #{os}" do
      it { should compile.with_all_deps }
      it { should contain_class('journald').with(options:
        [ 'Storage'           => 'auto',
          'Compress'          => 'yes',
          'Seal'              => 'yes',
          'SplitMode'         => 'login',
          'SyncIntervalSec'   => '5m',
          'RateLimitInterval' => '30s',
          'RateLimitBurst'    => '10000',
          'MaxFileSec'        => '1month',
          'ForwardToSyslog'   => 'yes',
          'ForwardToKMsg'     => 'yes',
          'ForwardToConsole'  => 'no',
          'TTYPath'           => '/dev/console',
          'MaxLevelStore'     => 'debug',
          'MaxLevelSyslog'    => 'debug',
          'MaxLevelKMsg'      => 'notice',
          'MaxLevelConsole'   => 'info']
        )
      }
    end
  end
end
