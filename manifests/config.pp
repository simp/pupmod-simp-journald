# @summary Configure the `journald` service
#
class journald::config {

  if $::journald::persist_log {
    $journald_dir = 'directory'
  } else {
    $journald_dir = 'absent'
  }

  file { '/var/log/journal/':
    ensure => $journald_dir,
    force  => true,
    owner  => 0,
    group  => 'systemd-journal',
  }

  $defaults = {
    'path'   => '/etc/systemd/journald.conf',
    'notify' => Service['systemd-journald'],
  }

  $ini_settings = {
    'Journal' => $::journald::options,
  }
  create_ini_settings($ini_settings, $defaults)
}
