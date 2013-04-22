class logstash::service {
  service { 'logstash-agent':
    ensure => 'running',
    enable => true,
  }
}
