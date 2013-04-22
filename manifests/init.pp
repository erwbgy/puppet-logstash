class logstash (
  $config_template = 'logstash/agent.conf.erb',
) {
  include logstash::install
  class { 'logstash::config':
    config_template => $config_template,
  }
  include logstash::service
}
