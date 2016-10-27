# Configure journald.conf
class journald::config {
  $merged_options = merge($::journald::params::default_options, $::journald::options)

  if $::journald::persist_log {
    $journald_dir = 'directory'
  } else {
    $journald_dir = 'absent'
  }

  file { '/var/log/journal/':
    ensure => $journald_dir,
    force  => true,
    owner  => 'root',
    group  => 'systemd-journal',
  }

  file { '/etc/systemd/journald.conf':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/journald.conf.erb"),
  }
}
