class logstash::config (
  $config_template,
) {
  file { '/etc/logstash/agent.conf':
    ensure  => 'present',
    content => template($config_template),
    notify  => Class['logstash::service'],
    require => Class['logstash::install'],
  }
}
