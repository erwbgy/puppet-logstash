class logstash::install {
  package { 'logstash':
    ensure => 'installed',
  }
}
