class journald::params {
  $persist_log = true
  $default_options = {
    'Storage'           => 'auto',
    'Compress'          => 'yes',
    'Seal'              => 'yes',
    'SplitMode'         => 'login',
    'SyncIntervalSec'   => '5m',
    'RateLimitInterval' => '30s',
    'RateLimitBurst'    => '10000',
    'MaxFileSec'        => '1month',
    'ForwardToSyslog'   => 'yes',
    'ForwardToKMsg'     => 'no',
    'ForwardToConsole'  => 'no',
    'ForwardToWall'     => 'yes',
    'TTYPath'           => '/dev/console',
    'MaxLevelStore'     => 'debug',
    'MaxLevelSyslog'    => 'debug',
    'MaxLevelKMsg'      => 'err',
    'MaxLevelConsole'   => 'info',
    'MaxLevelWall'      => 'emerg',
  }
}
