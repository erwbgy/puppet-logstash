# logstash

Install the logstash agent with a configuration file.

To use just:

    include logstash

and then specify the location of the config template in hiera - for example:

    logstash::config_template: '/etc/puppet/templates/logstash/agent.conf.erb'

Alternatively you call it as a parameterised class:

    class { 'logstash':
      config_template => '/etc/puppet/templates/logstash/agent.conf.erb'
    }

## Installation

Installation assumes that an 'logstash' package is available from the package
repository and that the agent configuration file is /etc/logstash/agent.conf.
See http://download.bloonix.de/ for pre-built packages for RedHat-like and
Debian-like hosts.

## Configuration

See http://www.logstash.net/docs/1.1.9/ for documentation on logstash configuration.

By default the following template is used to give you a starting point:

    input {                                                                 
      tcp {                                                                 
        format => "json_event"                                              
        host => "<%= @fqdn %>"
        port => 5544                                                        
        type => "awesant"                                                   
      }                                                                     
    }                                                                       
    filter {                                                                
      grok {                                                                
        match => [ "@timestamp", "^%{DATE_EU:date}" ]                       
        type => "awesant"                                                   
      }                                                                     
    }
    output {
      file {
        tags => 'syslog-messages'
        message_format => "%{@message}"
        path => "/var/log/logstash/syslog/messages-%{date}.log"
      }
      file {
        tags => 'syslog-secure'
        message_format => "%{@message}"
        path => "/var/log/logstash/syslog/secure-%{date}.log"
      }
    }

You can use any facter facts in your template - for example 'fqdn' or a custom fact like 'logstash_host'.

## Support

License: Apache License, Version 2.0

GitHub URL: https://github.com/erwbgy/puppet-tomcat
