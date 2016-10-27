# manage the systemd-journald service
class journald::service {
  service { 'systemd-journald':
    ensure => running,
    enable => true,
  }
}
